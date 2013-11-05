-- 25 - Account - C_ValidCombination
-- columns expected to end with _Acct
select * from (

select 'ALTER TABLE '||tablename||
' ADD CONSTRAINT '||SUBSTR (REPLACE (SUBSTR (columnname, 1, LENGTH (columnname) - 5), '_', '') || 'vc_' || REPLACE (tablename, '_', ''), 1, 30)||
' FOREIGN KEY('||columnname||') REFERENCES C_ValidCombination(C_ValidCombination_ID)'
||' DEFERRABLE INITIALLY DEFERRED'||
';'||chr(10) as cmd
from (
select t.tablename, c.columnname, c.ad_reference_id, c.ad_reference_value_id from ad_table t join ad_column c on (t.ad_table_id=c.ad_table_id) 
where c.ad_reference_id = 25
and t.isactive='Y' AND c.isactive='Y' and c.columnsql IS NULL and t.isview = 'N' and t.tablename not like 'T|_%' escape '|' and t.tablename not in ('Test')
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
		clp.relname = LOWER ('C_ValidCombination') AND
		nsp.nspname = 'adempiere' AND
		cop.contype = 'p' AND
		cof.conrelid = clf.oid AND
		clf.relnamespace = nsf.oid AND
		clf.relname = LOWER (t.tablename) AND
		nsf.nspname = 'adempiere' AND
		cof.contype = 'f' AND
		af.attnum = cof.conkey[1] AND
		af.attname = LOWER (c.columnname))
) as internal

union

-- 33 - Assignment - S_ResourceAssignment
-- columns expected to end with _ID - all below
select 'ALTER TABLE '||tablename||
' ADD CONSTRAINT '||SUBSTR (REPLACE (SUBSTR (columnname, 1, LENGTH (columnname) - 3), '_', '') || '_' || REPLACE (tablename, '_', ''), 1, 30)||
' FOREIGN KEY('||columnname||') REFERENCES S_ResourceAssignment(S_ResourceAssignment_ID)'
||' DEFERRABLE INITIALLY DEFERRED'||
';'||chr(10)
from (
select t.tablename, c.columnname, c.ad_reference_id, c.ad_reference_value_id from ad_table t join ad_column c on (t.ad_table_id=c.ad_table_id) 
where c.ad_reference_id = 33
and t.isactive='Y' AND c.isactive='Y' and c.columnsql IS NULL and t.isview = 'N' and t.tablename not like 'T|_%' escape '|' and t.tablename not in ('Test')
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
		clp.relname = LOWER ('S_ResourceAssignment') AND
		nsp.nspname = 'adempiere' AND
		cop.contype = 'p' AND
		cof.conrelid = clf.oid AND
		clf.relnamespace = nsf.oid AND
		clf.relname = LOWER (t.tablename) AND
		nsf.nspname = 'adempiere' AND
		cof.contype = 'f' AND
		af.attnum = cof.conkey[1] AND
		af.attname = LOWER (c.columnname))
) as internal

union

-- 32 - Image - AD_Image
select 'ALTER TABLE '||tablename||
' ADD CONSTRAINT '||SUBSTR (REPLACE (SUBSTR (columnname, 1, LENGTH (columnname) - 3), '_', '') || '_' || REPLACE (tablename, '_', ''), 1, 30)||
' FOREIGN KEY('||columnname||') REFERENCES AD_Image(AD_Image_ID)'
||' DEFERRABLE INITIALLY DEFERRED'||
';'||chr(10)
from (
select t.tablename, c.columnname, c.ad_reference_id, c.ad_reference_value_id from ad_table t join ad_column c on (t.ad_table_id=c.ad_table_id) 
where c.ad_reference_id = 32
and t.isactive='Y' AND c.isactive='Y' and c.columnsql IS NULL and t.isview = 'N' and t.tablename not like 'T|_%' escape '|' and t.tablename not in ('Test')
and columnname != 'BinaryData'
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
		clp.relname = LOWER ('AD_Image') AND
		nsp.nspname = 'adempiere' AND
		cop.contype = 'p' AND
		cof.conrelid = clf.oid AND
		clf.relnamespace = nsf.oid AND
		clf.relname = LOWER (t.tablename) AND
		nsf.nspname = 'adempiere' AND
		cof.contype = 'f' AND
		af.attnum = cof.conkey[1] AND
		af.attname = LOWER (c.columnname))
) as internal

union

-- 21 - Location - C_Location_ID
select 'ALTER TABLE '||tablename||
' ADD CONSTRAINT '||SUBSTR (REPLACE (SUBSTR (columnname, 1, LENGTH (columnname) - 3), '_', '') || '_' || REPLACE (tablename, '_', ''), 1, 30)||
' FOREIGN KEY('||columnname||') REFERENCES C_Location(C_Location_ID)'
||' DEFERRABLE INITIALLY DEFERRED'||
';'||chr(10)
from (
select t.tablename, c.columnname, c.ad_reference_id, c.ad_reference_value_id from ad_table t join ad_column c on (t.ad_table_id=c.ad_table_id) 
where c.ad_reference_id = 21
and t.isactive='Y' AND c.isactive='Y' and c.columnsql IS NULL and t.isview = 'N' and t.tablename not like 'T|_%' escape '|' and t.tablename not in ('Test')
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
		clp.relname = LOWER ('C_Location') AND
		nsp.nspname = 'adempiere' AND
		cop.contype = 'p' AND
		cof.conrelid = clf.oid AND
		clf.relnamespace = nsf.oid AND
		clf.relname = LOWER (t.tablename) AND
		nsf.nspname = 'adempiere' AND
		cof.contype = 'f' AND
		af.attnum = cof.conkey[1] AND
		af.attname = LOWER (c.columnname))
) as internal

union

-- 31 - Locator - M_Locator_ID
select 'ALTER TABLE '||tablename||
' ADD CONSTRAINT '||SUBSTR (REPLACE (SUBSTR (columnname, 1, LENGTH (columnname) - 3), '_', '') || '_' || REPLACE (tablename, '_', ''), 1, 30)||
' FOREIGN KEY('||columnname||') REFERENCES M_Locator(M_Locator_ID)'
||' DEFERRABLE INITIALLY DEFERRED'||
';'||chr(10)
from (
select t.tablename, c.columnname, c.ad_reference_id, c.ad_reference_value_id from ad_table t join ad_column c on (t.ad_table_id=c.ad_table_id) 
where c.ad_reference_id = 31
and t.isactive='Y' AND c.isactive='Y' and c.columnsql IS NULL and t.isview = 'N' and t.tablename not like 'T|_%' escape '|' and t.tablename not in ('Test')
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
		clp.relname = LOWER ('M_Locator') AND
		nsp.nspname = 'adempiere' AND
		cop.contype = 'p' AND
		cof.conrelid = clf.oid AND
		clf.relnamespace = nsf.oid AND
		clf.relname = LOWER (t.tablename) AND
		nsf.nspname = 'adempiere' AND
		cof.contype = 'f' AND
		af.attnum = cof.conkey[1] AND
		af.attname = LOWER (c.columnname))
) as internal

union

-- 35 - Product Attribute - M_AttributeSetInstance_ID
select 'ALTER TABLE '||tablename||
' ADD CONSTRAINT '||SUBSTR (REPLACE (SUBSTR (columnname, 1, LENGTH (columnname) - 3), '_', '') || '_' || REPLACE (tablename, '_', ''), 1, 30)||
' FOREIGN KEY('||columnname||') REFERENCES M_AttributeSetInstance(M_AttributeSetInstance_ID)'
||' DEFERRABLE INITIALLY DEFERRED'||
';'||chr(10)
from (
select t.tablename, c.columnname, c.ad_reference_id, c.ad_reference_value_id from ad_table t join ad_column c on (t.ad_table_id=c.ad_table_id) 
where c.ad_reference_id = 35
and t.isactive='Y' AND c.isactive='Y' and c.columnsql IS NULL and t.isview = 'N' and t.tablename not like 'T|_%' escape '|' and t.tablename not in ('Test')
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
		clp.relname = LOWER ('M_AttributeSetInstance') AND
		nsp.nspname = 'adempiere' AND
		cop.contype = 'p' AND
		cof.conrelid = clf.oid AND
		clf.relnamespace = nsf.oid AND
		clf.relname = LOWER (t.tablename) AND
		nsf.nspname = 'adempiere' AND
		cof.contype = 'f' AND
		af.attnum = cof.conkey[1] AND
		af.attname = LOWER (c.columnname))
) as internal

union

-- 53370 - Chart - AD_Chart
select 'ALTER TABLE '||tablename||
' ADD CONSTRAINT '||SUBSTR (REPLACE (SUBSTR (columnname, 1, LENGTH (columnname) - 3), '_', '') || '_' || REPLACE (tablename, '_', ''), 1, 30)||
' FOREIGN KEY('||columnname||') REFERENCES AD_Chart(AD_Chart_ID)'
||' DEFERRABLE INITIALLY DEFERRED'||
';'||chr(10)
from (
select t.tablename, c.columnname, c.ad_reference_id, c.ad_reference_value_id from ad_table t join ad_column c on (t.ad_table_id=c.ad_table_id) 
where c.ad_reference_id = 53370
and t.isactive='Y' AND c.isactive='Y' and c.columnsql IS NULL and t.isview = 'N' and t.tablename not like 'T|_%' escape '|' and t.tablename not in ('Test')
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
		clp.relname = LOWER ('AD_Chart') AND
		nsp.nspname = 'adempiere' AND
		cop.contype = 'p' AND
		cof.conrelid = clf.oid AND
		clf.relnamespace = nsf.oid AND
		clf.relname = LOWER (t.tablename) AND
		nsf.nspname = 'adempiere' AND
		cof.contype = 'f' AND
		af.attnum = cof.conkey[1] AND
		af.attname = LOWER (c.columnname))
) as internal

) as cmds

-- where cmd not like '%Asset%' and cmd not like '%A_Funding%'

order by 1
