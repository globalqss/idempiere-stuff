-- takes 12 minutes
-- run as
-- psql -d idempiere -U adempiere -q -P tuples_only=on -P footer=off -Pborder=0 -P format=unaligned -f script_gen_wiki_files_Window_TEMPLATE_PAGE_pg.sql > /tmp/script_gen_wiki_files_Window_TEMPLATE_PAGE_pg.sh
-- and then execute the generated script

SELECT
'cat <<! | sed -e ''$d'' | sed -e ''$d'' > "/tmp/wiki/Template:'||translate(w.name,' /','_-')||'_(Window_ID-'||w.ad_Window_id||'_V1.0.0).wiki"
= Window: '||w.name||' =

''''''Description:'''''' '||coalesce(w.description,'')||'

''''''Help:'''''' '||coalesce(w.help,'')||'

'||
coalesce(tab.tabs,'')
||'
!
' AS wikitext
--,ad_language, ad_window_id, ad_tab_id, ad_field_id, TYPE, NAME, description, HELP, seqtab, seqfld, dbtable, dbcolumn, dbtype, adempieretype, ISBETAFUNCTIONALITY
    FROM AD_Menu m
        JOIN AD_Window w ON (m.ad_window_id = w.ad_window_id)
        LEFT JOIN (
            SELECT t.ad_window_id, 
                   string_agg(
                       '== Tab: '||t.name||' =='
                       ||chr(10)||'''''''Description:'''''' '
                       ||coalesce(t.description,'')
                       ||chr(10)||chr(10)||'''''''Help:'''''' '
                       ||coalesce(t.help,'')
                       ||chr(10)
                       ||chr(10)
                       ||'[[Image:'
                       ||translate((SELECT name FROM ad_window WHERE ad_window_id=t.ad_window_id),' /','_-')
                       ||'_-_'
                       ||translate(t.name,' /','_-')
                       ||'_'
                       -- 122     Country Region and City Translation
                       -- 146     Price List      Translation
                       -- add _SeqNo to the filename to avolid duplicates in name
                       ||CASE WHEN (t.ad_window_id = 122 AND t.ad_tab_id = 549) OR (t.ad_window_id = 146 AND t.ad_tab_id = 200130) THEN t.seqno||'' ELSE '' END
                       ||'-_Window_(iDempiere_1.0.0).png|border]]'
                       ||chr(10)
                       ||'
{| border="1" cellpadding="5" cellspacing="0" align="center"
|+''''''Fields''''''
!style="background:#efefef;" width="100"|Name
!style="background:#efefef;" width="150"|Description
!style="background:#efefef;" width="300"|Help
!style="background:#efefef;" width="100"|<small>Technical Data</small>
'
                       ||(SELECT
                              string_agg(
                                  '|-valign="top"'
                                  ||chr(10)||'|'
                                  ||coalesce(f.name,'')
                                  ||chr(10)||'|'
                                  ||coalesce(f.description,'')
                                  ||chr(10)||'|'
                                  ||coalesce(f.help,'')
                                  ||chr(10)||'|'
                                  ||'<small>'||dbtable||'.'||dbcolumn||'<br>'||dbtype||'<br>'||adempieretype||'</small>'
                                  ||chr(10)
                                , '' ORDER BY f.seqfld) AS flds
                              FROM rv_query_for_manual f
                              WHERE f.ad_tab_id=t.ad_tab_id
                                  AND f.ad_field_id>0
                                  AND f.ad_language='en_US_base'
                         )
                       ||'|}'
                       ||chr(10)
                       ||chr(10)
                     , '' ORDER BY t.seqno) AS tabs
                FROM ad_tab t
                WHERE t.isactive='Y'
                GROUP BY t.ad_window_id
             ) AS tab ON (tab.ad_window_id=w.ad_window_id)
    WHERE m.ad_menu_id < 1000000
        AND m.action = 'W'
        AND m.isactive = 'Y'
    ORDER BY w.ad_window_id;
