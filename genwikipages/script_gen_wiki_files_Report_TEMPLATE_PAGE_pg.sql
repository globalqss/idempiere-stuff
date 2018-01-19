SELECT
'cat > "/tmp/wiki/Template:'||translate(f.name,'& /','__-')||'_(Report_ID-'||f.ad_process_id||'_V1.0.0).wiki" <<!
== Report: '||f.name||' ==

''''''Description:'''''' '||coalesce(f.description,'')||'

''''''Help:'''''' '||coalesce(f.help,'')||'

[[image:'||translate(f.name,'& /','__-')||'_-_Report_(iDempiere_1.0.0).png]]

'|| CASE WHEN (SELECT count(*) FROM ad_process_para pp WHERE pp.ad_process_id=f.ad_process_id AND pp.isactive='Y')>0
THEN '
{| border="1" cellpadding="5" cellspacing="0" align="center"
|+''''''Report Parameteres''''''
!style="background:#efefef;" width="100"|Name
!style="background:#efefef;" width="150"|Description
!style="background:#efefef;" width="300"|Help
!style="background:#efefef;" width="100"|<small>Technical Data</small>
'||
coalesce(prm.params,'')
||'
|}
' ELSE '' END ||'
!
' AS wikitext
--,m.ad_menu_id, m.ad_process_id, m.NAME, m.description, p.HELP, rv.NAME AS repviewname, p.procedurename, p.classname, p.VALUE AS searchkey, p.ISBETAFUNCTIONALITY
    FROM AD_Menu m
        JOIN AD_Process f ON (m.ad_process_id = f.ad_process_id)
        LEFT JOIN AD_REPORTVIEW rv ON (f.ad_reportview_id = rv.ad_reportview_id)
        LEFT JOIN (
            SELECT pp.ad_process_id, 
                   string_agg(
                       '|-valign="top"'
                       ||chr(10)||'|'
                       ||coalesce(pp.name,'')
                       ||chr(10)||'|'
                       ||coalesce(pp.description,'')
                       ||chr(10)||'|'
                       ||coalesce(pp.help,'')
                       ||chr(10)||'|<small>'
                       ||coalesce(pp.columnname,'')
                       ||'<br>'
                       ||(SELECT coalesce(r.name,'') FROM ad_reference r WHERE r.validationtype='D' AND r.ad_reference_id=pp.ad_reference_id)
                       ||'</small>'||chr(10)
                     , '' ORDER BY pp.seqno) AS params
                FROM AD_PROCESS_PARA pp
                WHERE pp.isactive='Y'
                GROUP BY pp.ad_process_id
             ) AS prm ON (prm.ad_process_id=f.ad_process_id)
    WHERE m.ad_menu_id < 1000000
        AND m.action = 'R'
        AND m.isactive = 'Y'
    ORDER BY f.ad_process_id;