FOLDER=i1.0c-release
MIGRATIONDIR=~/hgAdempiere/localosgi/migration/${FOLDER}/postgresql
DATABASE=${1:-idempiere}
USER=adempiere
ADDPG=${2}   # i.e. "-h localhost -p 5432"
cd $MIGRATIONDIR

psql -d $DATABASE -U $USER $ADDPG -q -t -c "select name from ad_migrationscript" | sed -e 's:^ ::' | grep -v '^$' | sort > /tmp/lisDB.txt
ls *.sql | sort > /tmp/lisFS.txt

MSGERROR=""
APPLIED=N
for i in `comm -13 /tmp/lisDB.txt /tmp/lisFS.txt`
do
    OUTFILE=/tmp/`basename "$i" .sql`.out
    psql -d $DATABASE -U $USER $ADDPG -f "$i" 2>&1 | tee "$OUTFILE"
    if fgrep ERROR: "$OUTFILE" > /dev/null 2>&1
    then
        MSGERROR="$MSGERROR
**** ERROR ON FILE $OUTFILE - Please verify ****"
    fi
    APPLIED=Y
done
if [ x$APPLIED = xY ]
then
    for i in ../../processes_post_migration/postgresql/*.sql
    do
        OUTFILE=/tmp/`basename "$i" .sql`.out
        psql -d $DATABASE -U $USER $ADDPG -f "$i" 2>&1 | tee "$OUTFILE"
        if fgrep ERROR: "$OUTFILE" > /dev/null 2>&1
        then
            MSGERROR="$MSGERROR
**** ERROR ON FILE $OUTFILE - Please verify ****"
        fi
    done
else
    echo "Database is up to date, no scripts to apply"
fi
if [ -n "$MSGERROR" ]
then
    echo "$MSGERROR"
fi
# checkApplied.sh
