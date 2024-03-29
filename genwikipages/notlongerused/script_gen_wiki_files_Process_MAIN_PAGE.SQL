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
   v_language                 VARCHAR (10)       := 'en_US_base';
/* REPLACE THIS VALUE WITH YOU NEED
 # Change the following values with the translation for your language!
 # Those are the Titles
*/
   v_str_text_main            VARCHAR (500)
      :=    'Enjoy it, and help to fill it!'
         || ' But please, always respecting copyright.';
   v_str_text_main2           VARCHAR (500)
                             := 'Please write your contributions 
UNDER THE ';                   -- will be concatenated with v_str_text_section
   v_str_text_section         VARCHAR (20)       := 'Section';
   v_str_contribution_title   VARCHAR (80)       := 'Contributions';
   v_str_onlinehelp_title     VARCHAR (80)       := 'On Line Help';
   v_str_return               VARCHAR (100)      := 'Return to Index';
/* END REPLACE THIS VALUE WITH YOU NEED */
   v_str_man_index            VARCHAR (200);
   str_end                    VARCHAR (5);
   f                          UTL_FILE.FILE_TYPE;
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
          FROM AD_MENU m, AD_PROCESS p, AD_REPORTVIEW rv
         WHERE (m.ad_process_id = v_process_id OR v_process_id = 0)
           AND m.ad_menu_id < 1000000
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
        FROM AD_PROCESS
       WHERE ad_process_id = pr.ad_process_id;    -- Get Window Name (English)

      IF SQL%ROWCOUNT = 0
      THEN
         v_pname := pr.NAME;
      END IF;

      IF v_file <> ' '
      THEN
         -- Close previous file
         UTL_FILE.FCLOSE (f);
      END IF;

      -- fill the Name Page
      v_file :=
            TRIM ('ManPageP_' || TRANSLATE (v_pname, '_&, /', '_'))
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
      UTL_FILE.PUT_LINE (f, '<!-- Note to editors: NOT MODIFY THIS CODE -->');
      UTL_FILE.PUT_LINE (f,
                            '{{:'
                         || TRIM (   'ManPageP_'
                                  || TRANSLATE (v_pname, '_&, /', '_')
                                 )
                         || '_olh'
                         || str_end
                         || '}}'
                        );
      UTL_FILE.PUT_LINE (f,
                         '<!-- END Note to editors: NOT MODIFY THIS CODE -->'
                        );
      --
      -- Insert Contributions Section
      UTL_FILE.PUT_LINE (f, '=' || v_str_contribution_title || '=');
      UTL_FILE.PUT_LINE (f, ' ');
      UTL_FILE.PUT_LINE (f,
                            '[[Category:Manual|'
                         || SUBSTR (v_file, 8, 1)
                         || ' '
                         || SUBSTR (v_file, 10, 1)
                         || ']]'
                        );
      --
      UTL_FILE.FCLOSE (f);
   END LOOP;                                                 --  FOR Pr IN Pro
END;
