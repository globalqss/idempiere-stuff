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
 *  - Disable all the constraints and triggers
 *  - Delete the records from all the table
 *  - Enable  all the constraints and triggers
 *
 * Warning:
 *  - Please backup all the data before you use this script
 *
 * Guide:
 *  - Log in the oracle sqlplus (or other sqlplus tools) with the schema from which you want to delete data
 *  - Changed the v_Client_ID to AD_Client_ID which you want to delete
 *  - This script would be a little slow, please wait patiently
 *
 * Known issues:
 *  - the script enables the triggers/constraints that you previously disabled for some reasons
 *  - if your tables are not in Application Dictionary (AD_Table) then the script won't touch them
 *
 * Contributor(s):
 * Carlos Ruiz - globalqss - 2006/12/11 
 *   - Test it in Oracle 10G XE
 *   - Add reference columns not named AD_Client_ID (like AD_Replication.Remote_Client_ID   
 *   - Add novalidate variable for faster but unsure process (or even for failed) 
 * Teo Sarca <teo.sarca@gmail.com> - 2007/06/12
 *   - fixed: trigger enabling issue
 *   - fixed: check if the AD_Table row is really a table
 *   - fixed: role dependencies issue
 *   - fixed: more verbose - this is a critical task so it should be more verbose
 *   - tested on Oracle 10G XE
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

   CURSOR cur_contraints_ena
   IS
      SELECT table_name, constraint_name
        FROM user_constraints
       WHERE constraint_type = 'R' AND status = 'ENABLED';

   CURSOR cur_contraints_dis
   IS
      SELECT table_name, constraint_name
        FROM user_constraints
       WHERE constraint_type = 'R' AND status = 'DISABLED';

   CURSOR cur_triggers_ena
   IS
      SELECT trigger_name
        FROM user_triggers
       WHERE status = 'ENABLED';

   CURSOR cur_triggers_dis
   IS
      SELECT trigger_name
        FROM user_triggers
       WHERE status = 'DISABLED';

   CURSOR cur_removedata
   IS
      SELECT    'delete from '
             || tablename
             || ' where AD_Client_ID='
             || v_client_id AS v_sql
	     , a.TableName
        FROM AD_TABLE a
       WHERE a.isview = 'N'
         AND EXISTS (
                SELECT ad_column_id
                  FROM AD_COLUMN c
                 WHERE a.ad_table_id = c.ad_table_id
                   AND UPPER (c.columnname) = 'AD_CLIENT_ID')
	 -- Assure that the table is really a table in database
	 AND EXISTS (SELECT 1 FROM user_objects dbo WHERE UPPER(dbo.object_name)=UPPER(a.TableName) AND dbo.object_type='TABLE')
      UNION
      SELECT    'delete from '
             || t.tablename
             || ' where '
             || columnname
             || '='
             || v_client_id AS v_sql
	     , t.TableName
        FROM AD_COLUMN c, AD_TABLE t
       WHERE ad_reference_value_id = 129
         AND UPPER (columnname) <> 'AD_CLIENT_ID'
         AND t.ad_table_id = c.ad_table_id
	 -- Assure that the table is really a table in database
	 AND EXISTS (SELECT 1 FROM user_objects dbo WHERE UPPER(dbo.object_name)=UPPER(t.TableName) AND dbo.object_type='TABLE')
	;

    -- Role dependencies
    cursor cur_role_dep is
        select TableName from AD_Table t, AD_Column c
        where t.AD_Table_ID=c.AD_Table_ID AND t.TableName<>'AD_Role_ID' AND c.ColumnName='AD_Role_ID';

BEGIN
   DBMS_OUTPUT.PUT_LINE ('  Delete Client Where AD_Client_ID=' || v_client_id);
   /****************************************************************
    *  Disable all triggers and constraints one by one
    ****************************************************************/
   DBMS_OUTPUT.PUT_LINE (' Disable the triggers ');
   FOR p IN cur_triggers_ena
   LOOP
      v_sql1 := 'alter trigger ' || p.trigger_name || ' disable ';

      -- DBMS_OUTPUT.put_line ('..' || v_sql1);
      EXECUTE IMMEDIATE v_sql1;
   END LOOP;                                             -- Disable contraints

   DBMS_OUTPUT.PUT_LINE (' Disable the contraints '||v_novalidate);
   FOR p IN cur_contraints_ena
   LOOP
      v_sql1 :=
            'alter table '
         || p.table_name
         || ' disable constraint '
         || p.constraint_name;

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
      IF SQL%ROWCOUNT > 0 THEN
         DBMS_OUTPUT.put_line('Deleted from '||p.TableName || ': #'||SQL%ROWCOUNT);
      END IF;
   END LOOP;                                                    -- Remove data
   
   FOR p IN cur_role_dep loop
      v_sql1 := 'delete from '||p.TableName||' where AD_Role_ID not in (select AD_Role_ID from AD_Role)';
      EXECUTE IMMEDIATE v_sql1;
      IF SQL%ROWCOUNT > 0 THEN
         DBMS_OUTPUT.put_line('Deleted from '||p.TableName||': #'||SQL%ROWCOUNT);
      END IF;
   END LOOP;
   

   /****************************************************************
   *  Disable all constraints and triggers one by one
   ****************************************************************/
   DBMS_OUTPUT.PUT_LINE (' Enable the contraints '||v_novalidate);
   FOR p IN cur_contraints_dis
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

   DBMS_OUTPUT.PUT_LINE (' Enable the triggers ');
   FOR p IN cur_triggers_dis
   LOOP
      v_sql1 := 'alter trigger ' || p.trigger_name || ' enable ';

      -- DBMS_OUTPUT.put_line ('..' || v_sql1);
      EXECUTE IMMEDIATE v_sql1;
   END LOOP;                                              -- Enable triggers
   
   COMMIT;
   DBMS_OUTPUT.PUT_LINE ('Done. ');
END;
