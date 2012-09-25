/** 
* PostgresSQL Client remove function 
* 
* Use to remove a client from ADempiere, e.g. remove GardenWorld 
* 
* /////////////////////////////////////////////////////////////// 
* WARNING: This function works fine with my current setup. Yours 
* may be different so backup your database before using! 
* I am not responsible for any problems this may cause. 
* /////////////////////////////////////////////////////////////// 
* 
* - Usage: 
* 1. Install drop_client function (Run this script) 
* 2. Run the following sql: 
* SELECT <db_name>.drop_client('<db_name>', <client_id>); 
* e.g. SELECT drop_client('adempiere', 11); --> Removes GardenWorld 
* 
* -Credits: 
* Credits due to Fernando Lucktemberg(fer_luck) for the main workings 
* Credit to the guys @ e-Nition.com for improving it :) 
* Credit to the Tony Snook for change in discovering the relnamespace
* Credit to Jesus Garcia and Carlos Ruiz from globalqss for adding changes to reference columns with names <> AD_Client_ID
*
* WARNING!!!! This function is for postgresql > 8.2
* In versions 8.2 and before the column pg_trigger.tgenabled was boolean
*    http://www.postgresql.org/docs/8.2/static/catalog-pg-trigger.html
* In versions >= 8.3 the column pg_trigger.tgenabled was changed to char
*    http://www.postgresql.org/docs/8.4/static/catalog-pg-trigger.html
*
*/ 
CREATE OR REPLACE FUNCTION drop_client(db_name text, client_id integer) 
RETURNS integer AS 
$BODY$ 
DECLARE 
    db_name text := $1; 
    c_id integer := $2; 
    r_table RECORD; 
BEGIN 
    RAISE NOTICE 'Setting search_path=%', db_name; 
    EXECUTE 'SET search_path=' || db_name; 
    RAISE NOTICE 'Deleting %.Client Where AD_Client_ID=%', db_name, c_id; 
    RAISE NOTICE 'Disable triggers and constraints';
    update pg_trigger set tgenabled = 'D' where oid in ( 
        select tr.oid from pg_class cl, pg_trigger tr, pg_namespace ns 
            where tr.tgrelid = cl.oid 
                and  cl.relnamespace = ns.oid 
                and ns.nspname = db_name);  
    RAISE NOTICE 'Removing records belonging to client %', c_id; 
    FOR r_table IN 
        SELECT tablename, 'AD_Client_ID' AS columnname
            FROM AD_TABLE a
            WHERE a.isview = 'N' AND a.isactive = 'Y'
                AND EXISTS (
                    SELECT ad_column_id
                        FROM AD_COLUMN c
                        WHERE a.ad_table_id = c.ad_table_id
                        AND UPPER (c.columnname) = 'AD_CLIENT_ID')
	        -- TODO Assure that the table is really a table in database
	        -- AND EXISTS (SELECT 1 FROM user_objects dbo WHERE UPPER(dbo.object_name)=UPPER(a.TableName) AND dbo.object_type='TABLE')
        UNION
        SELECT tablename, columnname
            FROM AD_COLUMN c, AD_TABLE t
            WHERE ad_reference_value_id = 129
                AND UPPER (columnname) <> 'AD_CLIENT_ID'
                AND t.ad_table_id = c.ad_table_id
                -- TODO Assure that the table is really a table in database
                -- AND EXISTS (SELECT 1 FROM user_objects dbo WHERE UPPER(dbo.object_name)=UPPER(t.TableName) AND dbo.object_type='TABLE')
    LOOP 
        RAISE NOTICE 'Removing items from table - %', r_table.tablename; 
        EXECUTE 'DELETE FROM ' || r_table.tablename || ' WHERE ' || r_table.columnname || ' = ' || c_id;
    END LOOP; 
    RAISE NOTICE 'Enable triggers & constraints'; 
    update pg_trigger set tgenabled = 'O' where oid in ( 
        select tr.oid from pg_class cl, pg_trigger tr, pg_namespace ns 
            where tr.tgrelid = cl.oid 
                and  cl.relnamespace = ns.oid 
                and ns.nspname = db_name); 
    RAISE NOTICE 'Done'; 
    RETURN 1; 
END; 
$BODY$ 
LANGUAGE 'plpgsql' VOLATILE 
COST 100; 

ALTER FUNCTION drop_client(text, integer) OWNER TO postgres; 
