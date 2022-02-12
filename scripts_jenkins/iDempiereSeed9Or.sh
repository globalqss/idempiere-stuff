# exit 0 # Release time

REPO=/var/lib/jenkins/workspace/iDempiere9Daily
cd /tmp
rm -f Adempiere.dmp
# unzip -u ${REPO}/org.adempiere.server-feature/data/seed/Adempiere.jar
unzip -u /home/idempiere/seed9/Adempiere.jar
ls -l /tmp/Adempiere.dmp
# export NLS_LANG=AMERICAN_AMERICA.UTF8
docker_start.sh
docker_cp.sh /tmp/Adempiere.dmp
docker_exec.sh chown oracle:dba /tmp/Adempiere.dmp

export IDEMPIERE_HOME="$REPO"
export ADEMPIERE_DB_USER=reference
export ADEMPIERE_DB_SERVER=172.16.7.1
export ADEMPIERE_DB_PORT=1521
export ADEMPIERE_DB_PATH=oracle
export ADEMPIERE_DB_NAME=xe
export ADEMPIERE_DB_PASSWORD=idempiere
export ADEMPIERE_DB_SYSTEM=oracle
export LD_LIBRARY_PATH=/usr/local/bin

echo "
SET ECHO ON
SET SERVEROUTPUT ON
PURGE RECYCLEBIN;
PURGE USER_RECYCLEBIN;
DROP USER $ADEMPIERE_DB_USER CASCADE
/
CREATE USER $ADEMPIERE_DB_USER IDENTIFIED BY idempiere
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP
    PROFILE DEFAULT
    ACCOUNT UNLOCK
/   
GRANT CONNECT TO $ADEMPIERE_DB_USER
/
GRANT DBA TO $ADEMPIERE_DB_USER
/
GRANT RESOURCE TO $ADEMPIERE_DB_USER
/
GRANT UNLIMITED TABLESPACE TO $ADEMPIERE_DB_USER
/   
ALTER USER $ADEMPIERE_DB_USER DEFAULT ROLE CONNECT, RESOURCE, DBA
/   
GRANT CREATE TABLE TO $ADEMPIERE_DB_USER
/
CREATE OR REPLACE DIRECTORY ADEMPIERE_DATA_PUMP_DIR AS '/tmp'
/
EXIT 
" | sqlplus system/$ADEMPIERE_DB_SYSTEM@$ADEMPIERE_DB_SERVER/$ADEMPIERE_DB_NAME

impdp system/$ADEMPIERE_DB_SYSTEM@$ADEMPIERE_DB_SERVER/$ADEMPIERE_DB_NAME DIRECTORY=ADEMPIERE_DATA_PUMP_DIR DUMPFILE=Adempiere.dmp REMAP_SCHEMA=reference:$ADEMPIERE_DB_USER

echo "
SET serveroutput ON
BEGIN
        DBA_Recompile(NULL);
END;
/
" | sqlplus $ADEMPIERE_DB_USER/$ADEMPIERE_DB_PASSWORD@$ADEMPIERE_DB_SERVER/$ADEMPIERE_DB_NAME

# SyncDB.sh
bash "$REPO/org.adempiere.server-feature/utils.unix/$ADEMPIERE_DB_PATH/SyncDB.sh" "$ADEMPIERE_DB_USER" "$ADEMPIERE_DB_PASSWORD" "$ADEMPIERE_DB_PATH" "$@"

if [ $? -ne 0 ]
then
    docker_stop.sh
    exit 1
fi

# update build ID on db version
TODAY=`date +%Y%m%d`
echo "update ad_system set lastmigrationscriptapplied = '${TODAY}_Daily9Build' || $BUILD_NUMBER || '/' || lastmigrationscriptapplied;" | sqlplus $ADEMPIERE_DB_USER/$ADEMPIERE_DB_PASSWORD@$ADEMPIERE_DB_SERVER/$ADEMPIERE_DB_NAME

# Recreate seed
cd /tmp
expdp $ADEMPIERE_DB_USER/$ADEMPIERE_DB_PASSWORD@$ADEMPIERE_DB_SERVER/$ADEMPIERE_DB_NAME DIRECTORY=ADEMPIERE_DATA_PUMP_DIR DUMPFILE=ExpDat$ADEMPIERE_DB_USER.dmp LOGFILE=ExpDat$ADEMPIERE_DB_USER.log SCHEMAS=$ADEMPIERE_DB_USER EXCLUDE=STATISTICS REUSE_DUMPFILES=Y
rm -f Adempiere.dmp Adempiere.log ExpDat$ADEMPIERE_DB_USER.dmp ExpDat$ADEMPIERE_DB_USER.log
docker_get.sh /tmp/ExpDat$ADEMPIERE_DB_USER.dmp
docker_get.sh /tmp/ExpDat$ADEMPIERE_DB_USER.log
cp -p ExpDat$ADEMPIERE_DB_USER.dmp Adempiere.dmp
cp -p ExpDat$ADEMPIERE_DB_USER.log Adempiere.log
chmod 644 Adempiere.dmp Adempiere.log
rm ${REPO}/org.adempiere.server-feature/data/seed/Adempiere.jar
zip -9 ${REPO}/org.adempiere.server-feature/data/seed/Adempiere.jar Adempiere.log Adempiere.dmp
rm Adempiere.log Adempiere.dmp
mkdir -p /tmp/seed9
rm -f /tmp/seed9/Adempiere.jar
cp -p ${REPO}/org.adempiere.server-feature/data/seed/Adempiere.jar /tmp/seed9/

docker_stop.sh
exit 0
