SELECT
'cat > "/tmp/wiki/Template:'||translate(f.name,'& /','__-')||'_(Info_ID-'||f.ad_infowindow_id||'_V1.0.0).wiki" <<!
== Info Window: '||f.name||' ==

''''''Description:'''''' '||coalesce(f.description,'')||'

''''''Help:'''''' '||coalesce(f.help,'')||'

[[image:'||translate(f.name,'& /','__-')||'_-_Info_(iDempiere_1.0.0).png]]

!
' AS wikitext
--,'en_US_base', m.ad_menu_id, m.ad_infowindow_id, m.NAME,m.description, f.HELP, f.classname, f.ISBETAFUNCTIONALITY
          FROM AD_MENU m, AD_infowindow f
         WHERE m.ad_menu_id < 1000000
           AND m.action = 'I'
           AND m.isactive = 'Y'
           AND m.ad_infowindow_id = f.ad_infowindow_id
      ORDER BY f.ad_infowindow_id;