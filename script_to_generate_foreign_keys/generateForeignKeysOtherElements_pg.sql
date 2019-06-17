select 'ALTER TABLE '||tablename||
' ADD CONSTRAINT '||SUBSTR (REPLACE (SUBSTR (columnname, 1, LENGTH (columnname) - CASE WHEN table_ref='C_ValidCombination' THEN 5 ELSE 3 END), '_', '') || CASE WHEN table_ref='C_ValidCombination' THEN 'vc_' ELSE '_' END || REPLACE (tablename, '_', ''), 1, 30)||
' FOREIGN KEY('||columnname||') REFERENCES '||table_ref||'('||table_ref||'_ID)'
||' DEFERRABLE INITIALLY DEFERRED'||
';'||chr(10) as cmd from (
--
SELECT * FROM (
SELECT t.tablename, c.columnname, 
CASE ad_reference_id
  WHEN 21 THEN 'C_Location'
  WHEN 25 THEN 'C_ValidCombination'
  WHEN 31 THEN 'M_Locator'
  WHEN 32 THEN 'AD_Image'
  WHEN 33 THEN 'S_ResourceAssignment'
  WHEN 35 THEN 'M_AttributeSetInstance'
  WHEN 53370 THEN 'AD_Chart'
END AS table_ref
from ad_table t join ad_column c on (t.ad_table_id=c.ad_table_id) 
where c.ad_reference_id IN (21, 25, 31, 32, 33, 35, 53370)
and t.isactive='Y' AND c.isactive='Y' and c.columnsql IS NULL and t.isview = 'N'
) as internal
WHERE NOT EXISTS (
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
		clp.relname = LOWER (table_ref) AND
		nsp.nspname = 'adempiere' AND
		cop.contype = 'p' AND
		cof.conrelid = clf.oid AND
		clf.relnamespace = nsf.oid AND
		clf.relname = LOWER (tablename) AND
		nsf.nspname = 'adempiere' AND
		cof.contype = 'f' AND
		af.attnum = cof.conkey[1] AND
		af.attname = LOWER (columnname))
AND NOT (table_ref='C_ValidCombination' AND tablename IN ('A_Asset_Acct','A_Asset_Change','A_Asset_Group_Acct','A_Asset_Transfer','A_FundingMode_Acct','I_Asset'))
AND tablename not like 'T|_%' escape '|' and tablename not in ('Test')
) as cmds
order by 1;
