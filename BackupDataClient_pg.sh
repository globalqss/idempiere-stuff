:
#
# Author: Carlos Antonio Ruiz Gomez - globalqss
# Create a pg_dump file to export data just from one client
#
# History:
# 2011-01-13 - CarlosRuiz - First version
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



AD_CLIENT_ID="$1"
DBNAME="$2"
HOSTNAME="$3"
USERNAME="$4"
PORT="$5"

if [ $# -lt 5 ]
then
    echo "
Usage: $0 ad_client_id dbname hostname username port

Parameters:
1 - AD_Client_ID
2 - DB Name
3 - Host name
4 - User name
5 - DB Port

Examples of usage:
To export System and GardenWorld from the database idempiere
BackupDataClient_pg.sh 11 idempiere localhost adempiere 5432
To export just System
BackupDataClient_pg.sh 0 idempiere localhost adempiere 5432
" > /dev/tty
    exit 1
fi

CLIENTVALUE=`echo 'select value from ad_client where ad_client_id=:clientid' | psql --tuples-only --no-align --quiet -h ${HOSTNAME} -U ${USERNAME} -d ${DBNAME} -v clientid=${AD_CLIENT_ID}`
OUTFILE=BackupData_${DBNAME}_${CLIENTVALUE}_${AD_CLIENT_ID}.dmp

# prepare a query to obtain the data in one transaction - filtering tables and clients
echo "BEGIN;" > /tmp/get$$
echo "
SELECT '
SELECT ''--
-- Data for Name: '||table_name||'; Type: TABLE DATA; Schema: adempiere; Owner: adempiere
--

COPY '||table_name||' ('||col_columns||') FROM stdin;'';
COPY (SELECT '||col_columns||' FROM '||table_name||' WHERE ad_client_id=:clientid) TO stdout;
SELECT ''\.
'';'
FROM information_schema.tables t
JOIN (SELECT table_name AS col_table_name, string_agg(case when column_name='limit' then '\"limit\"' else column_name end,', ') AS col_columns from information_schema.columns c GROUP BY table_name) c ON (c.col_table_name=t.table_name)
WHERE table_schema='adempiere' AND table_type='BASE TABLE'
AND EXISTS (SELECT 1 FROM information_schema.columns c WHERE c.table_name=t.table_name AND c.column_name='ad_client_id')
UNION
SELECT '
SELECT ''--
-- Data for Name: '||table_name||'; Type: TABLE DATA; Schema: adempiere; Owner: adempiere
--

COPY '||table_name||' ('||col_columns||') FROM stdin;'';
COPY (SELECT '||col_columns||' FROM '||table_name||' WHERE ad_pinstance_id IN (SELECT ad_pinstance_id FROM ad_pinstance WHERE ad_client_id=:clientid)) TO stdout;
SELECT ''\.
'';'
FROM information_schema.tables t
JOIN (SELECT table_name AS col_table_name, string_agg(case when column_name='limit' then '\"limit\"' else column_name end,', ') AS col_columns from information_schema.columns c GROUP BY table_name) c ON (c.col_table_name=t.table_name)
WHERE table_name='ad_pinstance_log'
ORDER BY 1
" | psql --tuples-only --no-align --quiet -h ${HOSTNAME} -U ${USERNAME} -d ${DBNAME} >> /tmp/get$$

# get the data
echo "BEGIN;
" > ${OUTFILE}
psql --tuples-only --no-align --quiet -h ${HOSTNAME} -U ${USERNAME} -d ${DBNAME} -v clientid=${AD_CLIENT_ID} -f /tmp/get$$ >> ${OUTFILE}
echo "
COMMIT;" >> ${OUTFILE}

tar cvjf ${OUTFILE}.tbz ${OUTFILE}
rm ${OUTFILE}

rm /tmp/get$$
