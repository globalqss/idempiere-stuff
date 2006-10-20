/*
 # ADempiere contribution
 # Author: Alejandro Falcone - openbiz 
 # 
 # Script to get the info from Application Dictionary to fill the wiki pages 
 # The script basically obtain the following information:
 #  . Task Name
 #
 # With this information create a file with the Task name (in english), the language sufix and .wiki 
 # extension to upload into the Adempiere wiki (i.e. ManPageP_ResetPassword_olh_es.wiki for Spanish language or 
 # ManPageP_ResetPassword_olh_ru.wiki for russian language). For en_US language the name don't have sufix (i.e.
 #  ManPageP_ResetPassword_olh.wiki)
*/


DECLARE
/* REPLACE THIS VALUE WITH YOU NEED
 # The Task ID number. If you fill with 0 (zero)
 # the script will generate all files for all tasks */
   v_task_id              NUMBER             := 0;
/* REPLACE THIS VALUE WITH YOU NEED
 # (i.e. en_US, de_DE, ru_RU, etc) */
   v_language               VARCHAR (10)        := 'es_MX';
/* REPLACE THIS VALUE WITH YOU NEED
 # Change the following values with the translation for your language!
 # Those are the Titles
*/
 v_str_Text_Main          VARCHAR (500)      := '¡Disfrútalo y ayuda a completarlo!' 
   ||'  Pero por favor, siempre respetando los derechos de autor.';
  
  v_str_Text_Main2           VARCHAR(500)      := 'Por favor, escriba sus contribuciones bajo la Sección ';
  -- will be concatenated with v_str_text_section
  
  v_str_text_Section         VARCHAR(20)       := '';
  v_str_contribution_title VARCHAR (80)        := 'Contribuciones';
  v_str_OnLineHelp_Title   VARCHAR (80)        := 'Ayuda en Linea';
  v_str_return             VARCHAR (100)      := 'Retornar al Indice';
/* END REPLACE THIS VALUE WITH YOU NEED */

   v_str_man_index          VARCHAR (200);
   str_end                  VARCHAR (5);
   f                        UTL_FILE.file_type;
   v_file                   VARCHAR (80)       := ' ';
   v_tname                  VARCHAR (80);
   v_bold                   VARCHAR (3)        := '''''''';  -- For Bold Text
   v_ital                   VARCHAR (2)        := '''''';  -- For Italic Text
   v_flag_openTable         BOOLEAN;
 
   CURSOR Task
   IS
      SELECT    m.AD_TASK_ID,
		t.NAME
	   FROM AD_MENU m, AD_TASK t
	  WHERE (m.AD_TASK_ID = v_task_id OR v_task_id = 0)
            AND m.entitytype = 'D'
	    AND m.action = 'T' 
	    AND m.isactive='Y'
	    AND m.AD_TASK_ID = t.AD_TASK_ID
       ORDER BY ad_task_id;


BEGIN
   IF LOWER (SUBSTR (v_language, 1, 2)) <> 'en'
   THEN
      str_end := '_' || LOWER (SUBSTR (v_language, 1, 2));
   ELSE
      str_end := '';
   END IF;

   v_flag_openTable := FALSE;
   v_str_man_index :=
                    '[[Manual' || str_end || '|' || TRIM (v_str_return)
                    || ']]';

   FOR t IN Task
   LOOP
       SELECT NAME
         INTO v_tname
         FROM ad_Task
        WHERE ad_task_id = t.ad_task_id;    -- Get Task Name (English)

       IF SQL%ROWCOUNT = 0
       THEN
         v_tname := t.NAME;
       END IF;

       IF v_file <> ' '
       THEN
          -- Close previous file
          UTL_FILE.fclose (f);
       END IF;

       -- fill the Name Page
       v_file :=
             TRIM ('ManPageT_' || TRANSLATE (v_tname, '_&, /', '_'))
             || str_end
             || '.wiki';


       f := UTL_FILE.fopen ('DIR_TEMP', v_file, 'w');
 
       UTL_FILE.put_line (f, v_str_man_index);  -- Return To Index
       UTL_FILE.put_line (f, ' ');
      
       UTL_FILE.put_line (f, v_str_Text_Main);
       UTL_FILE.put_line (f, ' ');
     
     
       UTL_FILE.put_line (f, 
                            v_str_Text_Main2
                            || '[[#'
                            || v_str_contribution_title
                            || '|' 
                            || v_str_contribution_title
                            || ']] ' 
                            || v_str_text_Section
                            );
                                  
       UTL_FILE.put_line (f, ' ');   
               
       -- Insert Template to OnLineHelp
       UTL_FILE.put_line (f,'<!-- Note to editors: NOT MODIFY THIS CODE -->');
       UTL_FILE.put_line (f,
                            '{{:' 
			    || TRIM ('ManPageT_' || TRANSLATE (v_tname, '_&, /', '_'))
                                 || '_olh'
                                 || str_end
                                 ||'}}'
                                 );
        UTL_FILE.put_line (f,'<!-- END Note to editors: NOT MODIFY THIS CODE -->');
        --
        -- Insert Contributions Section
        UTL_FILE.put_line (f, 
                             '='
                             ||v_str_contribution_title
                             || '=');
                                  
        UTL_FILE.put_line (f, ' ');
        -- 
        UTL_FILE.fclose (f);

   END LOOP;  --  FOR t IN Task
END;
