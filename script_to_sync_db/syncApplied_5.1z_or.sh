#
# Contributor: Carlos Ruiz - globalqss
# June 27, 2013
# Script to synchronize your 5.1z installation with latest migration scripts
# it's a tool to execute in sync with the p2 update
#   sh update.sh http://ci.idempiere.org/job/iDempiere/ws/buckminster.output/org.adempiere.server_5.1.0-eclipse.feature/site.p2
#
HOST=localhost
DATABASE=orcl
USER=adempiere
PASS=adempiere
JENKINSURL=http://ci.idempiere.org/job/iDempiere

BASEDIR=`dirname $0`
cd $BASEDIR
wget --timeout=15 --tries=2  --no-verbose -O post_or.zip      "${JENKINSURL}/ws/migration/processes_post_migration/oracle/*zip*/oracle.zip"
mkdir -p post_or
unzip -q -u -d post_or post_or.zip
> /tmp/lisFS.txt
for FOLDER in i2.0 i2.0z i2.1 i2.1z i3.1 i3.1z i4.1 i4.1z i5.1 i5.1z
do
    wget --timeout=15 --tries=2  --no-verbose -O ${FOLDER}_or.zip "${JENKINSURL}/ws/migration/${FOLDER}/oracle/*zip*/oracle.zip"
    rm -rf ${FOLDER}_or
    mkdir -p ${FOLDER}_or
    unzip -q -u -d ${FOLDER}_or ${FOLDER}_or.zip

    echo "set heading off
set feedback off
set pagesize 0
set term off
set echo off
select name from ad_migrationscript;" | sqlplus -S $USER/$PASS@$HOST/$DATABASE | sed -e 's:^ ::' | grep -v '^$' | sort > /tmp/lisDB.txt
    if [ -d ${FOLDER}_or/oracle ]
    then
        cd ${FOLDER}_or/oracle
        ls *.sql | sort >> /tmp/lisFS.txt
        cd ../..
    fi
done
sort -o /tmp/lisFS.txt /tmp/lisFS.txt
sort -o /tmp/lisDB.txt /tmp/lisDB.txt
MSGERROR=""
APPLIED=N
for i in `comm -13 /tmp/lisDB.txt /tmp/lisFS.txt`
do
    SCRIPT=`find . -name "$i" -print`
    OUTFILE=/tmp/`basename "$i" .sql`.out
    echo "Applying $SCRIPT"
    cat "$SCRIPT" | sqlplus $USER/$PASS@$HOST/$DATABASE 2>&1 | tee "$OUTFILE"
    if egrep "^(ORA-[0-9]+:|TNS-|PLS-)" "$OUTFILE" > /dev/null 2>&1
    then
        MSGERROR="$MSGERROR\n**** ERROR ON FILE $OUTFILE - Please verify ****"
    fi
    APPLIED=Y
done
if [ x$APPLIED = xY ]
then
    for i in post_or/oracle/*.sql
    do
        OUTFILE=/tmp/`basename "$i" .sql`.out
        cat "$i" | sqlplus $USER/$PASS@$HOST/$DATABASE 2>&1 | tee "$OUTFILE"
        if egrep "^(ORA-[0-9]+:|TNS-|PLS-)" "$OUTFILE" > /dev/null 2>&1
        then
            MSGERROR="$MSGERROR\n**** ERROR ON FILE $OUTFILE - Please verify ****"
        fi
    done
fi
if [ -n "$MSGERROR" ]
then
    echo "$MSGERROR"
fi

