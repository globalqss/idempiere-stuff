SELECT
'cat > "/tmp/wiki/Template:'||translate(f.name,'& /','__-')||'_(Workflow_ID-'||f.ad_workflow_id||'_V1.0.0).wiki" <<!
== Workflow: '||f.name||' ==

''''''Description:'''''' '||coalesce(f.description,'')||'

''''''Help:'''''' '||coalesce(f.help,'')||'

[[image:'||translate(f.name,'& /','__-')||'_-_Workflow_(iDempiere_1.0.0).png]]

{| border="1" cellpadding="5" cellspacing="0" align="center"
|+''''''Workflow Nodes''''''
!style="background:#efefef;" width="100"|Name
!style="background:#efefef;" width="150"|Description
!style="background:#efefef;" width="300"|Help
!style="background:#efefef;" width="100"|Type
!style="background:#efefef;" width="80"|Zoom
'||
coalesce(nodes.nodes,'')
||'
|}

!
' AS wikitext
--,'en_US_base', 'F' AS TYPE, m.ad_menu_id, m.ad_workflow_id, m.NAME,m.description, f.HELP, f.ISBETAFUNCTIONALITY
    FROM AD_Menu m
        JOIN AD_Workflow f ON (m.ad_workflow_id=f.ad_workflow_id)
        LEFT JOIN (
            SELECT n.ad_workflow_id, 
                   string_agg(
                       '|-valign="top"'
                       ||chr(10)||'|'
                       ||coalesce(n.name,'')
                       ||chr(10)||'|'
                       ||coalesce(n.description,'')
                       ||chr(10)||'|'
                       ||coalesce(n.help,'')
                       ||chr(10)||'|'
                       ||(SELECT coalesce(name,'') FROM ad_ref_list WHERE ad_reference_id=302 AND value=n.ACTION)
                       ||chr(10)||'|'
                       ||coalesce(coalesce(w.NAME,coalesce(p.NAME,coalesce(o.NAME,coalesce(t.NAME,n.NAME)))),'')
                       ||chr(10)
                     , '' ORDER BY tr.depth) AS nodes
                FROM (
                    WITH RECURSIVE nodeswf(ad_workflow_id, ad_wf_node_id, ad_wf_next_id, DEPTH) AS (
                        SELECT w.ad_workflow_id, w.ad_wf_node_id,      wnn.ad_wf_next_id,  1
                            FROM ad_workflow w
                                JOIN ad_wf_nodenext wnn ON wnn.ad_wf_node_id=w.ad_wf_node_id 
                      UNION
                        SELECT wn.ad_workflow_id, wn.ad_wf_node_id, wnn.ad_wf_next_id, nodeswf.depth+1
                            FROM ad_wf_node wn
                                JOIN nodeswf ON nodeswf.ad_wf_next_id=wn.ad_wf_node_id
                                LEFT JOIN ad_wf_nodenext wnn ON wnn.ad_wf_node_id=wn.ad_wf_node_id
                        )
                    SELECT * FROM nodeswf
                    ) AS tr
                    JOIN AD_WF_NODE n ON (tr.ad_wf_node_id=n.ad_wf_node_id)
                    LEFT JOIN AD_WINDOW w USING (ad_window_id)
                    LEFT JOIN AD_PROCESS p USING (ad_process_id)
                    LEFT JOIN AD_FORM o ON (n.ad_form_id=o.ad_form_id)
                    LEFT JOIN AD_TASK t USING (ad_task_id)
                WHERE n.isactive='Y'
                GROUP BY n.ad_workflow_id
             ) AS nodes ON (nodes.ad_workflow_id=f.ad_workflow_id)
    WHERE m.ad_menu_id < 1000000
        AND m.action = 'F'
        AND m.isactive = 'Y'
    ORDER BY f.ad_workflow_id;