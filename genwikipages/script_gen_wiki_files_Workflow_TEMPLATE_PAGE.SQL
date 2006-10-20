/*
 # ADempiere contribution
 # Author: Alejandro Falcone - openbiz 
 # 
 # Script to get the info from Application Dictionary to fill the wiki pages 
 # The script basically obtain the following information:
 #  . Workflow Name
 #  . Nodes Names
 # With the helps for those items.
 #  . And some Technical information as Table Name, Column Name, DB Type, Adempiere Type
 #
 # With this information create a file with the Workflow name (in english), the language sufix and .wiki 
 # extension to upload into the Adempiere wiki (i.e. ManPageW_SalesRepInfo_es.wiki for Spanish language or 
 # ManPageW_SalesRepInfo_ru.wiki for russian language). For en_US language the name don't have sufix (i.e.
 #  ManPageW_SalesRepInfo.wiki)
*/


DECLARE
/* REPLACE THIS VALUE WITH YOU NEED
 # The Workflow ID number. If you fill with 0 (zero)
 # the script will generate all files for all workflows */
   v_workflow_id             NUMBER             := 0;
/* REPLACE THIS VALUE WITH YOU NEED
 # (i.e. en_US, de_DE, ru_RU, etc) */
   v_language              VARCHAR (10)       := 'en_US_base';
/* REPLACE THIS VALUE WITH YOU NEED
 # Change the following values with the translation for your language!
 # Those are the Titles
*/
   v_str_return            VARCHAR (100)      := 'Return to Index';
   v_str_typew             VARCHAR (40)       := 'Workflow';
   v_str_typen             VARCHAR (40)       := 'Nodes';  -- In Plural
   v_str_help_title        VARCHAR (40)       := 'Help ';
   v_str_type_title        VARCHAR (40)       := 'Type ';
   v_str_desc_title        VARCHAR (40)       := 'Description ';
   v_str_name_title        VARCHAR (40)       := 'Name ';
   v_str_technical_title   VARCHAR (40)       := 'Technical Data';
   v_str_tablename_title   VARCHAR (40)       := 'Table Name    : ';
/* END REPLACE THIS VALUE WITH YOU NEED */
   v_str_man_index         VARCHAR (200);
   str_end                 VARCHAR (5);
   f                       UTL_FILE.file_type;
   f_main                  UTL_FILE.file_type;
   v_file_olh              VARCHAR (80)       := ' ';
   v_wname                 VARCHAR (80);
   v_nname                 VARCHAR (80);
   v_imagename             VARCHAR (100);
   v_bold                  VARCHAR (3)        := '''''''';   -- For Bold Text
   v_ital                  VARCHAR (2)        := '''''';   -- For Italic Text
   v_flag_opentable        BOOLEAN;

   CURSOR c1
   IS   -- WORKFLOW 
        SELECT 'es_US_base',
	       'F' as type,
		m.AD_MENU_ID, 
		m.AD_PROCESS_ID,
                0 as ad_wf_node_id,
		m.NAME, 
		m.DESCRIPTION ,       
		m.ad_workflow_id,
                f.help,
                m.ad_window_id,
                m.name as linkname,
                0 as ad_wf_next_id,
                ' ' as action
 	   FROM AD_MENU m, AD_WORKFLOW f
	  WHERE (m.AD_WORKFLOW_ID = v_workflow_id OR v_workflow_id = 0)
            AND m.entitytype = 'D'
	    AND m.action = 'F' 
	    AND m.isactive='Y'
            AND m.ad_workflow_id = f.ad_workflow_id
      UNION
        -- NODES
	SELECT 'es_US_base',
		'N' as type,
		0,
		0,
		n.AD_wf_node_ID,
		n.NAME, 
		n.DESCRIPTION ,       
		n.ad_workflow_id,
		n.help,
		n.ad_window_id,
                NVL (w.name,
                     NVL(p.name,
                         NVL(o.name,
                             NVL(t.name,n.name)
                             )
                        )                   
                     ) as linkname,                      
                x.ad_wf_next_id,
                n.action
 	   FROM AD_WF_NODE n, ad_WF_NODENEXT x, ad_window w, ad_process p, ad_form o, ad_task t
   	  WHERE EXISTS (SELECT 1
                           FROM AD_MENU
                          WHERE ad_menu.ad_workflow_id = n.ad_workflow_id 
                            AND ad_menu.AD_MENU_ID <> 0)
            AND(n.AD_workflow_ID = v_workflow_id OR v_workflow_id = 0)
            AND n.isactive='Y'
            AND n.AD_wf_NODE_ID = x.AD_wf_NODE_ID(+)
            AND n.ad_process_id = p.ad_process_id(+)
            AND n.ad_form_id = o.ad_form_id(+)
            AND n.ad_task_id = t.ad_task_id(+)
            AND n.ad_window_id = w.ad_window_id(+);

BEGIN
   IF LOWER (SUBSTR (v_language, 1, 2)) <> 'en'
   THEN
      str_end := '_' || LOWER (SUBSTR (v_language, 1, 2));
   ELSE
      str_end := '';
   END IF;

   v_flag_opentable := FALSE;
   v_str_man_index :=
                    '[[Manual' || str_end || '|' || TRIM (v_str_return)
                    || ']]';

   FOR r IN c1
   LOOP
      IF r.TYPE = 'F'
      THEN
         -- Workflow Type
         SELECT NAME
           INTO v_wname
           FROM ad_workflow
          WHERE ad_workflow_id = r.ad_workflow_id;    -- Get Workflow Name (English)

         IF SQL%ROWCOUNT = 0
         THEN
            v_wname := r.NAME;
         END IF;

         IF v_flag_opentable 
         THEN
            -- New Workflow and Table for Nodes is Open -> Close Table
            UTL_FILE.put_line (f, '|}');
            v_flag_opentable := FALSE;
         END IF;

         IF v_file_olh <> ' '
         THEN
            -- Close previous file
            UTL_FILE.fclose (f);
         END IF;

         -- fill the Name Page
         v_file_olh :=
               TRIM ('ManPageF_' || TRANSLATE (v_wname, '_&, /', '_'))
            || '_olh'
            || str_end
            || '.wiki';
         f := UTL_FILE.fopen ('DIR_TEMP', v_file_olh, 'w');
         UTL_FILE.put_line (f, ' ');
         UTL_FILE.put_line (f, '==' || v_str_typew || ': ' || r.NAME || '==');

	 UTL_FILE.put_line (f, ' ');
         UTL_FILE.put_line (f,
                               v_bold
                            || v_str_desc_title
                            || ': '
                            || v_bold
                            || r.description
                           );
         UTL_FILE.put_line (f, ' ');
         UTL_FILE.put_line (f,
                               v_bold
                            || v_str_help_title
                            || ': '
                            || v_bold
                            || ' '
                            || r.HELP
                           );
         UTL_FILE.put_line (f, ' ');
      END IF;


      IF r.TYPE = 'N'
      THEN
      -- Node Type
      
         IF NOT v_flag_opentable
         THEN
           -- Open Table for Nodes
           UTL_FILE.put_line (f, v_bold || v_str_typen || v_bold);
           UTL_FILE.put_line (f, ' ');
           UTL_FILE.put_line
               (f,
                '{|{| border="1" cellpadding="5" cellspacing="0" align="center"'
               );
           UTL_FILE.put_line (f,
                                 '!style="background:#efefef;" width="200"|'
                              || v_str_name_title
                             );
           UTL_FILE.put_line (f,
                                 '!style="background:#efefef;" width="150"|'
                              || v_str_desc_title
                             );
           UTL_FILE.put_line (f,
                                 '!style="background:#efefef;" width="300"|'
                              || v_str_help_title
                             );
           UTL_FILE.put_line (f,
                                 '!style="background:#efefef;" width="150"|'
                              || '<small>'
                              || v_str_technical_title
                              || '</small>'
                             );
           v_flag_opentable := TRUE; -- Flag activated to indicate Table is Open
        -- End Table for Nodes
         END IF;
         UTL_FILE.put_line (f, '|-');
         UTL_FILE.put_line (f, '|-valign="top"');
         UTL_FILE.put_line (f,
                            '|' || v_ital || v_bold || r.NAME || v_bold
                            || v_ital
                           );
         UTL_FILE.put_line (f, '||' || r.description);
         UTL_FILE.put_line (f, '||' || r.HELP);
         UTL_FILE.put_line (f, '|| ' || '<small>' || '[[ManPage'
                            || UPPER(r.action)
                            || '_'
                            || TRIM (TRANSLATE (r.linkname, '_&, /', '_'))
                            || str_end
                            || '|'
                            || r.linkname
                            || ']]');
         
         UTL_FILE.put_line (f, '</small>');
         UTL_FILE.put_line (f, '|-valign="top"');
      END IF;
 
   END LOOP;

   IF v_flag_opentable
   THEN
      -- Table for Nodes is Open -> Close Table
      UTL_FILE.put_line (f, '|}');
      v_flag_opentable := FALSE;
   END IF;
   
   IF v_file_olh <> ' '
   THEN
      -- Close previous file
      UTL_FILE.fclose (f);
   END IF;
END;
