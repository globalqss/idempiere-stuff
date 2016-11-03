do $$
/*
Date: 2015-01-27 15:00
Author: Carlos Ruiz - GlobalQSS
This is an iDempiere script
Script to validate Record_ID as foreign key
The script can be used to delete the orphan records on tables with Record_ID (which cannot be managed with database referential integrity)
*/
declare
    rt record;
    rr record;
    cmd varchar(2000);
    cmddel varchar(2000);
    selr varchar(2000);
    v_tablename varchar(2000);
    cnt integer;
begin
    raise notice 'table|id|reftableid|reftable|record_id|delete';
    for rt in
        select t.tablename
	    from ad_column c
	        join ad_table t on c.ad_table_id=t.ad_table_id
	    where c.columnname='Record_ID'
	        and t.isview='N' and t.isactive='Y'
		and t.tablename not like 'T|_%' escape '|'
		and exists (select 1 from ad_column ci where ci.ad_table_id=t.ad_table_id and ci.columnname='AD_Table_ID')
		-- these multi-key tables are not checked
		-- -> AD_Sequence_Audit, AD_Attribute_Value, AD_Record_Access, AD_PInstance_Log, AD_Private_Access, K_Index
		and exists (select 1 from ad_column ci where ci.ad_table_id=t.ad_table_id and ci.columnname=t.tablename||'_ID')
	    order by 1
    loop
	selr := 'select '||rt.tablename||'_id as id, ad_table_id, record_id from '||rt.tablename||' order by 2,3';
	for rr in execute selr
	loop
	    if rr.ad_table_id > 0
	    then
		select tablename into v_tablename from ad_table where ad_table_id=rr.ad_table_id;
		if rr.record_id > 0
		then
		    cmd := 'select count(*) as cnt from '||v_tablename||' where '||v_tablename||'_id=$1';
		    begin
			execute cmd into cnt using rr.record_id;
		    exception
			when sqlstate '42703' then
			    cnt := -1;
		    end;
		    if (cnt = 0)
		    then
			cmddel := 'delete from '||rt.tablename||' where ad_table_id='||rr.ad_table_id||' and record_id='||rr.record_id;
			if (rt.tablename = 'AD_ChangeLog')
			then
			    cmddel := cmddel || ' and (eventchangelog!=''D'' or eventchangelog is null);';
			end if;
			cmddel := cmddel || ';';
			raise notice '%|%|%|%|%|%', rt.tablename, rr.id, rr.ad_table_id, v_tablename, rr.record_id, cmddel;
		    end if;
		end if;
	    end if;
	end loop;
    end loop;
end
$$;
