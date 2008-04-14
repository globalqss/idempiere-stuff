/*
 # ADempiere contribution
 # Author: Alejandro Falcone - openbiz 
 # 
 # Script to get the info from Application Dictionary to fill the wiki pages 
 # The script basically obtain the following information:
 #  . Workflow Name
 #
 # With this information create a file with the Workflow name (in english), the language sufix and .wiki 
 # extension to upload into the Adempiere wiki (i.e. ManPageF_InitialClientSetupReview_es.wiki for Spanish 
 # language or ManPageF_InitialClientSetupReview_ru.wiki for russian language). For en_US language the name 
 # don't have sufix (i.e.ManPageF_InitialClientSetupReview.wiki)
*/


DECLARE
/* REPLACE THIS VALUE WITH YOU NEED
 # The Workflow ID number. If you fill with 0 (zero)
 # the script will generate all files for all workflows */
   v_workflow_id              NUMBER             := 0;
/* REPLACE THIS VALUE WITH YOU NEED
 # (i.e. en_US, de_DE, ru_RU, etc) */
   v_language                 VARCHAR (10)       := 'es_MX';
/* REPLACE THIS VALUE WITH YOU NEED
 # Change the following values with the translation for your language!
 # Those are the Titles
*/
   v_str_text_main            VARCHAR (500)
      :=    '¡Disfrútalo y ayuda a completarlo!'
         || '  Pero por favor, siempre respetando los derechos de autor.';
   v_str_text_main2           VARCHAR (500)
                   := 'Por favor, escriba sus contribuciones bajo la Sección ';
   -- will be concatenated with v_str_text_section
   v_str_text_section         VARCHAR (20)       := '';
   v_str_contribution_title   VARCHAR (80)       := 'Contribuciones';
   v_str_onlinehelp_title     VARCHAR (80)       := 'Ayuda en Linea';
   v_str_return               VARCHAR (100)      := 'Retornar al Indice';
/* END REPLACE THIS VALUE WITH YOU NEED */
   v_str_man_index            VARCHAR (200);
   str_end                    VARCHAR (5);
   f                          UTL_FILE.FILE_TYPE;
   v_file                     VARCHAR (80)       := ' ';
   v_wname                    VARCHAR (80);
   v_bold                     VARCHAR (3)        := ''''''''; -- For Bold Text
   v_ital                     VARCHAR (2)        := ''''''; -- For Italic Text

   CURSOR workflow
   IS
      SELECT   m.ad_menu_id, m.NAME, m.description, m.ad_workflow_id
          FROM AD_MENU m
         WHERE (m.ad_workflow_id = v_workflow_id OR v_workflow_id = 0)
           AND m.ad_menu_id < 1000000
           AND m.action = 'F'
           AND m.isactive = 'Y'
      ORDER BY m.ad_workflow_id;
BEGIN
   IF LOWER (SUBSTR (v_language, 1, 2)) <> 'en'
   THEN
      str_end := '_' || LOWER (SUBSTR (v_language, 1, 2));
   ELSE
      str_end := '';
   END IF;

   v_str_man_index :=
                    '[[Manual' || str_end || '|' || TRIM (v_str_return)
                    || ']]';

   FOR w IN workflow
   LOOP
      SELECT NAME
        INTO v_wname
        FROM AD_WORKFLOW
       WHERE ad_workflow_id = w.ad_workflow_id; -- Get Workflow Name (English)

      IF SQL%ROWCOUNT = 0
      THEN
         v_wname := w.NAME;
      END IF;

      IF v_file <> ' '
      THEN
         -- Close previous file
         UTL_FILE.FCLOSE (f);
      END IF;

      -- fill the Name Page
      v_file :=
            TRIM ('ManPageF_' || TRANSLATE (v_wname, '_&, /', '_'))
         || str_end
         || '.wiki';
      f := UTL_FILE.FOPEN ('DIR_TEMP', v_file, 'w');
      UTL_FILE.PUT_LINE (f, v_str_man_index);               -- Return To Index
      UTL_FILE.PUT_LINE (f, ' ');
      UTL_FILE.PUT_LINE (f, v_str_text_main);
      UTL_FILE.PUT_LINE (f, ' ');
      UTL_FILE.PUT_LINE (f,
                            v_str_text_main2
                         || '[[#'
                         || v_str_contribution_title
                         || '|'
                         || v_str_contribution_title
                         || ']] '
                         || v_str_text_section
                        );
      UTL_FILE.PUT_LINE (f, ' ');
      -- Insert Template to OnLineHelp
      UTL_FILE.PUT_LINE (f,
                         '<!-- Nota a editores: NO MODIFICAR ESTE CODIGO -->'
                        );
      UTL_FILE.PUT_LINE (f,
                            '{{:'
                         || TRIM (   'ManPageF_'
                                  || TRANSLATE (v_wname, '_&, /', '_')
                                 )
                         || '_olh'
                         || str_end
                         || '}}'
                        );
      UTL_FILE.PUT_LINE
                     (f,
                      '<!-- FIN Nota a editores: NO MODIFICAR ESTE CODIGO -->'
                     );
      --
      -- Insert Contributions Section
      UTL_FILE.PUT_LINE (f, '=' || v_str_contribution_title || '=');
      UTL_FILE.PUT_LINE (f, ' ');
      UTL_FILE.PUT_LINE (f,
                            '[[Category:Manual_es|'
                         || SUBSTR (v_file, 8, 1)
                         || ' '
                         || SUBSTR (v_file, 10, 1)
                         || ']]'
                        );
      --
      UTL_FILE.FCLOSE (f);
   END LOOP;                                             --  FOR w IN Workflow
END;
