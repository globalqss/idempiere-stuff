/*************************************************************************
 * The contents of this file are subject to the LGPL.  
 * The Original Author is Peter Shen 
 * The Personal Information of the contributors:
 *      1,  Peter Shen 
 *          zpshen@gmail.com
 *          Shanghai, China
 *
 *************************************************************************
 * $Id: RemoveClient.sql,v 1.1 2005/01/26 14:47:29 pshen Exp $
 ***
 * Title:   Remove a Client in Adempiere. 
 * Description:
 *	- Disable all the constraints and triggers
 *  - Delete the records from all the table
 *  - Enable all  the constraints and triggers
 *
 * Warning:
 *  - This script is only for Oracle 9.
 *  - Please backup all the data before you use this script
 *
 * Guide:
 *  - Log in the oracle sqlplus (or other sqlplus tools) with the schema from which you want to delete data
 *  - Changed the v_Client_ID to AD_Client_ID which you want to delete
 *  - This script would be a little slow, please wait patiently
 *
 * Contributor(s):
 * Carlos Ruiz - globalqss - 2006/12/11 
 *   - Test it in Oracle 10G XE
 *   - Add reference columns not named AD_Client_ID (like AD_Replication.Remote_Client_ID   
 *   - Add novalidate variable for faster but unsure process (or even for failed) 
 ************************************************************************/

DECLARE
   /**
    * Please change this one to any client id you want to delete
    **/
   v_client_id    NUMBER          := 1000002;
   -- novalidate will make the process faster but the constraints won't be validated
   v_novalidate   VARCHAR2 (10)   := ' ';                  -- slower but sure
   -- v_novalidate  VARCHAR2(10)    := 'novalidate'; -- faster but unsure
   v_sql1         VARCHAR2 (1024);

   CURSOR cur_contraints
   IS
      SELECT table_name, constraint_name
        FROM user_constraints
       WHERE constraint_type = 'R' AND status = 'ENABLED';

   CURSOR cur_triggers
   IS
      SELECT trigger_name
        FROM user_triggers
       WHERE status = 'ENABLED';

   CURSOR cur_removedata
   IS
      SELECT    'delete from '
             || tablename
             || ' where AD_Client_ID='
             || v_client_id AS v_sql
        FROM ad_table a
       WHERE a.isview = 'N'
         AND EXISTS (
                SELECT ad_column_id
                  FROM ad_column c
                 WHERE a.ad_table_id = c.ad_table_id
                   AND UPPER (c.columnname) = 'AD_CLIENT_ID')
      UNION
      SELECT    'delete from '
             || t.tablename
             || ' where '
             || columnname
             || '='
             || v_client_id AS v_sql
        FROM ad_column c, ad_table t
       WHERE ad_reference_value_id = 129
         AND UPPER (columnname) <> 'AD_CLIENT_ID'
         AND t.ad_table_id = c.ad_table_id;
BEGIN
   DBMS_OUTPUT.put_line ('  Delete Client Where AD_Client_ID=' || v_client_id);
   /****************************************************************
    *  Disable all the constraints one by one
    ****************************************************************/
   DBMS_OUTPUT.put_line (' Disable the contraints ');

   FOR p IN cur_contraints
   LOOP
      v_sql1 :=
            'alter table '
         || p.table_name
         || ' disable constraint '
         || p.constraint_name;

      -- DBMS_OUTPUT.put_line ('..' || v_sql1);
      EXECUTE IMMEDIATE v_sql1;
   END LOOP;                                             -- Disable contraints

   DBMS_OUTPUT.put_line (' Disable the triggers ');

   FOR p IN cur_triggers
   LOOP
      v_sql1 := 'alter trigger ' || p.trigger_name || ' disable ';

      -- DBMS_OUTPUT.put_line ('..' || v_sql1);
      EXECUTE IMMEDIATE v_sql1;
   END LOOP;                                             -- Disable contraints

   /****************************************************************
   *  Remove all the records belongs to that client
   ****************************************************************/
   FOR p IN cur_removedata
   LOOP
      v_sql1 := p.v_sql;

      -- DBMS_OUTPUT.put_line ('..' || v_sql1);
      EXECUTE IMMEDIATE v_sql1;
   END LOOP;                                                    -- Remove data

   /****************************************************************
   *  Disable all the constraints one by one
   ****************************************************************/
   DBMS_OUTPUT.put_line (' Enable the contraints ');

   FOR p IN cur_contraints
   LOOP
      v_sql1 :=
            'alter table '
         || p.table_name
         || ' enable '
         || v_novalidate
         || ' constraint '
         || p.constraint_name;

      -- DBMS_OUTPUT.put_line ('..' || v_sql1);
      EXECUTE IMMEDIATE v_sql1;
   END LOOP;                                              -- Enable contraints

   DBMS_OUTPUT.put_line (' Enable the triggers ');

   FOR p IN cur_triggers
   LOOP
      v_sql1 := 'alter trigger ' || p.trigger_name || ' enabled ';

      -- DBMS_OUTPUT.put_line ('..' || v_sql1);
      EXECUTE IMMEDIATE v_sql1;
   END LOOP;                                              -- Enable contraints

   COMMIT;
END;
