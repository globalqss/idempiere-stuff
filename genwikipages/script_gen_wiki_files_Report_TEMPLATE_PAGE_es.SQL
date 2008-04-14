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
 # With this information create a file with the Report name (in english), the language sufix and .wiki 
 # extension to upload into the Adempiere wiki (i.e. ManPageR_InvoiceTransactions(Acct)_olh_es.wiki for 
 # Spanish language or ManPageR_InvoiceTransactions(Acct)_olh_ru.wiki for russian language). For en_US 
 # language the name don't have sufix (i.e.ManPageR_InvoiceTransactions(Acct)_olh.wiki)
*/


DECLARE
/* REPLACE THIS VALUE WITH YOU NEED
 # The Process ID number. If you fill with 0 (zero)
 # the script will generate all files for all reports */
   v_process_id             NUMBER             := 0;
/* REPLACE THIS VALUE WITH YOU NEED
 # (i.e. en_US, de_DE, ru_RU, etc) */
   v_language               VARCHAR (10)       := 'es_MX';
/* REPLACE THIS VALUE WITH YOU NEED
 # Change the following values with the translation for your language!
 # Those are the Titles
*/
   v_str_return             VARCHAR (100)      := 'Retornar al Indice';
   v_str_typep              VARCHAR (40)       := 'Reporte';
   v_str_help_title         VARCHAR (40)       := 'Ayuda ';
   v_str_type_title         VARCHAR (40)       := 'Tipo ';
   v_str_desc_title         VARCHAR (40)       := 'Descripción ';
   v_str_name_title         VARCHAR (40)       := 'Nombre ';
   v_str_parameters_title   VARCHAR (40)       := 'Parámetros';
   v_str_technical_title    VARCHAR (40)       := 'Datos Técnicos';
   v_str_procedname_title   VARCHAR (40)       := 'Nombre Procedimiento: ';
   v_str_classname_title    VARCHAR (40)       := 'Nombre Clase: ';
   v_str_repvname_title     VARCHAR (40)       := 'Nombre Vista Reporte: ';
   v_str_range_title        VARCHAR (40)       := 'Es Rango: ';
   v_no_modify1             VARCHAR (100)
      := 'Nota al Editor: NO MODIFIQUE ESTE CODIGO.ESTE ARCHIVO SE GENERA MEDIANTE UN SCRIPT.';
   v_no_modify2             VARCHAR (100)
      := 'POR FAVOR, AGREGUE SUS CONTRIBUCIONES EN LA SECCION CONTRIBUCIONES';
/* END REPLACE THIS VALUE WITH YOU NEED */
   v_str_man_index          VARCHAR (200);
   str_end                  VARCHAR (5);
   f                        UTL_FILE.FILE_TYPE;
   v_file_olh               VARCHAR (80)       := ' ';
   v_pname                  VARCHAR (80);
   v_imagename              VARCHAR (100);
   v_bold                   VARCHAR (3)        := '''''''';  -- For Bold Text
   v_ital                   VARCHAR (2)        := '''''';  -- For Italic Text
   v_flag_opentable         BOOLEAN;
   v_ad_process_id          NUMBER;

   CURSOR pro                                                     -- PROCESOS
   IS
      SELECT   mtrl.AD_LANGUAGE, 'R' AS TYPE, m.ad_menu_id, m.ad_process_id,
               mtrl.NAME, mtrl.description, ptrl.HELP,
               rv.NAME AS repviewname, p.procedurename, p.classname,
               p.VALUE AS tech4
          FROM AD_MENU m,
               AD_PROCESS p,
               AD_REPORTVIEW rv,
               AD_MENU_TRL mtrl,
               AD_PROCESS_TRL ptrl
         WHERE (m.ad_process_id = v_process_id OR v_process_id = 0)
           AND m.ad_menu_id < 1000000
           AND m.action = 'R'
           AND m.isactive = 'Y'
           AND m.ad_process_id = p.ad_process_id
           AND m.ad_menu_id = mtrl.ad_menu_id
           AND mtrl.AD_LANGUAGE = v_language
           AND m.ad_process_id = ptrl.ad_process_id
           AND ptrl.AD_LANGUAGE = v_language
           AND p.ad_reportview_id = rv.ad_reportview_id(+)
      ORDER BY ad_process_id;

   CURSOR par                                                    -- PARAMETROS
   IS
      SELECT   trl.AD_LANGUAGE, 'D' AS TYPE, pp.ad_process_id,
               pp.ad_process_para_id, trl.NAME, trl.description, trl.HELP,
               pp.isrange, pp.defaultvalue,                        -- not used
                                           pp.defaultvalue2,       -- not used
                                                            pp.columnname,
               pp.ad_element_id,                                  --  not used
                                Dba_Displaytype (pp.ad_reference_id) dbtype
          FROM AD_PROCESS_PARA pp, AD_PROCESS_PARA_TRL trl
         WHERE pp.isactive = 'Y'
           AND pp.ad_PROCESS_PARA_id < 1000000
           AND pp.ad_process_id = v_ad_process_id
           AND pp.ad_process_para_id = trl.ad_process_para_id
           AND trl.AD_LANGUAGE = v_language
      ORDER BY seqno;
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

      IF v_flag_opentable
      THEN
         -- New Window and Table for Parameters is Open -> Close Table
         UTL_FILE.PUT_LINE (f, '|}');
         v_flag_opentable := FALSE;
      END IF;

      IF v_file_olh <> ' '
      THEN
         -- Close previous file
         UTL_FILE.PUT_LINE (f, ' ');
         UTL_FILE.FCLOSE (f);
      END IF;

      -- fill the Name Page
      v_file_olh :=
            TRIM ('ManPageR_' || TRANSLATE (v_pname, '_&, /', '_'))
         || '_olh'
         || str_end
         || '.wiki';
      f := UTL_FILE.FOPEN ('DIR_TEMP', v_file_olh, 'w');
      UTL_FILE.PUT_LINE (f, ' ');
      -- NO Modify Message to Editor
      UTL_FILE.PUT_LINE (f, '<!-- ' || v_no_modify1 || ' -->');
      UTL_FILE.PUT_LINE (f, '<!-- ' || v_no_modify2 || ' -->');
      UTL_FILE.PUT_LINE (f, ' ');
      -- End No Modify Message
      UTL_FILE.PUT_LINE (f, '==' || v_str_typep || ': ' || pr.NAME || '==');
      UTL_FILE.PUT_LINE (f, ' ');
      UTL_FILE.PUT_LINE (f,
                            v_bold
                         || v_str_desc_title
                         || ': '
                         || v_bold
                         || pr.description
                        );
      UTL_FILE.PUT_LINE (f, ' ');
      UTL_FILE.PUT_LINE (f,
                            v_bold
                         || v_str_help_title
                         || ': '
                         || v_bold
                         || ' '
                         || pr.HELP
                        );
      UTL_FILE.PUT_LINE (f, ' ');

      -- TECHNICAL DATA
      IF pr.procedurename IS NOT NULL
      THEN
         UTL_FILE.PUT_LINE (f,
                               '<small>'
                            || v_str_procedname_title
                            || pr.procedurename
                            || ' '
                            || '</small>'
                           );
      END IF;

      IF pr.classname IS NOT NULL
      THEN
         UTL_FILE.PUT_LINE (f,
                               '<small>'
                            || v_str_classname_title
                            || pr.classname
                            || ' '
                            || '</small>'
                           );
      END IF;

      IF pr.repviewname IS NOT NULL
      THEN
         UTL_FILE.PUT_LINE (f,
                               '<small>'
                            || v_str_repvname_title
                            || pr.repviewname
                            || ' '
                            || '</small>'
                           );
      END IF;

      -- END TECHNICAL DATA
      UTL_FILE.PUT_LINE (f, ' ');
      -- For Image
      v_imagename :=
            'ManPageR_'
         || TRIM(TRANSLATE (v_pname, '_&, /', '_'))
         || str_end
         || '.png';
      UTL_FILE.PUT_LINE (f, '[[Image:' || v_imagename || '|center' || ']]');
      UTL_FILE.PUT_LINE (f, ' ');
      -- End Image
      -- PARAMETERS
      v_ad_process_id := pr.ad_process_id;

      FOR pa IN par
      LOOP
         IF NOT v_flag_opentable
         THEN
            UTL_FILE.PUT_LINE (f, ' ');
            UTL_FILE.PUT_LINE (f, v_bold || v_str_parameters_title || v_bold);
            UTL_FILE.PUT_LINE
               (f,
                '{|{| border="1" cellpadding="5" cellspacing="0" align="center"'
               );
            UTL_FILE.PUT_LINE (f,
                                  '!style="background:#efefef;" width="150"|'
                               || '<small>'
                               || v_str_name_title
                               || '</small>'
                              );
            UTL_FILE.PUT_LINE (f,
                                  '!style="background:#efefef;" width="250"|'
                               || '<small>'
                               || v_str_desc_title
                               || '</small>'
                              );
            UTL_FILE.PUT_LINE (f,
                                  '!style="background:#efefef;" width="300"|'
                               || '<small>'
                               || v_str_help_title
                               || '</small>'
                              );
            UTL_FILE.PUT_LINE (f,
                                  '!style="background:#efefef;" width="80"|'
                               || '<small>'
                               || v_str_technical_title
                               || '</small>'
                              );
            v_flag_opentable := TRUE;
         -- Flag activated to indicate Table is Open
         END IF;                                   --  IF NOT v_flag_openTable

         UTL_FILE.PUT_LINE (f, '|-');
         UTL_FILE.PUT_LINE (f, '|-valign="top"');
         UTL_FILE.PUT_LINE (f,
                            '|' || v_ital || v_bold || pa.NAME || v_bold
                            || v_ital
                           );
         UTL_FILE.PUT_LINE (f, '||' || pa.description);
         UTL_FILE.PUT_LINE (f, '||' || pa.HELP);
         UTL_FILE.PUT_LINE (f, '|| ' || '<small>' || pa.columnname);
         UTL_FILE.PUT_LINE (f, ' ');
         UTL_FILE.PUT_LINE (f, pa.dbtype);
         UTL_FILE.PUT_LINE (f, ' ');

         IF pa.isrange = 'Y'
         THEN
            UTL_FILE.PUT_LINE (f, v_str_range_title || pa.isrange);
         END IF;

         UTL_FILE.PUT_LINE (f, '</small>');
         UTL_FILE.PUT_LINE (f, '|-valign="top"');
      END LOOP;                                              --  FOR Pa IN Par
   -- END PARAMETERS
   END LOOP;                                                 --  FOR Pr IN Pro

   IF v_flag_opentable
   THEN
      -- Table for Fields is Open -> Close Table
      UTL_FILE.PUT_LINE (f, '|}');
      v_flag_opentable := FALSE;
   END IF;

   UTL_FILE.PUT_LINE (f, ' ');
   UTL_FILE.FCLOSE (f);
END;
