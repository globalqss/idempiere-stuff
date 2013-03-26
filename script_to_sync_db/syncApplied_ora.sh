#!/bin/sh

# script to apply new migration scripts to oracle xe 
# converted to ora from syncApplied.sh by Carlos Ruiz 
# taking stuff also from migrate_oracle.sh
# 
# Contributed by Dirk Niemeyer - a42niem

# Change the following to your needs
FOLDER=i1.0a-release
MIGRATIONDIR=/opt/workspace/idempiere/migration/${FOLDER}/oracle
HOST=myHost
DATABASE=xe
USER=adempiere
PASS=myPass

# no need to change things below this line
cd $MIGRATIONDIR

sqlplus -S $USER/$PASS@$HOST/$DATABASE <<EOF | sort > /tmp/lisDB.txt
SET head off;
SET feedback off;
SET pagesize 50000;

SELECT name FROM ad_migrationscript;
EXIT

EOF
ls *.sql | sort > /tmp/lisFS.txt

MSGERROR=""
APPLIED=N
for i in `comm -13 /tmp/lisDB.txt /tmp/lisFS.txt`
do
    OUTFILE=/tmp/`basename "$i" .sql`.out
    sqlplus -S $USER/$PASS@$HOST/$DATABASE <<EOF 2>&1 | tee "$OUTFILE"
SET SQLBLANKLINES ON;
SET DEFINE OFF;
`cat "$i" | dos2unix`
COMMIT;
EXIT
EOF
    if fgrep ERROR "$OUTFILE" > /dev/null 2>&1
    then
        MSGERROR="$MSGERROR
**** ERROR ON FILE $OUTFILE - Please verify ****"
    fi
    APPLIED=Y
done
if [ x$APPLIED = xY ]
then
    for i in ../../processes_post_migration/oracle/*.sql
    do
        OUTFILE=/tmp/`basename "$i" .sql`.out
        sqlplus -S $USER/$PASS@$HOST/$DATABASE <<EOF 2>&1 | tee "$OUTFILE"
SET SQLBLANKLINES ON;
SET DEFINE OFF;
`cat "$i" | dos2unix`
COMMIT;
EXIT
EOF
        if fgrep ERROR "$OUTFILE" > /dev/null 2>&1
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

