/*
 # iDempiere contribution
 # Author: Carlos Ruiz - globalqss
 # This script generates the alter table commands to create the foreign keys 
 # based on iDempiere Dictionary definition
*/

SELECT      'ALTER TABLE '
         || tablename
         || ' ADD CONSTRAINT '
         || SUBSTR (   REPLACE (SUBSTR (columnname, 1, LENGTH (columnname) - 3),
                                '_',
                                ''
                               )
                    || '_'
                    || REPLACE (tablename, '_', ''),
                    1,
                    30
                   )
         || ' FOREIGN KEY ('
         || columnname
         || ') REFERENCES '
         || table_ref
         || ' DEFERRABLE INITIALLY DEFERRED;'||chr(10) AS cmd
FROM     (
-- Table Direct or Search Table Direct
          SELECT t.tablename, c.columnname, r.NAME, c.ad_reference_id,
                 c.ad_reference_value_id,
                 CAST (SUBSTR (columnname, 1, LENGTH (columnname) - 3) AS VARCHAR(40)) AS table_ref
            FROM AD_TABLE t, AD_COLUMN c, AD_REFERENCE r
           WHERE t.ad_table_id = c.ad_table_id
             -- AND t.tablename LIKE 'ASP|_%' ESCAPE '|'
             AND t.isactive='Y'
             AND c.isactive='Y'
             AND c.columnsql IS NULL
             AND c.ad_reference_id = r.ad_reference_id
             AND (   c.ad_reference_id IN (19 /*Table Direct*/)
                  OR (    c.ad_reference_id IN (30 /*Search*/)
                      AND c.ad_reference_value_id IS NULL
                     )
                 )
          UNION
-- Table or Search
          SELECT t.tablename, c.columnname, r.NAME, c.ad_reference_id,
                 c.ad_reference_value_id, tr.tablename
            FROM AD_TABLE t,
                 AD_COLUMN c,
                 AD_REFERENCE r,
                 AD_REF_TABLE rt,
                 AD_TABLE tr
           WHERE t.ad_table_id = c.ad_table_id
             -- AND t.tablename LIKE 'ASP|_%' ESCAPE '|'
             AND t.isactive='Y'
             AND c.isactive='Y'
             AND c.columnsql IS NULL
             AND c.ad_reference_id = r.ad_reference_id
             AND (   c.ad_reference_id IN (18 /*Table*/)
                  OR (    c.ad_reference_id IN (30 /*Search*/)
                      AND c.ad_reference_value_id IS NOT NULL
                     )
                 )
             AND c.ad_reference_value_id = rt.ad_reference_id
             AND rt.ad_table_id = tr.ad_table_id) v
   WHERE v.columnname NOT IN
                      ('AD_Client_ID', 'AD_Org_ID', 'CreatedBy', 'UpdatedBy')
     AND v.tablename NOT LIKE 'T|_%' ESCAPE '|'
     AND v.tablename NOT IN ('Test')
     -- exclude views
     AND NOT EXISTS (
               SELECT 1
                 FROM pg_views
                WHERE viewname = LOWER (v.tablename))
     -- exclude already existing foreign keys
     AND NOT EXISTS (
	SELECT 1
	FROM pg_constraint cop 
			LEFT JOIN pg_class conclp 
			ON (conclp.relnamespace = cop.connamespace AND
			conclp.relname = cop.conname) 
			LEFT JOIN pg_tablespace tsp 
			ON (conclp.reltablespace = tsp.oid), pg_class clp, pg_namespace nsp , 
			pg_constraint cof 
			LEFT JOIN pg_class conclf 
			ON (conclf.relnamespace = cof.connamespace AND
			conclf.relname = cof.conname) 
			LEFT JOIN pg_tablespace tsf 
			ON (conclf.reltablespace = tsf.oid) 
			JOIN pg_attribute af 
			ON (af.attrelid = cof.conrelid), pg_class clf, pg_namespace nsf 
	WHERE cop.conrelid = clp.oid AND
		clp.relnamespace = nsp.oid AND
		clp.relname = LOWER (v.table_ref) AND
		nsp.nspname = 'adempiere' AND
		cop.contype = 'p' AND
		cof.conrelid = clf.oid AND
		clf.relnamespace = nsf.oid AND
		clf.relname = LOWER (v.tablename) AND
		nsf.nspname = 'adempiere' AND
		cof.contype = 'f' AND
		af.attnum = cof.conkey[1] AND
		af.attname = LOWER (v.columnname))
--and tablename not in ('A_Asset_Change','A_Asset_Group_Acct','A_Asset_Split','I_Asset','AD_Package_Exp_Detail')
ORDER BY v.tablename, v.table_ref, v.columnname
