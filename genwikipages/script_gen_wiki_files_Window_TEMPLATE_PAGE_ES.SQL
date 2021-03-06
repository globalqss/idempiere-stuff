/*
 # ADempiere contribution
 # Author: Alejandro Falcone - openbiz 
 # 
 # Script to get the info from Application Dictionary to fill the wiki pages 
 # The script basically obtain the following information:
 #  . Window Name
 #  . Tabs Names
 #  . Fields Names
 # With the helps for those items.
 #  . And some Technical information as Table Name, Column Name, DB Type, Adempiere Type
 #
 # With this information create a file with the Window name (in english), the language sufix and .wiki 
 # extension to upload into the Adempiere wiki (i.e. ManPageW_SalesRepInfo_es.wiki for Spanish language or 
 # ManPageW_SalesRepInfo_ru.wiki for russian language). For en_US language the name don't have sufix (i.e.
 #  ManPageW_SalesRepInfo.wiki)
*/


DECLARE
/* REPLACE THIS VALUE WITH YOU NEED
 # The Window ID number. If you fill with 0 (zero)
 # the script will generate all files for all windows */
   v_window_id             NUMBER             := 0;
/* REPLACE THIS VALUE WITH YOU NEED
 # (i.e. en_US, de_DE, ru_RU, etc) */
   v_language              VARCHAR (10)       := 'es_MX';
/* REPLACE THIS VALUE WITH YOU NEED
 # Change the following values with the translation for your language!
 # Those are the Titles
*/
   v_str_return            VARCHAR (100)      := 'Volver al Indice';
   v_str_typew             VARCHAR (40)       := 'Ventana';
   v_str_typet             VARCHAR (40)       := 'Pesta�a';
   v_str_typef             VARCHAR (40)       := 'Campos';
   v_str_help_title        VARCHAR (40)       := 'Ayuda ';
   v_str_type_title        VARCHAR (40)       := 'Tipo ';
   v_str_desc_title        VARCHAR (40)       := 'Descripci�n ';
   v_str_name_title        VARCHAR (40)       := 'Nombre ';
   v_str_technical_title   VARCHAR (40)       := 'Datos T�cnicos';
   v_str_tablename_title   VARCHAR (40)       := 'Nombre Tabla: ';
   v_no_modify1            VARCHAR (100)
      := 'Nota al Editor: NO MODIFIQUE ESTE CODIGO.ESTE ARCHIVO SE GENERA MEDIANTE UN SCRIPT.';
   v_no_modify2            VARCHAR (100)
      := 'POR FAVOR, AGREGUE SUS CONTRIBUCIONES EN LA SECCION CONTRIBUCIONES';
   v_BetaFunctionality     VARCHAR (40)       := '= FUNCIONALIDAD BETA =';

/* END REPLACE THIS VALUE WITH YOU NEED */
   v_str_man_index         VARCHAR (200);
   str_end                 VARCHAR (5);
   f                       UTL_FILE.file_type;
   f_main                  UTL_FILE.file_type;
   v_file_olh              VARCHAR (80)       := ' ';
   v_wname                 VARCHAR (80);
   v_tname                 VARCHAR (80);
   v_imagename             VARCHAR (100);
   v_bold                  VARCHAR (3)        := '''''''';   -- For Bold Text
   v_ital                  VARCHAR (2)        := '''''';   -- For Italic Text
   v_flag_opentable        BOOLEAN;

   CURSOR c1
   IS
      SELECT   ad_language, ad_window_id, ad_tab_id, ad_field_id, TYPE, NAME,
               description, HELP, seqtab, seqfld, dbtable, dbcolumn, dbtype,
               adempieretype, ISBETAFUNCTIONALITY
          FROM rv_query_for_manual
         WHERE (ad_window_id = v_window_id OR v_window_id = 0)
           AND ad_language = v_language
      ORDER BY 1, 2, 9, 10;
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
      IF r.TYPE = 'W'
      THEN
         -- Window Type
         SELECT NAME
           INTO v_wname
           FROM ad_window
          WHERE ad_window_id = r.ad_window_id;    -- Get Window Name (English)

         IF SQL%ROWCOUNT = 0
         THEN
            v_wname := r.NAME;
         END IF;

         IF v_flag_opentable
         THEN
            -- New Window and Table for Fields is Open -> Close Table
            UTL_FILE.put_line (f, '|}');
            v_flag_opentable := FALSE;
         END IF;

         IF v_file_olh <> ' '
         THEN
            -- Close previous file
            UTL_FILE.put_line (f, ' ');
            UTL_FILE.fclose (f);
         END IF;

         -- fill the Name Page
         v_file_olh :=
               TRIM ('ManPageW_' || TRANSLATE (v_wname, '_&, /', '_'))
            || '_olh'
            || str_end
            || '.wiki';
         f := UTL_FILE.fopen ('DIR_TEMP', v_file_olh, 'w');
--         UTL_FILE.put_line (f, v_str_man_index);
         UTL_FILE.put_line (f, ' ');
         -- NO Modify Message to Editor
         UTL_FILE.put_line (f, '<!-- ' || v_no_modify1 || ' -->');
         UTL_FILE.put_line (f, '<!-- ' || v_no_modify2 || ' -->');
         UTL_FILE.put_line (f, ' ');
         -- End No Modify Message
         UTL_FILE.put_line (f, '==' || v_str_typew || ': ' || r.NAME || '==');
          /*      UTL_FILE.put_line (f,
                     'Window ID= '
                     || v_bold
                     || r.ad_window_id
                     || v_bold );
         */
         UTL_FILE.put_line (f, ' ');

	 IF r.ISBETAFUNCTIONALITY = 'Y'
 	 THEN
	    -- Msg. Beta Functionality (Red & Bold - centered)
	    UTL_FILE.put_line (f, '<center><font color="#FF0000">' 
	          	          || v_bold
				  || v_BetaFunctionality
				  || v_bold
				  || '</font></center>'
				);
	    UTL_FILE.put_line (f, ' ');
          END IF; -- IF r.ISBETAFUNCTIONALITY = 'Y'

 
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

      IF r.TYPE = 'T'
      THEN
         -- Tab Type
         SELECT NAME
           INTO v_tname
           FROM ad_tab
          WHERE ad_tab_id = r.ad_tab_id;             -- Get Tab Name (English)

         IF v_flag_opentable
         THEN
            -- New Tab and Table for Fields is Open -> Close Table
            UTL_FILE.put_line (f, '|}');
            v_flag_opentable := FALSE;
         END IF;

         -- NO Modify Message to Editor
         UTL_FILE.put_line (f, '<!-- ' || v_no_modify1 || ' -->');
         UTL_FILE.put_line (f, '<!-- ' || v_no_modify2 || ' -->');
         UTL_FILE.put_line (f, ' ');
         -- End No Modify Message
         UTL_FILE.put_line (f, '----');
         UTL_FILE.put_line (f,
                            '===' || v_str_typet || ': ' || r.NAME || '===');
         /*      UTL_FILE.put_line (f,
                    'Tab ID= '
                    || v_bold
                    || r.ad_tab_id
                    || v_bold );
           */
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
         UTL_FILE.put_line (f,
                               '<small>'
                            || v_str_tablename_title
                            || r.dbtable
                            || '</small>'
                           );
         UTL_FILE.put_line (f, ' ');
         -- For Image
         v_imagename :=
               'ManPageW_'
            || TRIM (TRANSLATE (v_wname, '_&, /', '_'))
            || '_'
            || TRIM (TRANSLATE (v_tname, '_&, /', '_'))
            || str_end
            || '.png';
         UTL_FILE.put_line (f, '[[Image:' || v_imagename || '|center' || ']]');
         UTL_FILE.put_line (f, ' ');
         -- End Image
         -- Open Table for Fields
         UTL_FILE.put_line (f, v_bold || v_str_typef || v_bold);
         UTL_FILE.put_line (f, ' ');
         UTL_FILE.put_line
             (f,
              '{|{| border="1" cellpadding="5" cellspacing="0" align="center"'
             );
         UTL_FILE.put_line (f,
                               '!style="background:#efefef;" width="100"|'
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
                               '!style="background:#efefef;" width="80"|'
                            || '<small>'
                            || v_str_technical_title
                            || '</small>'
                           );
         v_flag_opentable := TRUE; -- Flag activated to indicate Table is Open
      -- End Table for Fields
      END IF;

      IF r.TYPE = 'F'
      THEN
         -- Field Type
         UTL_FILE.put_line (f, '|-');
         UTL_FILE.put_line (f, '|-valign="top"');
         UTL_FILE.put_line (f,
                            '|' || v_ital || v_bold || r.NAME || v_bold
                            || v_ital
                           );
         UTL_FILE.put_line (f, '||' || r.description);
         UTL_FILE.put_line (f, '||' || r.HELP);
         UTL_FILE.put_line (f, '|| ' || '<small>' || r.dbcolumn);
         UTL_FILE.put_line (f, ' ');
         UTL_FILE.put_line (f, r.dbtype);
         UTL_FILE.put_line (f, ' ');
         UTL_FILE.put_line (f, r.adempieretype || '</small>');
         UTL_FILE.put_line (f, '|-valign="top"');
      END IF;
   END LOOP;

   IF v_flag_opentable
   THEN
      -- Table for Fields is Open -> Close Table
      UTL_FILE.put_line (f, '|}');
      v_flag_opentable := FALSE;
   END IF;

   UTL_FILE.put_line (f, ' ');
   UTL_FILE.fclose (f);
END;
