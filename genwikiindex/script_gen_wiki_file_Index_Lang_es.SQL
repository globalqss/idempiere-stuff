/*
 # ADempiere contribution
 # Author: Alejandro Falcone - openbiz
 # Generates Index Manual wiki page from the menu Tree
 # 
*/


DECLARE
/* REPLACE THIS VALUE WITH YOU NEED
 # (i.e. en_US, de_DE, ru_RU, etc) */
   v_language         VARCHAR (10)       := 'es_MX';
   v_currentversion   VARCHAR (5)        := '3.1.2';
/* REPLACE THIS VALUE WITH YOU NEED
 # Change the following values with the translation for your language!
 # Those are the Titles
*/
   v_str_msg1         VARCHAR (500)
      :=    'Este índice está basado en el menú de ADempiere '
         || v_currentversion
         || '. Como valor agregado hemos incorporado para cada opción:';
   v_str_msg2         VARCHAR (500)
      := '* en la segunda columna el tipo de programa: Workbench, WorkFlow, Process, Report, Task, Window, Form, Menu.';
   v_str_msg3         VARCHAR (500)
      :=    '* en la tercer columna el nombre de las tablas implicadas, y el nombre de los reportes y/o procesos'
         || 'dentro de esa opción.';
   v_str_msg4         VARCHAR (500)
      :=    'Esta sola información ya es una buena ayuda técnica; si por ejemplo quieres saber '
         || 'por cual ventana se mantiene una tabla, solo tienes que buscarla en esta página y te dirá cual es la ventana de mantenimiento.'
         || 'De igual forma, si quieres saber en qué opción se ejecuta un proceso, lo buscas y te indicará la '
         || 'ventana/proceso/reporte correspondiente.';
   v_str_modify       VARCHAR (500)
      := 'Por favor, no modifique el contenido, pues este índice se genera automáticamente mediante un script.';
/* END REPLACE THIS VALUE WITH YOU NEED */
   v_lang2            VARCHAR (2)        := LOWER (SUBSTR (v_language, 1, 2));
   v_str_man_index    VARCHAR (200);
   str_end            VARCHAR (5);
   f_main             UTL_FILE.file_type;
   v_file             VARCHAR (80)       := ' ';
   v_wname            VARCHAR (80);
   v_bold             VARCHAR (3)        := '''''''';         -- For Bold Text
   v_ital             VARCHAR (2)        := '''''';         -- For Italic Text
   v_str_dot          VARCHAR (80);
   v_str_sec          VARCHAR (5)        := '';
   v_flag_opentable   BOOLEAN;

   CURSOR c1
   IS
      SELECT     LEVEL, LEVEL - 1 AS levelparent, issummary, mt.NAME,
                 m.NAME AS us_name, m.action AS TYPE,
                 DECODE (m.action,
                         'B', 'Workbench',
                         'F', 'WorkFlow',
                         'P', 'Process',
                         'R', 'Report',
                         'T', 'Task',
                         'W', 'Window',
                         'X', 'Form',
                         '', 'Menu',
                         '?'
                        ) AS action,
                 NVL
                    (f.classname,
                     NVL (p.classname,
                          NVL (p.procedurename,
                               NVL (k.os_command,
                                    qss_get_tables_from_window (m.ad_window_id)
                                   )
                              )
                         )
                    ) AS technical
            FROM ad_treenodemm t,
                 ad_menu m,
                 (SELECT *
                    FROM ad_menu_trl
                   WHERE ad_language = v_language) mt,
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
             AND m.entitytype = 'D'
      CONNECT BY NOCYCLE PRIOR t.node_id = t.parent_id
      START WITH t.parent_id = 0 OR parent_id IS NULL
        ORDER SIBLINGS BY t.seqno;
BEGIN
   IF v_lang2 <> 'en'
   THEN
      str_end := '_' || v_lang2;
   ELSE
      str_end := '';
   END IF;

   v_file := 'Manual_' || v_currentversion || str_end || '.wiki';
   -- Generate Main Page
   f_main := UTL_FILE.fopen ('DIR_TEMP', v_file, 'w');
   v_flag_opentable := FALSE;
   UTL_FILE.put_line (f_main, v_str_msg1);
   UTL_FILE.put_line (f_main, v_str_msg2);
   UTL_FILE.put_line (f_main, v_str_msg3);
   UTL_FILE.put_line (f_main, v_str_msg4);
   UTL_FILE.put_line (f_main, ' ');
   UTL_FILE.put_line (f_main,
                      '[[Image:ManPageM_MainMenu_' || v_lang2 || '.png]]'
                     );
   UTL_FILE.put_line (f_main, ' ');
   UTL_FILE.put_line (f_main,
                      '<center><small>' || v_str_modify || '</small></center>'
                     );

   FOR r IN c1
   LOOP
      v_str_sec := '';

      IF (r.LEVEL <= 4 AND r.issummary = 'Y')
      THEN
         v_str_sec := TRIM (RPAD (' ', r.LEVEL + 1, '='));
      END IF;

      IF r.issummary = 'Y'
      THEN
         IF v_flag_opentable
         THEN
            -- Table is Open -> Close Table
            UTL_FILE.put_line (f_main, '|}');
            v_flag_opentable := FALSE;
         END IF;

         IF r.levelparent = 0
         THEN
            -- Insert Empty Line
            UTL_FILE.put_line (f_main, ' ');
            UTL_FILE.put_line (f_main, ' ');
         END IF;

         -- Title
         UTL_FILE.put_line (f_main, v_str_sec || TRIM (r.NAME) || v_str_sec);
         UTL_FILE.put_line (f_main, ' ');
      ELSE
         -- Table Format
         IF NOT v_flag_opentable
         THEN
            v_flag_opentable := TRUE;
            -- Flag activated to indicate Table is Open
            UTL_FILE.put_line (f_main, '{|');
            UTL_FILE.put_line (f_main, '|-');
         END IF;                                       --  IF v_flag_openTable

         v_str_dot :=
                 TRIM (LPAD (' ', ((r.levelparent + 1) * (r.LEVEL - 2)), '.'));
         UTL_FILE.put_line (f_main, '|-valign="top"');
         UTL_FILE.put_line (f_main,
                               '|width="280"|'
                            || '[[ManPage'
                            || UPPER (r.TYPE)
                            || '_'
                            || TRIM (TRANSLATE (r.us_name, '_&, /', '_'))
                            || str_end
                            || '|'
                            || '<span style="color: white;">'
                            || v_str_dot
                            || '</span>'
                            || r.NAME
                            || ']]'
                           );
         UTL_FILE.put_line
                      (f_main,
                          '|width="80"|<span style="font-variant:small-caps">'
                       || r.action
                       || '</span>'
                      );
         UTL_FILE.put_line (f_main,
                            '|width="450"|<small>' || r.technical
                            || '</small>'
                           );
         UTL_FILE.put_line (f_main, '|-valign="top"');
         UTL_FILE.put_line (f_main, '|-');
         UTL_FILE.put_line (f_main, ' ');
      END IF;                                         --  IF r.issummary = 'Y'
   --
   END LOOP;

   IF v_flag_opentable
   THEN
      -- Table is Open -> Close Table
      UTL_FILE.put_line (f_main, '|}');
   END IF;

   UTL_FILE.put_line (f_main, ' ');
   UTL_FILE.put_line (f_main,
                      '[[Category:Adempiere' || v_currentversion || ']]'
                     );
   UTL_FILE.put_line (f_main, ' ');
   UTL_FILE.fclose (f_main);
END;
