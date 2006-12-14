/*
 # ADempiere contribution
 # Author: Alejandro Falcone - openbiz 
 # 
 # Script to get the info from Application Dictionary to fill the wiki pages 
 # The script basically obtain the following information:
 #  . Process Name
 #  . Parameters Names
 # With the helps for those items.
 #  . And some Technical information 
 #
 # With this information create a file with the Window name (in english), the language sufix and .wiki 
 # extension to upload into the Adempiere wiki (i.e. ManPageP_ResetPassword_olh_es.wiki for Spanish language or 
 # ManPageP_ResetPassword_olh_ru.wiki for russian language). For en_US language the name don't have sufix (i.e.
 #  ManPageP_ResetPassword_olh.wiki)
*/


DECLARE
/* REPLACE THIS VALUE WITH YOU NEED
 # The Process ID number. If you fill with 0 (zero)
 # the script will generate all files for all windows */
   v_process_id               NUMBER             := 0;
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
   f                          UTL_FILE.file_type;
   v_file                     VARCHAR (80)       := ' ';
   v_pname                    VARCHAR (80);
   v_bold                     VARCHAR (3)        := ''''''''; -- For Bold Text
   v_ital                     VARCHAR (2)        := ''''''; -- For Italic Text
   v_flag_opentable           BOOLEAN;
   v_ad_process_id            NUMBER;

   CURSOR pro                                                      -- PROCESOS
   IS
      SELECT   'es_US_base', 'P' AS TYPE, m.ad_menu_id, m.ad_process_id,
               m.NAME, m.description, p.HELP, rv.NAME AS repviewname,
               p.procedurename, p.classname, p.VALUE AS searchkey
          FROM ad_menu m, ad_process p, ad_reportview rv
         WHERE (m.ad_process_id = v_process_id OR v_process_id = 0)
           AND m.entitytype = 'D'
           AND m.action = 'P'
           AND m.isactive = 'Y'
           AND m.ad_process_id = p.ad_process_id
           AND p.ad_reportview_id = rv.ad_reportview_id(+)
      ORDER BY ad_process_id;
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

   FOR pr IN pro
   LOOP
      -- Process Type
      SELECT NAME
        INTO v_pname
        FROM ad_process
       WHERE ad_process_id = pr.ad_process_id;    -- Get Window Name (English)

      IF SQL%ROWCOUNT = 0
      THEN
         v_pname := pr.NAME;
      END IF;

      IF v_file <> ' '
      THEN
         -- Close previous file
         UTL_FILE.fclose (f);
      END IF;

      -- fill the Name Page
      v_file :=
            TRIM ('ManPageP_' || TRANSLATE (v_pname, '_&, /', '_'))
         || str_end
         || '.wiki';
      f := UTL_FILE.fopen ('DIR_TEMP', v_file, 'w');
      UTL_FILE.put_line (f, v_str_man_index);               -- Return To Index
      UTL_FILE.put_line (f, ' ');
      UTL_FILE.put_line (f, v_str_text_main);
      UTL_FILE.put_line (f, ' ');
      UTL_FILE.put_line (f,
                            v_str_text_main2
                         || '[[#'
                         || v_str_contribution_title
                         || '|'
                         || v_str_contribution_title
                         || ']] '
                         || v_str_text_section
                        );
      UTL_FILE.put_line (f, ' ');
      -- Insert Template to OnLineHelp
      UTL_FILE.put_line (f,
                         '<!-- Nota a editores: NO MODIFICAR ESTE CODIGO -->'
                        );
      UTL_FILE.put_line (f,
                            '{{:'
                         || TRIM (   'ManPageP_'
                                  || TRANSLATE (v_pname, '_&, /', '_')
                                 )
                         || '_olh'
                         || str_end
                         || '}}'
                        );
      UTL_FILE.put_line
                     (f,
                      '<!-- FIN Nota a editores: NO MODIFICAR ESTE CODIGO -->'
                     );
      --
      -- Insert Contributions Section
      UTL_FILE.put_line (f, '=' || v_str_contribution_title || '=');
      UTL_FILE.put_line (f, ' ');
      UTL_FILE.put_line (f,
                            '[[Category:Manual_es|'
                         || SUBSTR (v_file, 8, 1)
                         || ' '
                         || SUBSTR (v_file, 10, 1)
                         || ']]'
                        );
      --
      UTL_FILE.fclose (f);
   END LOOP;                                                 --  FOR Pr IN Pro
END;
