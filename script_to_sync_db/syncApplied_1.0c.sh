#
# Contributor: Carlos Ruiz - globalqss
# June 27, 2013
# Script to synchronize your 1.0c installation with latest migration scripts
# it's a tool to execute in sync with the p2 update
#   sh update.sh http://ci.idempiere.org/job/iDempiere1.0c/ws/buckminster.output/org.adempiere.server_1.0.0-eclipse.feature/site.p2
#
FOLDER=i1.0c-release
DATABASE=idempiere
USER=adempiere
JENKINSURL=http://ci.idempiere.org/job/iDempiere1.0c

BASEDIR=`dirname $0`
cd $BASEDIR
wget -O ${FOLDER}_pg.zip "${JENKINSURL}/ws/migration/${FOLDER}/postgresql/*zip*/postgresql.zip"
wget -O post_pg.zip      "${JENKINSURL}/ws/migration/processes_post_migration/postgresql/*zip*/postgresql.zip"
rm -rf ${FOLDER}_pg
mkdir -p ${FOLDER}_pg
unzip -u -d ${FOLDER}_pg ${FOLDER}_pg.zip
mkdir -p post_pg
unzip -u -d post_pg post_pg.zip

psql -d $DATABASE -U $USER -q -t -c "select name from ad_migrationscript" | sed -e 's:^ ::' | grep -v '^$' | sort > /tmp/lisDB.txt
cd ${FOLDER}_pg/postgresql
ls *.sql | sort > /tmp/lisFS.txt
MSGERROR=""
APPLIED=N
for i in `comm -13 /tmp/lisDB.txt /tmp/lisFS.txt`
do
    OUTFILE=/tmp/`basename "$i" .sql`.out
    psql -d $DATABASE -U $USER -f "$i" 2>&1 | tee "$OUTFILE"
    if fgrep ERROR: "$OUTFILE" > /dev/null 2>&1
    then
        MSGERROR="$MSGERROR\n**** ERROR ON FILE $OUTFILE - Please verify ****"
    fi
    APPLIED=Y
done
if [ x$APPLIED = xY ]
then
    cd ../..
    for i in post_pg/postgresql/*.sql
    do
        OUTFILE=/tmp/`basename "$i" .sql`.out
        psql -d $DATABASE -U $USER -f "$i" 2>&1 | tee "$OUTFILE"
        if fgrep ERROR: "$OUTFILE" > /dev/null 2>&1
        then
            MSGERROR="$MSGERROR\n**** ERROR ON FILE $OUTFILE - Please verify ****"
        fi
    done
fi
if [ -n "$MSGERROR" ]
then
    echo "$MSGERROR"
fi
