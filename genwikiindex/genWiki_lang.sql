/*
# ADempiere contribution
# Author: Carlos Antonio Ruiz Gomez - globalqss
# Generates wiki page from the menu tree
# for system languages
# You must change the two lines marked as:
                      -- Change it here for your language !!!!
#
# Prerequisite: create first the function qss_get_tables_from_window
#
*/
SELECT     CASE
              WHEN LEVEL = 1 AND issummary = 'Y'
                 THEN '== ' || mt.NAME || ' (' || m.NAME || ') =='
              WHEN LEVEL = 2 AND issummary = 'Y'
                 THEN '=== ' || mt.NAME || ' (' || m.NAME || ') ==='
              WHEN LEVEL = 3 AND issummary = 'Y'
                 THEN '==== ' || mt.NAME || ' (' || m.NAME || ') ===='
              WHEN LEVEL = 4 AND issummary = 'Y'
                 THEN '===== ' || mt.NAME || ' (' || m.NAME || ') ====='
              WHEN issummary != 'Y'
              AND NVL
                     (f.classname,
                      NVL
                         (p.classname,
                          NVL (p.procedurename,
                               NVL (k.os_command,
                                    qss_get_tables_from_window (m.ad_window_id)
                                   )
                              )
                         )
                     ) IS NOT NULL
                 THEN    '* [[ManPage'
                      || m.action
                      || '_'
                      || REPLACE (REPLACE (m.NAME, ' ', ''), '_', '')
-- Change it here for your language !!!!
                      || '_es|'
                      || mt.NAME
                      || ']] ('
                      || m.NAME
                      || ') <span style="font-variant:small-caps">'
                      || DECODE (m.action,
                                 'B', 'Workbench',
                                 'F', 'WorkFlow',
                                 'P', 'Process',
                                 'R', 'Report',
                                 'T', 'Task',
                                 'W', 'Window',
                                 'X', 'Form',
                                 '', 'Menu',
                                 '?'
                                )
                      || '</span>'
                      || '''''   ->   ('
                      || NVL
                            (f.classname,
                             NVL
                                (p.classname,
                                 NVL
                                    (p.procedurename,
                                     NVL
                                        (k.os_command,
                                         qss_get_tables_from_window
                                                               (m.ad_window_id)
                                        )
                                    )
                                )
                            )
                      || ')'''''
              ELSE    '<!--'
                   || mt.NAME
                   || ' / '
                   || m.NAME
                   || ' - this option has not associated command -->'
           END CASE
      FROM ad_treenodemm t,
           ad_menu m,
           (SELECT *
              FROM ad_menu_trl
-- Change it here for your language !!!!
            WHERE  ad_language = 'es_MX') mt,
           ad_process p,
           ad_form f,
           ad_task k
     WHERE t.ad_tree_id = 10
       AND t.node_id = m.ad_menu_id
       AND mt.ad_menu_id = m.ad_menu_id
       AND m.ad_process_id = p.ad_process_id(+)
       AND m.ad_form_id = f.ad_form_id(+)
       AND m.ad_task_id = k.ad_task_id(+)
       AND m.isactive = 'Y'
CONNECT BY NOCYCLE PRIOR t.node_id = t.parent_id
START WITH t.parent_id = 0 OR parent_id IS NULL
  ORDER SIBLINGS BY t.seqno;
