/**
* PostgreSQL Client remove function safely
*
* Use to remove a client from iDempiere, e.g. remove GardenWorld
*
* - Usage:
* 1. Install drop_client function (Run this script)
* 2. Run the following sql:
* SELECT drop_client(<client_id>);
* e.g. SELECT drop_client(11); --> Removes GardenWorld
*
*/
CREATE OR REPLACE FUNCTION drop_client(client_id integer)
RETURNS varchar AS
$BODY$
DECLARE
    r_table RECORD;
    cntdel INTEGER;
    totdel INTEGER;
BEGIN

    CREATE OR REPLACE FUNCTION drop_client_inner(tabledel varchar, tablefk varchar, client_id integer)
    RETURNS integer AS
    $inner$
    DECLARE
	cntdel INTEGER;
	cmd varchar;
    BEGIN
	RAISE NOTICE 'Removing special items from table % vs %', tabledel, tablefk;
	IF tabledel = 'ad_pinstance_log' THEN
	    cmd := 'DELETE FROM '||tabledel||' WHERE '||tablefk||'_id IN (SELECT '||tablefk||'_id FROM '||tablefk||' WHERE ad_client_id='||client_id||')';
	ELSE
	    cmd := 'DELETE FROM '||tabledel||' WHERE ad_client_id!='||client_id||' AND '||tablefk||'_id IN (SELECT '||tablefk||'_id FROM '||tablefk||' WHERE ad_client_id='||client_id||')';
	END IF;
	EXECUTE cmd;
	GET DIAGNOSTICS cntdel = ROW_COUNT;
	IF cntdel > 0 THEN
	    RAISE NOTICE 'Deleted % special rows from table % vs %', cntdel, tabledel, tablefk;
	END IF;
	RETURN cntdel;
    END;
    $inner$
    LANGUAGE 'plpgsql' VOLATILE;

    RAISE NOTICE 'Removing records belonging to client %', client_id;
    totdel := 0;

    /* Special cases with foreign keys in system client */
    /* adpinstance_pilog */
    SELECT drop_client_inner('ad_pinstance_log', 'ad_pinstance', client_id) INTO cntdel;
    totdel := totdel + cntdel;
    /* adsession_adchangelog */
    SELECT drop_client_inner('ad_changelog', 'ad_session', client_id) INTO cntdel;
    totdel := totdel + cntdel;
    /* adrole_urolemenu */
    SELECT drop_client_inner('u_rolemenu', 'ad_role', client_id) INTO cntdel;
    totdel := totdel + cntdel;
    /* aduser_adnote */
    SELECT drop_client_inner('ad_note', 'ad_user', client_id) INTO cntdel;
    totdel := totdel + cntdel;
    /* end special cases */

    FOR r_table IN
        SELECT tablename, 'AD_Client_ID' AS columnname
            FROM AD_TABLE a
            WHERE a.isview = 'N'
                AND EXISTS (
                    SELECT ad_column_id
                        FROM AD_COLUMN c
                        WHERE a.ad_table_id = c.ad_table_id
                        AND LOWER (c.columnname) = 'ad_client_id')
	                    AND EXISTS (SELECT 1 FROM pg_tables pt WHERE lower(pt.tablename)=lower(a.TableName) AND pt.schemaname='adempiere')
        UNION
        SELECT tablename, columnname
            FROM AD_COLUMN c, AD_TABLE t
            WHERE ad_reference_value_id = 129
                AND LOWER (columnname) <> 'ad_client_id'
                AND t.ad_table_id = c.ad_table_id
                AND EXISTS (SELECT 1 FROM pg_tables pt WHERE lower(pt.tablename)=lower(t.TableName) AND pt.schemaname='adempiere')
    LOOP
        RAISE NOTICE 'Removing items from table %', r_table.tablename;
        EXECUTE 'DELETE FROM ' || r_table.tablename || ' WHERE ' || r_table.columnname || ' = ' || client_id;
	GET DIAGNOSTICS cntdel = ROW_COUNT;
	IF cntdel > 0 THEN
	    RAISE NOTICE 'Deleted % rows from table %', cntdel, r_table.tablename;
	END IF;
	totdel := totdel + cntdel;
    END LOOP;
    DROP FUNCTION drop_client_inner(varchar, varchar, integer);
    RETURN totdel || ' rows deleted from client ' || client_id;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE
;
