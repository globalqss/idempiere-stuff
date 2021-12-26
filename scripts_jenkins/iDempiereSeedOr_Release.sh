wget -O /var/lib/jenkins/workspace/iDempiereDaily/org.adempiere.server-feature/data/seed/Adempiere.jar https://raw.githubusercontent.com/idempiere/binary.file/master/database/8.2/Adempiere.jar

REPO=/var/lib/jenkins/workspace/iDempiereDaily
cd /tmp
rm -f Adempiere.dmp
unzip -u ${REPO}/org.adempiere.server-feature/data/seed/Adempiere.jar
ls -l /tmp/Adempiere.dmp
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
echo "UPDATE AD_MIGRATIONSCRIPT
SET AD_MIGRATIONSCRIPT_ID =
AD_MIGRATIONSCRIPT_ID-((SELECT min(ad_migrationscript_id) FROM ad_migrationscript WHERE ad_migrationscript_id>=1000000)
-(SELECT max(ad_migrationscript_id)
FROM ad_migrationscript WHERE ad_migrationscript_id<1000000)-1)
WHERE AD_MIGRATIONSCRIPT_ID>=1000000;
" | sqlplus $ADEMPIERE_DB_USER/$ADEMPIERE_DB_PASSWORD@$ADEMPIERE_DB_SERVER/$ADEMPIERE_DB_NAME

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

docker_stop.sh
exit 0
