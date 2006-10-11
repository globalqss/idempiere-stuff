/*
 # ADempiere contribution
 # Author: Alejandro Falcone - openbiz 
 # 
 # Script to get the info from Application Dictionary to fill the wiki pages 
 # The script generate the main page and fill the Template for On Line Help
 #
 # Create a file with the Window name (in english), the language sufix and .wiki 
 # extension to upload into the Adempiere wiki (i.e. ManPageW_SalesRepInfo_es.wiki for Spanish language or 
 # ManPageW_SalesRepInfo_ru.wiki for russian language). For en_US language the name don't have sufix (i.e.
 #  ManPageW_SalesRepInfo.wiki)
*/


DECLARE
/* REPLACE THIS VALUE WITH YOU NEED
 # The Window ID number. If you fill with 0 (zero)
 # the script will generate all files for all windows */
   v_window_id              NUMBER             := 0;
/* REPLACE THIS VALUE WITH YOU NEED
 # (i.e. en_US, de_DE, ru_RU, etc) */
   v_language               VARCHAR (10)        := 'en_US_base';
/* REPLACE THIS VALUE WITH YOU NEED
 # Change the following values with the translation for your language!
 # Those are the Titles
*/
  v_str_Text_Main          VARCHAR (500)      := 'Enjoy it, and help to fill it! 
But please, always respecting copyright.';
  v_str_Text_Main2           VARCHAR(500)      := 'Please write your contributions 
under the ';    -- will be concatenated with v_str_text_section
  v_str_text_Section         VARCHAR(20)       := 'Section';
  v_str_contribution_title VARCHAR (80)        := 'Contributions';
  v_str_OnLineHelp_Title   VARCHAR (80)        := 'On Line Help';
                                                    
   v_str_return             VARCHAR (100)      := 'Return to Index';
/* END REPLACE THIS VALUE WITH YOU NEED */

   v_str_man_index          VARCHAR (200);
   str_end                  VARCHAR (5);
   f_main                   UTL_FILE.file_type;
   v_file                   VARCHAR (80)       := ' ';
   v_wname                  VARCHAR (80);
   v_bold                   VARCHAR (3)        := '''''''';  -- For Bold Text
   v_ital                   VARCHAR (2)        := '''''';  -- For Italic Text

   CURSOR c1
   IS
      SELECT   ad_language, ad_window_id, ad_tab_id, ad_field_id, TYPE, NAME,
               description, HELP, seqtab, seqfld, dbtable, dbcolumn, dbtype,
               adempieretype
          FROM rv_query_for_manual
         WHERE (ad_window_id = v_window_id OR v_window_id = 0)
	   AND TYPE = 'W'
           AND ad_language = v_language
      ORDER BY 1, 2, 9, 10;
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

   FOR r IN c1
   LOOP
       SELECT NAME
       INTO v_wname
       FROM ad_window
       WHERE ad_window_id = r.ad_window_id;    -- Get Window Name (English)

        IF SQL%ROWCOUNT = 0
        THEN
          v_wname := r.NAME;
        END IF;

        -- fill the Name Page
        v_file :=
              TRIM ('ManPageW_' || REPLACE (v_wname, ' ', ''))
           || str_end
           || '.wiki';
            
        -- Generate Main Page
        f_main := UTL_FILE.fopen ('DIR_TEMP', v_file, 'w');

        UTL_FILE.put_line (f_main, v_str_man_index);  -- Return To Index
        UTL_FILE.put_line (f_main, ' ');
      
        UTL_FILE.put_line (f_main, v_str_Text_Main);
        UTL_FILE.put_line (f_main, ' ');
     
     
        UTL_FILE.put_line (f_main, 
                                   v_str_Text_Main2
                                   || '[[#'
                                   || v_str_contribution_title
                                   || '|' 
                                   || v_str_contribution_title
                                   || ']] ' 
                                   || v_str_text_Section
                                   );
                                   
        UTL_FILE.put_line (f_main, ' ');   
               
        -- Insert Template to OnLineHelp
        UTL_FILE.put_line (f_main,'<!-- Note to editors: NOT MODIFY THIS CODE -->');
        UTL_FILE.put_line (f_main, 
                             '{{:' 
                             || TRIM ('ManPageW_' || REPLACE (v_wname, ' ', ''))
                             || '_olh'
                             || str_end
                             ||'}}'
                             );
        UTL_FILE.put_line (f_main,'<!-- END Note to editors: NOT MODIFY THIS CODE -->');
        --
        
        -- Insert Contributions Section
        UTL_FILE.put_line (f_main, 
                                  '='
                                  ||v_str_contribution_title
                                  || '=');
                                  
        UTL_FILE.put_line (f_main, ' ');
        -- 
        UTL_FILE.fclose (f_main);
   END LOOP;
  
END;
