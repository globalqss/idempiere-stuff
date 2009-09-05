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
*/ 
CREATE OR REPLACE FUNCTION drop_client(db_name text, client_id integer) 
RETURNS integer AS 
$BODY$ 
DECLARE 
    db_name text := $1; 
    c_id integer := $2; 
    tmp RECORD; 
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
    FOR tmp IN 
        select * from ad_table t where isview = 'N' 
            and ad_table_id in (select ad_table_id from ad_column where columnname = 'AD_Client_ID') 
            order by tablename  
    LOOP 
        raise notice 'Removing items from table - %', tmp.tablename; 
        EXECUTE 'DELETE FROM ' || tmp.tablename || ' WHERE AD_Client_ID = ' || c_id; 
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
