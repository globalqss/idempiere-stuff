/*
 # ADempiere contribution
 # Author: Alejandro Falcone - openbiz 
 # 
 # Script to get the info from Application Dictionary to fill the wiki pages 
 # The script basically obtain the following information:
 #  . Form Name
 #
 # With this information create a file with the Window name (in english), the language sufix and .wiki 
 # extension to upload into the Adempiere wiki (i.e. ManPageX_TreeMaintenance_es.wiki for Spanish 
 # language or ManPageX_TreeMaintenance_ru.wiki for russian language). For en_US language the name 
 # don't have sufix (i.e.ManPageX_TreeMaintenance.wiki )
*/


DECLARE
/* REPLACE THIS VALUE WITH YOU NEED
 # The Form ID number. If you fill with 0 (zero)
 # the script will generate all files for all formss */
   v_form_id                  NUMBER             := 0;
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
under the ';                   -- will be concatenated with v_str_text_section
   v_str_text_section         VARCHAR (20)       := 'Section';
   v_str_contribution_title   VARCHAR (80)       := 'Contributions';
   v_str_onlinehelp_title     VARCHAR (80)       := 'On Line Help';
   v_str_return               VARCHAR (100)      := 'Return to Index';
/* END REPLACE THIS VALUE WITH YOU NEED */
   v_str_man_index            VARCHAR (200);
   str_end                    VARCHAR (5);
   f                          UTL_FILE.file_type;
   v_file                     VARCHAR (80)       := ' ';
   v_fname                    VARCHAR (80);
   v_bold                     VARCHAR (3)        := ''''''''; -- For Bold Text
   v_ital                     VARCHAR (2)        := ''''''; -- For Italic Text

   CURSOR form                                                         -- FORM
   IS
      SELECT   m.ad_menu_id, m.ad_form_id, m.NAME
          FROM ad_menu m
         WHERE (m.ad_form_id = v_form_id OR v_form_id = 0)
           AND m.entitytype = 'D'
           AND m.action = 'X'
           AND m.isactive = 'Y'
      ORDER BY ad_form_id;
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

   FOR pr IN form
   LOOP
      SELECT NAME
        INTO v_fname
        FROM ad_form
       WHERE ad_form_id = pr.ad_form_id;            -- Get Form Name (English)

      IF SQL%ROWCOUNT = 0
      THEN
         v_fname := pr.NAME;
      END IF;

      IF v_file <> ' '
      THEN
         -- Close previous file
         UTL_FILE.fclose (f);
      END IF;

      -- fill the Name Page
      v_file :=
            TRIM ('ManPageX_' || TRANSLATE (v_fname, '_&, /', '_'))
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
      UTL_FILE.put_line (f, '<!-- Note to editors: NOT MODIFY THIS CODE -->');
      UTL_FILE.put_line (f,
                            '{{:'
                         || TRIM (   'ManPageX_'
                                  || TRANSLATE (v_fname, '_&, /', '_')
                                 )
                         || '_olh'
                         || str_end
                         || '}}'
                        );
      UTL_FILE.put_line (f,
                         '<!-- END Note to editors: NOT MODIFY THIS CODE -->'
                        );
      --
      -- Insert Contributions Section
      UTL_FILE.put_line (f, '=' || v_str_contribution_title || '=');
      UTL_FILE.put_line (f, ' ');
      UTL_FILE.put_line (f,
                            '[[Category:Manual|'
                         || SUBSTR (v_file, 8, 1)
                         || ' '
                         || SUBSTR (v_file, 10, 1)
                         || ']]'
                        );
      --
      UTL_FILE.fclose (f);
   END LOOP;                                                --  FOR Pr IN Form
END;
