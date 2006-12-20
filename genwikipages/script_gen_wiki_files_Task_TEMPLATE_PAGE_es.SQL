/*
 # ADempiere contribution
 # Author: Alejandro Falcone - openbiz 
 # 
 # Script to get the info from Application Dictionary to fill the wiki pages 
 # The script basically obtain the following information:
 #  . Task Name
 # With the helps for those items.
 #  . And some Technical information 
 #
 # With this information create a file with the Task name (in english), the language sufix and .wiki 
 # extension to upload into the Adempiere wiki (i.e. ManPageT_Databasetransfer_olh_es.wiki for Spanish language or 
 # ManPageT_Databasetransfer_olh_ru.wiki for russian language). For en_US language the name don't have sufix (i.e.
 # ManPageT_Databasetransfer_olh.wiki )
*/


DECLARE
/* REPLACE THIS VALUE WITH YOU NEED
 # The Task ID number. If you fill with 0 (zero)
 # the script will generate all files for all Tasks */
   v_task_id               NUMBER             := 0;
/* REPLACE THIS VALUE WITH YOU NEED
 # (i.e. en_US, de_DE, ru_RU, etc) */
   v_language              VARCHAR (10)       := 'es_MX';
/* REPLACE THIS VALUE WITH YOU NEED
 # Change the following values with the translation for your language!
 # Those are the Titles
*/
   v_str_return            VARCHAR (100)      := 'Retornar al Indice';
   v_str_typep             VARCHAR (40)       := 'Tarea';
   v_str_help_title        VARCHAR (40)       := 'Ayuda ';
   v_str_type_title        VARCHAR (40)       := 'Tipo ';
   v_str_desc_title        VARCHAR (40)       := 'Descripción ';
   v_str_name_title        VARCHAR (40)       := 'Nombre ';
   v_str_technical_title   VARCHAR (40)       := 'Datos Técnicos';
   v_str_command_title     VARCHAR (40)       := 'Comando: ';
   v_no_modify1            VARCHAR (100)
      := 'Nota al Editor: NO MODIFIQUE ESTE CODIGO.ESTE ARCHIVO SE GENERA MEDIANTE UN SCRIPT.';
   v_no_modify2            VARCHAR (100)
      := 'POR FAVOR, AGREGUE SUS CONTRIBUCIONES EN LA SECCION CONTRIBUCIONES';
/* END REPLACE THIS VALUE WITH YOU NEED */
   v_str_man_index         VARCHAR (200);
   str_end                 VARCHAR (5);
   f                       UTL_FILE.file_type;
   v_file_olh              VARCHAR (80)       := ' ';
   v_tname                 VARCHAR (80);
   v_imagename             VARCHAR (100);
   v_bold                  VARCHAR (3)        := '''''''';   -- For Bold Text
   v_ital                  VARCHAR (2)        := '''''';   -- For Italic Text
   v_flag_opentable        BOOLEAN;
   v_ad_process_id         NUMBER;

   CURSOR task                                                        -- TASK
   IS
      SELECT   ttrl.ad_language, m.ad_menu_id, m.ad_task_id, ttrl.NAME,
               ttrl.description, ttrl.HELP, t.os_command
          FROM ad_menu m, ad_task t, ad_task_trl ttrl
         WHERE (m.ad_task_id = v_task_id OR v_task_id = 0)
           AND m.entitytype = 'D'
           AND m.action = 'T'
           AND m.isactive = 'Y'
           AND m.ad_task_id = t.ad_task_id
           AND t.ad_task_id = ttrl.ad_task_id
           AND ttrl.ad_language = v_language
      ORDER BY m.ad_task_id;
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

   FOR t IN task
   LOOP
      -- Process Type
      SELECT NAME
        INTO v_tname
        FROM ad_task
       WHERE ad_task_id = t.ad_task_id;             -- Get Task Name (English)

      IF SQL%ROWCOUNT = 0
      THEN
         v_tname := t.NAME;
      END IF;

      IF v_file_olh <> ' '
      THEN
         -- Close previous file
         UTL_FILE.put_line (f, ' ');
         UTL_FILE.fclose (f);
      END IF;

      -- fill the Name Page
      v_file_olh :=
            TRIM ('ManPageT_' || TRANSLATE (v_tname, '_&, /', '_'))
         || '_olh'
         || str_end
         || '.wiki';
      f := UTL_FILE.fopen ('DIR_TEMP', v_file_olh, 'w');
      UTL_FILE.put_line (f, ' ');
      -- NO Modify Message to Editor
      UTL_FILE.put_line (f, '<!-- ' || v_no_modify1 || ' -->');
      UTL_FILE.put_line (f, '<!-- ' || v_no_modify2 || ' -->');
      UTL_FILE.put_line (f, ' ');
      -- End No Modify Message
      UTL_FILE.put_line (f, '==' || v_str_typep || ': ' || t.NAME || '==');
      UTL_FILE.put_line (f, ' ');
      UTL_FILE.put_line (f,
                            v_bold
                         || v_str_desc_title
                         || ': '
                         || v_bold
                         || t.description
                        );
      UTL_FILE.put_line (f, ' ');
      UTL_FILE.put_line (f,
                            v_bold
                         || v_str_help_title
                         || ': '
                         || v_bold
                         || ' '
                         || t.HELP
                        );
      UTL_FILE.put_line (f, ' ');

      -- TECHNICAL DATA
      IF t.os_command IS NOT NULL
      THEN
         UTL_FILE.put_line (f,
                               '<small>'
                            || v_str_command_title
                            || t.os_command
                            || ' '
                            || '</small>'
                           );
      END IF;

      -- END TECHNICAL DATA
      UTL_FILE.put_line (f, ' ');
      -- For Image
      v_imagename :=
          'ManPageP_' || TRIM (REPLACE (v_tname, ' ', '')) || str_end
          || '.png';
      UTL_FILE.put_line (f, '[[Image:' || v_imagename || '|center' || ']]');
      UTL_FILE.put_line (f, ' ');
   -- End Image
   END LOOP;                                                 --  FOR Pr IN Pro

   IF v_flag_opentable
   THEN
      -- Table for Fields is Open -> Close Table
      UTL_FILE.put_line (f, '|}');
      v_flag_opentable := FALSE;
   END IF;

   UTL_FILE.put_line (f, ' ');
   UTL_FILE.fclose (f);
END;
