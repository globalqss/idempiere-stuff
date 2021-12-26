# exit 0 # Release time

REPO=/var/lib/jenkins/workspace/iDempiere9Daily

export IDEMPIERE_HOME="$REPO"
export ADEMPIERE_DB_NAME=idempiere
export ADEMPIERE_DB_SERVER=localhost
export ADEMPIERE_DB_PORT=5432
export ADEMPIERE_DB_USER=adempiere
export ADEMPIERE_DB_PASSWORD=idempiere
export ADEMPIERE_DB_PATH=postgresql

cd /tmp
rm Adempiere_pg.dmp
# unzip -u ${REPO}/org.adempiere.server-feature/data/seed/Adempiere_pg.jar
unzip -u /home/idempiere/seed9/Adempiere_pg.jar
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
echo "update ad_system set lastmigrationscriptapplied = '${TODAY}_Daily9Build' || $BUILD_NUMBER || '/' || lastmigrationscriptapplied" | $PSQLCMD

# Recreate seed
cd /tmp
pg_dump -U $ADEMPIERE_DB_USER -h $ADEMPIERE_DB_SERVER -p $ADEMPIERE_DB_PORT $ADEMPIERE_DB_NAME > ExpDat${ADEMPIERE_DB_NAME}_pg.dmp
mv ExpDat${ADEMPIERE_DB_NAME}_pg.dmp Adempiere_pg.dmp
rm ${REPO}/org.adempiere.server-feature/data/seed/Adempiere_pg.jar
zip -9 ${REPO}/org.adempiere.server-feature/data/seed/Adempiere_pg.jar Adempiere_pg.dmp
rm Adempiere_pg.dmp
mkdir -p /tmp/seed9
rm -f /tmp/seed9/Adempiere_pg.jar
cp -p ${REPO}/org.adempiere.server-feature/data/seed/Adempiere_pg.jar /tmp/seed9/

exit 0
