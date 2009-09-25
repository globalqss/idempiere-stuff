-- check columns
-- columns in db not in dictionary
select to_char(table_name), to_nchar(column_name) from user_tab_columns
where 
table_name not like '%\_VT' escape '\'
and table_name not like 'BIN$%'
and table_name not in (
select to_char(object_name) from user_objects
where object_type in ('TABLE','VIEW')
and object_name not like '%\_VT' escape '\'
and object_name not like 'BIN$%'
minus
select to_char(upper(t.tablename)) from ad_table t
where t.ISACTIVE = 'Y'
)
minus
select to_char(upper(t.tablename)), to_nchar(upper(c.columnname)) from ad_table t join ad_column c on (t.AD_TABLE_ID = c.AD_TABLE_ID)
where t.ISACTIVE = 'Y' and c.ISACTIVE='Y' and (c.columnsql is null or length(trim(c.COLUMNSQL)) <= 0)
order by 1,2
;

-- columns in db not in dictionary
select to_char(upper(t.tablename)), to_nchar(upper(c.columnname)) 
from ad_table t join ad_column c on (t.AD_TABLE_ID = c.AD_TABLE_ID)
where t.ISACTIVE = 'Y' and c.ISACTIVE='Y' and (c.columnsql is null or length(trim(c.COLUMNSQL)) <= 0)
minus
select to_char(table_name), to_nchar(column_name) from user_tab_columns
order by 1,2
;

-- check db tables
-- columns in db not in dictionary
select to_char(object_name) from user_objects
where object_type in ('TABLE','VIEW')
and object_name not like '%\_VT' escape '\'
and object_name not like 'BIN$%'
minus
select to_char(upper(t.tablename)) from ad_table t
where t.ISACTIVE = 'Y'
order by 1
;

-- tables in dictionary not in db
select to_char(upper(t.tablename)) from ad_table t
where t.ISACTIVE = 'Y'
minus
select to_char(object_name) from user_objects
where object_type in ('TABLE','VIEW')
and object_name not like '%\_VT' escape '\'
and object_name not like 'BIN$%'
order by 1
;
