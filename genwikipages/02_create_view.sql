CREATE OR REPLACE FORCE VIEW rv_query_for_manual
/**********************************************************************************************
/* REM VIEW FOR MANUAL: THIS VIEW MUST BE CREATED BEFORE EXECUTE THE SCRIPT !.
   Contributor: Carlos Antonio Ruiz Gomez - globalqss
*/
AS
   SELECT ad_language, ad_window_id, 0 ad_tab_id, 0 ad_field_id, 'W' TYPE,
          NAME, description, HELP, 0 seqtab, 0 seqfld, '' dbtable,
          '' dbcolumn, '' dbtype, '' adempieretype
     FROM ad_window_vt
    WHERE EXISTS (
             SELECT 1
               FROM ad_window
              WHERE ad_window.ad_window_id = ad_window_vt.ad_window_id
                AND ad_window.isactive = 'Y'
                AND ad_window.entitytype = 'D')
   UNION
   SELECT t.ad_language, t.ad_window_id, t.ad_tab_id, 0, 'T', t.NAME,
          t.description, t.HELP, t.seqno, 0, tt.tablename, '', '', ''
     FROM ad_tab_vt t, ad_table tt, user_tables ut
    WHERE EXISTS (
             SELECT 1
               FROM ad_tab
              WHERE ad_tab.ad_tab_id = t.ad_tab_id
                AND isactive = 'Y'
                AND entitytype = 'D')
      AND t.ad_table_id = tt.ad_table_id
      AND UPPER (tt.tablename) = ut.table_name
   UNION
   SELECT f.ad_language, t.ad_window_id, t.ad_tab_id, f.ad_field_id, 'F',
          f.NAME, f.description, f.HELP, t.seqno, f.seqno, tt.tablename,
          cc.columnname,
             uc.data_type
          || DECODE (uc.data_type,
                     'NVARCHAR2', '(' || uc.char_length || ')',
                     'CHAR', '(' || uc.char_length || ')',
                     'NUMBER', DECODE (uc.data_precision,
                                       NULL, NULL,
                                          '('
                                       || uc.data_precision
                                       || DECODE (uc.data_scale,
                                                  0, NULL,
                                                  ',' || uc.data_precision
                                                 )
                                       || ')'
                                      )
                    ),
          dba_displaytype (cc.ad_reference_id)
     FROM ad_field_vt f,
          ad_tab t,
          ad_table tt,
          user_tables ut,
          ad_column cc,
          user_tab_columns uc
    WHERE f.ad_tab_id = t.ad_tab_id
      AND isdisplayed = 'Y'
      AND EXISTS (
             SELECT 1
               FROM ad_field
              WHERE ad_field.ad_tab_id = f.ad_tab_id
                AND isactive = 'Y'
                AND entitytype = 'D')
      AND t.isactive = 'Y'
      AND t.ad_table_id = tt.ad_table_id
      AND UPPER (tt.tablename) = ut.table_name
      AND f.ad_column_id = cc.ad_column_id
      AND UPPER (tt.tablename) = uc.table_name
      AND UPPER (cc.columnname) = uc.column_name
   UNION
-- Base Language en_US
   SELECT 'en_US_base', ad_window_id, 0 ad_tab_id, 0 ad_field_id, 'W' TYPE,
          NAME, description, HELP, 0 seqtab, 0 seqfld, '' dbtable,
          '' dbcolumn, '' dbtype, '' compieretype
     FROM ad_window
    WHERE isactive = 'Y' AND entitytype = 'D'
   UNION
   SELECT 'en_US_base', t.ad_window_id, t.ad_tab_id, 0, 'T', t.NAME,
          t.description, t.HELP, t.seqno, 0, tt.tablename, '', '', ''
     FROM ad_tab t, ad_table tt, user_tables ut
    WHERE t.isactive = 'Y'
      AND t.ad_table_id = tt.ad_table_id
      AND UPPER (tt.tablename) = ut.table_name
      AND t.entitytype = 'D'
   UNION
   SELECT 'en_US_base', t.ad_window_id, t.ad_tab_id, f.ad_field_id, 'F',
          f.NAME, f.description, f.HELP, t.seqno, f.seqno, tt.tablename,
          cc.columnname,
             uc.data_type
          || DECODE (uc.data_type,
                     'NVARCHAR2', '(' || uc.char_length || ')',
                     'CHAR', '(' || uc.char_length || ')',
                     'NUMBER', DECODE (uc.data_precision,
                                       NULL, NULL,
                                          '('
                                       || uc.data_precision
                                       || DECODE (uc.data_scale,
                                                  0, NULL,
                                                  ',' || uc.data_precision
                                                 )
                                       || ')'
                                      )
                    ),
          dba_displaytype (cc.ad_reference_id)
     FROM ad_field f,
          ad_tab t,
          ad_table tt,
          user_tables ut,
          ad_column cc,
          user_tab_columns uc
    WHERE f.ad_tab_id = t.ad_tab_id
      AND isdisplayed = 'Y'
      AND f.isactive = 'Y'
      AND t.isactive = 'Y'
      AND t.ad_table_id = tt.ad_table_id
      AND UPPER (tt.tablename) = ut.table_name
      AND f.ad_column_id = cc.ad_column_id
      AND UPPER (tt.tablename) = uc.table_name
      AND UPPER (cc.columnname) = uc.column_name
      AND f.entitytype = 'D'
