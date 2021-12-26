wget -O /var/lib/jenkins/workspace/iDempiereDaily/org.adempiere.server-feature/data/seed/Adempiere_pg.jar https://raw.githubusercontent.com/idempiere/binary.file/master/database/8.2/Adempiere_pg.jar

REPO=/var/lib/jenkins/workspace/iDempiereDaily

export IDEMPIERE_HOME="$REPO"
export ADEMPIERE_DB_NAME=idempiere
export ADEMPIERE_DB_SERVER=localhost
export ADEMPIERE_DB_PORT=5432
export ADEMPIERE_DB_USER=adempiere
export ADEMPIERE_DB_PASSWORD=idempiere
export ADEMPIERE_DB_PATH=postgresql

cd /tmp
rm Adempiere_pg.dmp
unzip -u ${REPO}/org.adempiere.server-feature/data/seed/Adempiere_pg.jar
ls -l /tmp/Adempiere_pg.dmp

export PGPASSWORD="$ADEMPIERE_DB_PASSWORD"
dropdb -h $ADEMPIERE_DB_SERVER -p $ADEMPIERE_DB_PORT -U $ADEMPIERE_DB_USER $ADEMPIERE_DB_NAME
createdb -E UNICODE -O $ADEMPIERE_DB_USER -U $ADEMPIERE_DB_USER -h $ADEMPIERE_DB_SERVER -p $ADEMPIERE_DB_PORT $ADEMPIERE_DB_NAME

PSQLCMD="psql -h $ADEMPIERE_DB_SERVER -p $ADEMPIERE_DB_PORT -d $ADEMPIERE_DB_NAME -U $ADEMPIERE_DB_USER"
$PSQLCMD -f /tmp/Adempiere_pg.dmp

echo 'CREATE EXTENSION "uuid-ossp";' | $PSQLCMD

# SyncDB.sh
bash "$REPO/org.adempiere.server-feature/utils.unix/$ADEMPIERE_DB_PATH/SyncDB.sh" "$ADEMPIERE_DB_USER" "$ADEMPIERE_DB_PASSWORD" "$ADEMPIERE_DB_PATH" "$@"

if [ $? -ne 0 ]
then
    exit 1
fi

# update build ID on db version
TODAY=`date +%Y%m%d`
echo "UPDATE AD_MIGRATIONSCRIPT
SET AD_MIGRATIONSCRIPT_ID =
AD_MIGRATIONSCRIPT_ID-((SELECT min(ad_migrationscript_id) FROM ad_migrationscript WHERE ad_migrationscript_id>=1000000)
-(SELECT max(ad_migrationscript_id) FROM ad_migrationscript WHERE ad_migrationscript_id<1000000)-1)
WHERE AD_MIGRATIONSCRIPT_ID>=1000000" | $PSQLCMD

# Recreate seed
cd /tmp
pg_dump -U $ADEMPIERE_DB_USER -h $ADEMPIERE_DB_SERVER -p $ADEMPIERE_DB_PORT $ADEMPIERE_DB_NAME > ExpDat${ADEMPIERE_DB_NAME}_pg.dmp
mv ExpDat${ADEMPIERE_DB_NAME}_pg.dmp Adempiere_pg.dmp
rm ${REPO}/org.adempiere.server-feature/data/seed/Adempiere_pg.jar
zip -9 ${REPO}/org.adempiere.server-feature/data/seed/Adempiere_pg.jar Adempiere_pg.dmp
rm -f Adempiere_pg.dmp

exit 0
