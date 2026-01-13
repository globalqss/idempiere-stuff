:
#
# iDempiere script
# Author: Carlos Antonio Ruiz Gomez - globalqss
# Create a pg_dump file to export just one tenant
#
# Tested on Ubuntu 12.04 with postgresql 9.1.9
#
# History:
# 2011-01-13 - CarlosRuiz - First version
# 2011-01-14 - CarlosRuiz - Add an optional third parameter to define a file with tables to exclude
#
#############################################
# NOTES:
#
# If running this program psql throw errors like
#   ERROR:  column «ad_client_id» does not exist
#   LINE 1: COPY (SELECT * FROM c_project_access WHERE AD_Client_ID IN (...
# it means the table is wrongly defined, the column ad_client_id is on dictionary, but not on database
# please fix the database problem synchronizing column to avoid these errors
#
# If importing the resulting dump throw errors like
#   ERROR:  insert or update on table «ad_preference» violates foreign key constraint «ad_user_preference»
#   DETAIL:  Key (ad_user_id)=(1000010) is not present in table «ad_user».
# it means you have some corrupted data on tenants, data from one tenant written in a different tenant
# please fix the data corruption to avoid these errors
#############################################


PGBINPATH=/usr/bin
PORT=5432
USERNAME=adempiere
HOSTNAME=localhost

DBNAME="$1"
WHERECLIENT="$2"
EXCLUDEFILE="$3"
OUTFILE=ExpDat${DBNAME}s_pg.dmp

if [ $# -lt 2 ]
then
    echo "
Usage: $0 dbname ad_client_where [excludefile]

Parameters:
1 - Database name
2 - Where clause - applied to all tables with AD_Client_ID column
3 - File with tables to exclude - one per line, case insensitive

Examples of usage:
To export System and GardenWorld from the database idempiere
DBExportClients_pg.sh idempiere \"AD_Client_ID IN (0,11)\"
To export just System
DBExportClients_pg.sh idempiere \"AD_Client_ID=0\"
To export just System excluding some tables
DBExportClients_pg.sh idempiere \"AD_Client_ID=0\" /tmp/TablesToExclude.txt
" > /dev/tty
    exit 1
fi

if [ -s "$3" -a $# -ge 3 ]
then
    cp "$EXCLUDEFILE" /tmp/exclude$$
else
    if [ $# -ge 3 ]
    then
        echo "ERROR: $EXCLUDEFILE does not exist" > /dev/tty
        exit 1
    else
        echo " " > /tmp/exclude$$
    fi
fi

${PGBINPATH}/pg_dump -p ${PORT} -h ${HOSTNAME} --schema-only -U ${USERNAME} ${DBNAME} > /tmp/schema$$

FIRSTCONSTRAINTLINE=`cat /tmp/schema$$ | grep -n "^-- Name: .*; Type: CONSTRAINT;" | head -1 | sed -e 's/:.*//'`
sed -n -e 1,${FIRSTCONSTRAINTLINE}p /tmp/schema$$ > $OUTFILE

echo "select lower(t.tablename) from ad_table t where exists (select 1 from ad_column c where c.ad_table_id=t.ad_table_id and c.columnname='AD_Client_ID') and t.isview='N' order by t.tablename" |
    ${PGBINPATH}/psql --tuples-only --no-align -p ${PORT} -h ${HOSTNAME} --quiet -d ${DBNAME} -U ${USERNAME} |
    fgrep -ivxf /tmp/exclude$$ |
    while read TABLE
do
    echo "COPY adempiere.$TABLE FROM STDIN WITH CSV HEADER;"
    echo "COPY (SELECT * FROM $TABLE WHERE ${WHERECLIENT}) TO STDOUT WITH CSV HEADER;" | ${PGBINPATH}/psql -p ${PORT} -h ${HOSTNAME} --quiet -d ${DBNAME} -U ${USERNAME}
    echo "\."
    echo
done >> $OUTFILE
# add dual table
echo "COPY dual FROM STDIN WITH CSV HEADER;" >> $OUTFILE
echo "COPY (SELECT * FROM dual) TO STDOUT WITH CSV HEADER;" | ${PGBINPATH}/psql -p ${PORT} -h ${HOSTNAME} --quiet -d ${DBNAME} -U ${USERNAME} >> $OUTFILE
echo "\." >> $OUTFILE
echo >> $OUTFILE

sed -n -e ${FIRSTCONSTRAINTLINE},\$p /tmp/schema$$ >> $OUTFILE
rm /tmp/schema$$ /tmp/exclude$$
