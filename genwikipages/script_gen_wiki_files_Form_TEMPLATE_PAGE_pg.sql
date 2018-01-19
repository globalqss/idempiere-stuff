SELECT
'cat > "/tmp/wiki/Template:'||translate(f.name,'& /','__-')||'_(Form_ID-'||f.ad_form_id||'_V1.0.0).wiki" <<!
== Form: '||f.name||' ==

''''''Description:'''''' '||coalesce(f.description,'')||'

''''''Help:'''''' '||coalesce(f.help,'')||'

[[image:'||translate(f.name,'& /','__-')||'_-_Form_(iDempiere_1.0.0).png]]

!
' AS wikitext
--,'en_US_base', m.ad_menu_id, m.ad_form_id, m.NAME,m.description, f.HELP, f.classname, f.ISBETAFUNCTIONALITY
          FROM AD_MENU m, AD_FORM f
         WHERE m.ad_menu_id < 1000000
           AND m.action = 'X'
           AND m.isactive = 'Y'
           AND m.ad_form_id = f.ad_form_id
      ORDER BY f.ad_form_id;