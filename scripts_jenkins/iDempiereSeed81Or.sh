# exit 0 # Release time

REPO=/var/lib/jenkins/workspace/iDempiere8.1Daily
export USER=reference
# export NLS_LANG=AMERICAN_AMERICA.UTF8
cd /tmp
rm -f Adempiere.dmp
# unzip -u ${REPO}/org.adempiere.server-feature/data/seed/Adempiere.jar
unzip -u /home/idempiere/seed81/Adempiere.jar
ls -l /tmp/Adempiere.dmp
docker_start.sh
docker_cp.sh /tmp/Adempiere.dmp
docker_exec.sh chown oracle:dba /tmp/Adempiere.dmp

export IDEMPIERE_DB_SERVER=172.16.7.1
export IDEMPIERE_DB_PATH=oracle
export IDEMPIERE_DB_NAME=xe
export PASS=idempiere
export PASSSYSTEM=oracle
export LD_LIBRARY_PATH=/usr/local/bin

echo "
SET ECHO ON
SET SERVEROUTPUT ON
PURGE RECYCLEBIN;
PURGE USER_RECYCLEBIN;
DROP USER $USER CASCADE
/
CREATE USER $USER IDENTIFIED BY idempiere
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP
    PROFILE DEFAULT
    ACCOUNT UNLOCK
/   
GRANT CONNECT TO $USER
/
GRANT DBA TO $USER
/
GRANT RESOURCE TO $USER
/
GRANT UNLIMITED TABLESPACE TO $USER
/   
ALTER USER $USER DEFAULT ROLE CONNECT, RESOURCE, DBA
/   
GRANT CREATE TABLE TO $USER
/
CREATE OR REPLACE DIRECTORY ADEMPIERE_DATA_PUMP_DIR AS '/tmp'
/
EXIT 
" | sqlplus system/$PASSSYSTEM@$IDEMPIERE_DB_SERVER/$IDEMPIERE_DB_NAME

impdp system/$PASSSYSTEM@$IDEMPIERE_DB_SERVER/$IDEMPIERE_DB_NAME DIRECTORY=ADEMPIERE_DATA_PUMP_DIR DUMPFILE=Adempiere.dmp REMAP_SCHEMA=reference:$USER

echo "
SET serveroutput ON
BEGIN
        DBA_Recompile(NULL);
END;
/
" | sqlplus $USER/$PASS@$IDEMPIERE_DB_SERVER/$IDEMPIERE_DB_NAME


# or_syncApplied.sh
#!/bin/sh

# script to apply new migration scripts to oracle xe 
# converted to ora from syncApplied.sh by Carlos Ruiz 
# taking stuff also from migrate_oracle.sh
# 
# Contributed by Dirk Niemeyer - a42niem

# Change the following to your needs
MIGRATIONDIR=${REPO}/migration
HOST=$IDEMPIERE_DB_SERVER
DATABASE=$IDEMPIERE_DB_NAME

MSGERROR=""
APPLIED=N
cd $MIGRATIONDIR
for i in i8.1/oracle/*.sql
do
    OUTFILE=/tmp/`basename "$i" .sql`_or.out
    cat "$i" | sqlplus $USER/$PASS@$HOST/$DATABASE 2>&1 | tee "$OUTFILE"
    # sleep 5
    if fgrep "ORA-
TNS-
PLS-
SP2-" "$OUTFILE" > /dev/null 2>&1
    then
        MSGERROR="$MSGERROR
**** ERROR ON FILE $OUTFILE - Please verify ****"
    else
        rm "$OUTFILE"
    fi
    APPLIED=Y
    # sleep 1
done
if [ x$APPLIED = xY ]
then
    for i in processes_post_migration/oracle/*.sql
    do
        OUTFILE=/tmp/`basename "$i" .sql`_or.out
	cat "$i" | sqlplus $USER/$PASS@$HOST/$DATABASE 2>&1 | tee "$OUTFILE"
        # sleep 5
        if fgrep "ORA-
TNS-
PLS-
SP2-" "$OUTFILE" > /dev/null 2>&1
        then
            MSGERROR="$MSGERROR
**** ERROR ON FILE $OUTFILE - Please verify ****"
        else
            rm "$OUTFILE"
        fi
        # sleep 1
    done
else
    echo "Database is up to date, no scripts to apply"
fi
if [ -n "$MSGERROR" ]
then
    echo "$MSGERROR"
    docker_stop.sh
    exit 1
fi

# update build ID on db version
TODAY=`date +%Y%m%d`
echo "update ad_system set lastmigrationscriptapplied = '${TODAY}_Daily8.1Build' || $BUILD_NUMBER || '/' || lastmigrationscriptapplied;" | sqlplus $USER/$PASS@$HOST/$DATABASE

# Recreate seed
cd /tmp
expdp $USER/$PASS@$IDEMPIERE_DB_SERVER/$IDEMPIERE_DB_NAME DIRECTORY=ADEMPIERE_DATA_PUMP_DIR DUMPFILE=ExpDat$USER.dmp LOGFILE=ExpDat$USER.log SCHEMAS=$USER EXCLUDE=STATISTICS REUSE_DUMPFILES=Y
rm -f Adempiere.dmp Adempiere.log ExpDat$USER.dmp ExpDat$USER.log
docker_get.sh /tmp/ExpDat$USER.dmp
docker_get.sh /tmp/ExpDat$USER.log
cp -p ExpDat$USER.dmp Adempiere.dmp
cp -p ExpDat$USER.log Adempiere.log
chmod 644 Adempiere.dmp Adempiere.log
rm ${REPO}/org.adempiere.server-feature/data/seed/Adempiere.jar
zip -9 ${REPO}/org.adempiere.server-feature/data/seed/Adempiere.jar Adempiere.log Adempiere.dmp
rm Adempiere.log Adempiere.dmp
mkdir -p /tmp/seed81
rm -f /tmp/seed81/Adempiere.jar
cp -p ${REPO}/org.adempiere.server-feature/data/seed/Adempiere.jar /tmp/seed81/

docker_stop.sh
exit 0
