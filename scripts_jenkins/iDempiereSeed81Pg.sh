# exit 0 # Release time

REPO=/var/lib/jenkins/workspace/iDempiere8.1Daily
USER=adempiere
cd /tmp
rm Adempiere_pg.dmp
# unzip -u ${REPO}/org.adempiere.server-feature/data/seed/Adempiere_pg.jar
unzip -u /home/idempiere/seed81/Adempiere_pg.jar
ls -l /tmp/Adempiere_pg.dmp

export IDEMPIERE_DB_SERVER=localhost
export IDEMPIERE_DB_PORT=5432
export IDEMPIERE_DB_NAME=idempiere
export PGPASSWORD=idempiere
dropdb -h $IDEMPIERE_DB_SERVER -p $IDEMPIERE_DB_PORT -U $USER $IDEMPIERE_DB_NAME
createdb -E UNICODE -O $USER -U $USER -h $IDEMPIERE_DB_SERVER -p $IDEMPIERE_DB_PORT $IDEMPIERE_DB_NAME

PSQLCMD="psql -h $IDEMPIERE_DB_SERVER -p $IDEMPIERE_DB_PORT -d $IDEMPIERE_DB_NAME -U $USER"
$PSQLCMD -f /tmp/Adempiere_pg.dmp

echo 'CREATE EXTENSION "uuid-ossp";' | $PSQLCMD

# syncApplied.sh
MIGRATIONDIR=${REPO}/migration
DATABASE=idempiere

MSGERROR=""
APPLIED=N
cd $MIGRATIONDIR
for i in i8.1/postgresql/*.sql
do
    OUTFILE=/tmp/`basename "$i" .sql`.out
    $PSQLCMD -f "$i" 2>&1 | tee "$OUTFILE"
    if fgrep ERROR: "$OUTFILE" > /dev/null 2>&1
    then
        MSGERROR="$MSGERROR
**** ERROR ON FILE $OUTFILE - Please verify ****"
    else
        rm "$OUTFILE"
    fi
    APPLIED=Y
done
if [ x$APPLIED = xY ]
then
    $PSQLCMD -c "analyze"
    for i in processes_post_migration/postgresql/*.sql
    do
        OUTFILE=/tmp/`basename "$i" .sql`.out
        $PSQLCMD -f "$i" 2>&1 | tee "$OUTFILE"
        if fgrep ERROR: "$OUTFILE" > /dev/null 2>&1
        then
            MSGERROR="$MSGERROR
**** ERROR ON FILE $OUTFILE - Please verify ****"
        else
            rm "$OUTFILE"
        fi
    done
else
    echo "Database is up to date, no scripts to apply"
fi
if [ -n "$MSGERROR" ]
then
    echo "$MSGERROR"
    exit 1
fi

# update build ID on db version
TODAY=`date +%Y%m%d`
echo "update ad_system set lastmigrationscriptapplied = '${TODAY}_Daily8.1Build' || $BUILD_NUMBER || '/' || lastmigrationscriptapplied" | $PSQLCMD

# Recreate seed
cd /tmp
pg_dump -U $USER -h $IDEMPIERE_DB_SERVER -p $IDEMPIERE_DB_PORT $IDEMPIERE_DB_NAME > ExpDat${IDEMPIERE_DB_NAME}_pg.dmp
mv ExpDat${IDEMPIERE_DB_NAME}_pg.dmp Adempiere_pg.dmp
rm ${REPO}/org.adempiere.server-feature/data/seed/Adempiere_pg.jar
zip -9 ${REPO}/org.adempiere.server-feature/data/seed/Adempiere_pg.jar Adempiere_pg.dmp
rm Adempiere_pg.dmp
mkdir -p /tmp/seed81
rm -f /tmp/seed81/Adempiere_pg.jar
cp -p ${REPO}/org.adempiere.server-feature/data/seed/Adempiere_pg.jar /tmp/seed81/

exit 0
