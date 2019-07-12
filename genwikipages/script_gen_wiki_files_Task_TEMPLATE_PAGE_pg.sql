SELECT
'cat > "/tmp/wiki/Template:'||translate(f.name,'& /','__-')||'_(Task_ID-'||f.ad_task_id||'_V1.0.0).wiki" <<!
== Task: '||f.name||' ==

''''''Description:'''''' '||coalesce(f.description,'')||'

''''''Help:'''''' '||coalesce(f.help,'')||'

[[image:'||translate(f.name,'& /','__-')||'_-_Task_(iDempiere_1.0.0).png]]

!
' AS wikitext
--,'en_US_base', m.ad_menu_id, m.ad_task_id, m.NAME,m.description, f.HELP, f.classname, f.ISBETAFUNCTIONALITY
          FROM AD_Menu m, AD_Task f
         WHERE m.ad_menu_id < 1000000
           AND m.action = 'T'
           AND m.isactive = 'Y'
           AND m.ad_task_id = f.ad_task_id
      ORDER BY f.ad_task_id;
