/*
 # ADempiere contribution
 # Author: Alejandro Falcone - openbiz 
 # 
 # Script to get the info from Application Dictionary to fill the wiki pages 
 # The script basically obtain the following information:
 #  . Form Name
 # With the helps for those items.
 #  . And some Technical information 
 #
 # With this information create a file with the Form name (in english), the language sufix and .wiki 
 # extension to upload into the Adempiere wiki (i.e. ManPageX_TreeMaintenance_olh_es.wiki  for 
 # Spanish language or ManPageX_TreeMaintenance_olh_ru.wiki for russian language). For en_US 
 # language the name don't have sufix (i.e.ManPageX_TreeMaintenance_olh.wiki)
*/


DECLARE
/* REPLACE THIS VALUE WITH YOU NEED
 # The Form ID number. If you fill with 0 (zero)
 # the script will generate all files for all forms */
   v_form_id              NUMBER             := 0;
/* REPLACE THIS VALUE WITH YOU NEED
 # (i.e. en_US, de_DE, ru_RU, etc) */
   v_language               VARCHAR (10)        := 'es_MX';
/* REPLACE THIS VALUE WITH YOU NEED
 # Change the following values with the translation for your language!
 # Those are the Titles
*/

   v_str_return             VARCHAR (100)      := 'Retornar al Indice';
   v_str_typep              VARCHAR (40)       := 'Form';
   v_str_help_title         VARCHAR (40)       := 'Ayuda ';
   v_str_desc_title         VARCHAR (40)       := 'Descripción ';
   v_str_name_title         VARCHAR (40)       := 'Nombre ';
   v_str_classname_title    VARCHAR (40)       := 'Nombre Clase: ';
/* END REPLACE THIS VALUE WITH YOU NEED */

   v_str_man_index          VARCHAR (200);
   str_end                  VARCHAR (5);
   f                        UTL_FILE.file_type;
   v_file_olh               VARCHAR (80)       := ' ';
   v_fname                  VARCHAR (80);
   v_imageName              VARCHAR (100);
   v_bold                   VARCHAR (3)        := '''''''';  -- For Bold Text
   v_ital                   VARCHAR (2)        := '''''';  -- For Italic Text

   CURSOR Form -- FORM
   IS
      SELECT    mtrl.AD_LANGUAGE,
		m.AD_MENU_ID, 
		m.AD_FORM_ID,
		mtrl.NAME, 
		mtrl.DESCRIPTION ,       
		ftrl.help,
		f.classname
	   FROM AD_MENU m, AD_MENU_TRL mtrl, AD_FORM_TRL ftrl, AD_FORM f
	  WHERE (m.AD_FORM_ID = v_form_id OR v_form_id = 0)
            AND mtrl.AD_LANGUAGE = v_language
            AND m.entitytype = 'D'
	    AND m.action = 'X' 
	    AND m.isactive='Y'
            AND m.AD_MENU_ID = mtrl.AD_MENU_ID
	    AND m.AD_FORM_ID = ftrl.AD_FORM_ID
            AND m.AD_FORM_ID = f.AD_FORM_ID
  ORDER BY ad_process_id;



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

   FOR Pr IN Form
   LOOP
       SELECT NAME
         INTO v_fname
         FROM ad_form
        WHERE ad_form_id = Pr.ad_form_id;    -- Get Form Name (English)

       IF SQL%ROWCOUNT = 0
       THEN
         v_fname := Pr.NAME;
       END IF;

       IF v_file_olh <> ' '
       THEN
          -- Close previous file
          UTL_FILE.fclose (f);
       END IF;

       -- fill the Name Page
       v_file_olh :=
            TRIM ('ManPageX_' || TRANSLATE (v_fname, '_&, /', '_'))
            || '_olh'
            || str_end
            || '.wiki';


       f := UTL_FILE.fopen ('DIR_TEMP', v_file_olh, 'w');
       UTL_FILE.put_line (f, ' ');
         
       UTL_FILE.put_line (f, 
	                     '==' 
                             || v_str_typep
                             || ': ' 
			     || Pr.NAME 
			     || '==' );
 
       UTL_FILE.put_line (f, ' ');
       UTL_FILE.put_line (f, 
	                      v_bold
                              || v_str_desc_title
                              || ': '
			      || v_bold
			      || Pr.DESCRIPTION);
       UTL_FILE.put_line (f, ' ');
       UTL_FILE.put_line (f,
                              v_bold
			      || v_str_help_title 
                              || ': '
			      || v_bold 
			      ||' ' 
			      || Pr.HELP);

       UTL_FILE.put_line (f, ' ');
       
       -- TECHNICAL DATA
       IF Pr.classname IS NOT NULL 
       THEN
          UTL_FILE.put_line (f,'<small>'
                               || v_str_classname_title 
                               || Pr.classname
                               || ' ' 
                               || '</small>'
                               );
       END IF;
       -- END TECHNICAL DATA
       -- For Image
       v_imageName :=  'ManPageX_' 
                         || TRIM(REPLACE (v_fname, ' ', ''))
                         || '_'
                         || TRIM(REPLACE (Pr.NAME ,' ',''))
                         || str_end
                         || '.gif';
         
       UTL_FILE.put_line (f,'[[Image:'
                              || v_imageName
                              || '|center'
                              || ']]'
                            );
       -- End Image

   END LOOP;  --  FOR Pr IN Pro
   
   UTL_FILE.fclose (f);
END;
