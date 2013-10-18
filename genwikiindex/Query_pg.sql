SELECT     t.node_id, t.parent_id, t.depth, t.seqno,
           issummary,
	   -- rpad('>', depth-1, '>') || 
	   replace(m.name, ',', '|') as name,
                 COALESCE(m.action, '') AS TYPE,
                 CASE m.action
                         WHEN 'B' THEN 'Workbench'
                         WHEN 'F' THEN 'Workflow'
                         WHEN 'P' THEN 'Process'
                         WHEN 'R' THEN 'Report'
                         WHEN 'T' THEN 'Task'
                         WHEN 'W' THEN 'Window'
                         WHEN 'X' THEN 'Form'
                         ELSE 'Menu'
                 END AS action,
                 COALESCE
                    (f.classname,
                     COALESCE (p.classname,
                          COALESCE (p.procedurename,
                               COALESCE (k.os_command,
                                    qss_get_tables_from_window (m.ad_window_id)
                                   )
                              )
                         )
                    ) AS technical,
                 coalesce(p.ad_process_id, f.ad_form_id, k.ad_task_id, w.ad_window_id, wf.ad_workflow_id) as id,
                 COALESCE(COALESCE(f.isbetafunctionality, COALESCE(p.isbetafunctionality, COALESCE(wf.isbetafunctionality, w.isbetafunctionality), ''))) as isbetafunctionality,
                  t.path
            FROM (
with recursive fullmenu(node_id, parent_id, depth, seqno, path) as (
select t.node_id, t.parent_id, 1, t.seqno, ARRAY[t.node_id::varchar] from ad_treenodemm t where ad_tree_id=10 and t.parent_id=0
union all
select t.node_id, t.parent_id, fm.depth+1, t.seqno, path || t.node_id::varchar from ad_treenodemm t join fullmenu fm on fm.node_id = t.parent_id where ad_tree_id=10
)
select * from fullmenu) 
as t
                 JOIN AD_MENU m ON t.node_id = m.ad_menu_id
                 LEFT JOIN AD_PROCESS p ON m.ad_process_id = p.ad_process_id AND p.isactive='Y'
                 LEFT JOIN AD_FORM f ON m.ad_form_id = f.ad_form_id AND f.isactive='Y'
                 LEFT JOIN AD_TASK k ON m.ad_task_id = k.ad_task_id AND k.isactive='Y'
                 LEFT JOIN AD_WINDOW w ON m.ad_window_id = w.ad_window_id AND w.isactive='Y'
                 LEFT JOIN AD_WORKFLOW wf ON m.ad_workflow_id = wf.ad_workflow_id AND wf.isactive='Y'
           WHERE m.isactive = 'Y'
             -- AND m.ad_menu_id < 1000000
order by t.path
