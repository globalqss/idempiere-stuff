#!/bin/sh

# script to apply new migration scripts to oracle xe 
# converted to ora from syncApplied.sh by Carlos Ruiz 
# taking stuff also from migrate_oracle.sh
# 
# Contributed by Dirk Niemeyer - a42niem

# Change the following to your needs
FOLDER=i1.0b-release
MIGRATIONDIR=/home/carlos/hgAdempiere/localosgi/migration/${FOLDER}/oracle
HOST=localhost
DATABASE=xe
USER=idempiere
PASS=mypass

# no need to change things below this line
cd $MIGRATIONDIR

echo "set heading off
set feedback off
set pagesize 0
set term off
set echo off
select name from ad_migrationscript;" | sqlplus -S $USER/$PASS@$HOST/$DATABASE | sed -e 's:^ ::' | grep -v '^$' | sort > /tmp/lisDB.txt
ls *.sql | sort > /tmp/lisFS.txt

MSGERROR=""
APPLIED=N
for i in `comm -13 /tmp/lisDB.txt /tmp/lisFS.txt`
do
    OUTFILE=/tmp/`basename "$i" .sql`_or.out
    cat "$i" | sqlplus $USER/$PASS@$HOST/$DATABASE 2>&1 | tee "$OUTFILE"
    if fgrep "ORA-
TNS-
PLS-
SP2-" "$OUTFILE" > /dev/null 2>&1
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
        OUTFILE=/tmp/`basename "$i" .sql`_or.out
	cat "$i" | sqlplus $USER/$PASS@$HOST/$DATABASE 2>&1 | tee "$OUTFILE"
        if fgrep "ORA-
TNS-
PLS-
SP2-" "$OUTFILE" > /dev/null 2>&1
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
