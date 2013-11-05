#!/bin/sh

# script to apply new migration scripts to oracle xe 
# converted to ora from syncApplied.sh by Carlos Ruiz 
# taking stuff also from migrate_oracle.sh
# 
# Contributed by Dirk Niemeyer - a42niem

# Change the following to your needs
MIGRATIONDIR=/home/carlos/hgAdempiere/localosgi/migration
HOST=localhost
DATABASE=xe
USER=idempiere
PASS=mypass

MSGERROR=""
APPLIED=N
cd $MIGRATIONDIR
for i in i2.0/oracle/*.sql i2.0z/oracle/*.sql
do
    OUTFILE=/tmp/`basename "$i" .sql`_or.out
    cat "$i" | sqlplus $USER/$PASS@$HOST/$DATABASE 2>&1 | tee "$OUTFILE"
    sleep 5
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
    sleep 1
done
if [ x$APPLIED = xY ]
then
    for i in processes_post_migration/oracle/*.sql
    do
        OUTFILE=/tmp/`basename "$i" .sql`_or.out
	cat "$i" | sqlplus $USER/$PASS@$HOST/$DATABASE 2>&1 | tee "$OUTFILE"
        sleep 5
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
        sleep 1
    done
else
    echo "Database is up to date, no scripts to apply"
fi
if [ -n "$MSGERROR" ]
then
    echo "$MSGERROR"
    exit 1
fi
