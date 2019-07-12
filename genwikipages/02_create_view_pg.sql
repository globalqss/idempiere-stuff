CREATE OR REPLACE VIEW rv_query_for_manual
/* REM VIEW FOR MANUAL: THIS VIEW MUST BE CREATED BEFORE EXECUTE THE SCRIPT !.
   Contributor: Carlos Antonio Ruiz Gomez - globalqss
*/
AS
   SELECT vt.AD_LANGUAGE, vt.ad_window_id, 0 ad_tab_id, 0 ad_field_id,
          'W' AS TYPE, vt.NAME, vt.description, vt.HELP, 0 seqtab, 0 seqfld,
          '' dbtable, '' dbcolumn, '' dbtype, '' adempieretype,
          w.isbetafunctionality
     FROM ad_window_vt vt INNER JOIN AD_WINDOW w
          ON (vt.ad_window_id = w.ad_window_id)
    WHERE EXISTS (
             SELECT 1
               FROM AD_WINDOW
              WHERE AD_WINDOW.ad_window_id = vt.ad_window_id
                AND AD_WINDOW.isactive = 'Y'
                AND AD_WINDOW_id < 1000000)
   UNION
   SELECT t.AD_LANGUAGE, t.ad_window_id, t.ad_tab_id, 0, 'T', t.NAME,
          t.description, t.HELP, t.seqno, 0, tt.tablename, '', '', '', ''
     FROM ad_tab_vt t, AD_TABLE tt, pg_tables ut
    WHERE EXISTS (
             SELECT 1
               FROM AD_TAB, AD_WINDOW
              WHERE AD_TAB.ad_tab_id = t.ad_tab_id
                AND AD_TAB.isactive = 'Y'
                AND AD_TAB.ad_tab_id < 1000000
                AND AD_TAB.ad_window_id = AD_WINDOW.ad_window_id
                AND AD_WINDOW.isactive = 'Y'
                AND AD_WINDOW.ad_window_id < 1000000)
      AND t.ad_table_id = tt.ad_table_id
      AND lower (tt.tablename) = ut.tablename
   UNION
-- When are views
   SELECT t.AD_LANGUAGE, t.ad_window_id, t.ad_tab_id, 0, 'T', t.NAME,
          t.description, t.HELP, t.seqno, 0, tt.tablename, '', '', '', ''
     FROM ad_tab_vt t, AD_TABLE tt, pg_views uv
    WHERE EXISTS (
             SELECT 1
               FROM AD_TAB, AD_WINDOW
              WHERE AD_TAB.ad_tab_id = t.ad_tab_id
                AND AD_TAB.isactive = 'Y'
                AND AD_TAB.ad_tab_id < 1000000
                AND AD_TAB.ad_window_id = AD_WINDOW.ad_window_id
                AND AD_WINDOW.isactive = 'Y'
                AND AD_WINDOW.ad_window_id < 1000000)
      AND t.ad_table_id = tt.ad_table_id
      AND lower (tt.tablename) = uv.viewname
   UNION
   SELECT f.AD_LANGUAGE, t.ad_window_id, t.ad_tab_id, f.ad_field_id, 'F',
          f.NAME, f.description, f.HELP, t.seqno, f.seqno, tt.tablename,
          cc.columnname,
             uc.data_type
          || CASE uc.data_type
                 WHEN 'character varying' THEN '(' || uc.character_maximum_length || ')'
                 WHEN 'character' THEN '(' || uc.character_maximum_length || ')'
                 WHEN 'numeric' THEN CASE
                                       WHEN uc.numeric_precision IS NULL THEN ''
                                       ELSE '('
                                       || uc.numeric_precision
                                       || CASE uc.numeric_scale
                                              WHEN 0 THEN ''
                                              ELSE ',' || uc.numeric_scale
                                          END
                                       || ')'
                                     END
                 ELSE ''
               END,
          (SELECT name FROM ad_reference WHERE ad_reference_id=cc.ad_reference_id), ''
     FROM ad_field_vt f,
          AD_TAB t,
          AD_TABLE tt,
          pg_tables ut,
          AD_COLUMN cc,
          information_schema.columns uc
    WHERE f.ad_tab_id = t.ad_tab_id
      AND isdisplayed = 'Y'
      AND EXISTS (
             SELECT 1
               FROM AD_FIELD, AD_TAB, AD_WINDOW
              WHERE AD_FIELD.ad_tab_id = f.ad_tab_id
                AND AD_FIELD.isactive = 'Y'
                AND AD_FIELD.ad_field_id < 1000000
                AND AD_TAB.ad_tab_id = AD_FIELD.ad_tab_id
                AND AD_TAB.isactive = 'Y'
                AND AD_TAB.ad_tab_id < 1000000
                AND AD_TAB.ad_window_id = AD_WINDOW.ad_window_id
                AND AD_WINDOW.isactive = 'Y'
                AND AD_WINDOW.ad_window_id < 1000000)
      AND t.isactive = 'Y'
      AND t.ad_table_id = tt.ad_table_id
      AND lower (tt.tablename) = ut.tablename
      AND f.ad_column_id = cc.ad_column_id
      AND lower (tt.tablename) = uc.table_name
      AND lower (cc.columnname) = uc.column_name
   UNION
-- When are views
   SELECT f.AD_LANGUAGE, t.ad_window_id, t.ad_tab_id, f.ad_field_id, 'F',
          f.NAME, f.description, f.HELP, t.seqno, f.seqno, tt.tablename,
          cc.columnname,
             uc.data_type
          || CASE uc.data_type
                 WHEN 'character varying' THEN '(' || uc.character_maximum_length || ')'
                 WHEN 'character' THEN '(' || uc.character_maximum_length || ')'
                 WHEN 'numeric' THEN CASE
                                       WHEN uc.numeric_precision IS NULL THEN ''
                                       ELSE '('
                                       || uc.numeric_precision
                                       || CASE uc.numeric_scale
                                              WHEN 0 THEN ''
                                              ELSE ',' || uc.numeric_scale
                                          END
                                       || ')'
                                     END
                 ELSE ''
               END,
          (SELECT name FROM ad_reference WHERE ad_reference_id=cc.ad_reference_id), ''
     FROM ad_field_vt f,
          AD_TAB t,
          AD_TABLE tt,
          pg_views uv,
          AD_COLUMN cc,
          information_schema.columns uc
    WHERE f.ad_tab_id = t.ad_tab_id
      AND isdisplayed = 'Y'
      AND EXISTS (
             SELECT 1
               FROM AD_FIELD, AD_TAB, AD_WINDOW
              WHERE AD_FIELD.ad_tab_id = f.ad_tab_id
                AND AD_FIELD.isactive = 'Y'
                AND AD_FIELD.ad_field_id < 1000000
                AND AD_TAB.ad_tab_id = AD_FIELD.ad_tab_id
                AND AD_TAB.isactive = 'Y'
                AND AD_TAB.ad_tab_id < 1000000
                AND AD_TAB.ad_window_id = AD_WINDOW.ad_window_id
                AND AD_WINDOW.isactive = 'Y'
                AND AD_WINDOW.ad_window_id < 1000000)
      AND t.isactive = 'Y'
      AND t.ad_table_id = tt.ad_table_id
      AND lower (tt.tablename) = uv.viewname
      AND f.ad_column_id = cc.ad_column_id
      AND lower (tt.tablename) = uc.table_name
      AND lower (cc.columnname) = uc.column_name
   UNION
-- Base Language en_US
   SELECT 'en_US_base', ad_window_id, 0 ad_tab_id, 0 ad_field_id, 'W' AS TYPE,
          NAME, description, HELP, 0 seqtab, 0 seqfld, '' dbtable,
          '' dbcolumn, '' dbtype, '' compieretype, isbetafunctionality
     FROM AD_WINDOW
    WHERE isactive = 'Y' AND ad_window_id < 1000000
   UNION
   SELECT 'en_US_base', t.ad_window_id, t.ad_tab_id, 0, 'T', t.NAME,
          t.description, t.HELP, t.seqno, 0, tt.tablename, '', '', '', ''
     FROM AD_TAB t, AD_TABLE tt, pg_tables ut, AD_WINDOW
    WHERE t.isactive = 'Y'
      AND t.ad_table_id = tt.ad_table_id
      AND lower (tt.tablename) = ut.tablename
      AND t.ad_tab_id < 1000000
      AND t.ad_window_id = AD_WINDOW.ad_window_id
      AND AD_WINDOW.isactive = 'Y'
      AND AD_WINDOW.ad_window_id < 1000000
   UNION
-- When are views
   SELECT 'en_US_base', t.ad_window_id, t.ad_tab_id, 0, 'T', t.NAME,
          t.description, t.HELP, t.seqno, 0, tt.tablename, '', '', '', ''
     FROM AD_TAB t, AD_TABLE tt, pg_views uv, AD_WINDOW
    WHERE t.isactive = 'Y'
      AND t.ad_table_id = tt.ad_table_id
      AND lower (tt.tablename) = uv.viewname
      AND t.ad_tab_id < 1000000
      AND t.ad_window_id = AD_WINDOW.ad_window_id
      AND AD_WINDOW.isactive = 'Y'
      AND AD_WINDOW.ad_window_id < 1000000
   UNION
   SELECT 'en_US_base', t.ad_window_id, t.ad_tab_id, f.ad_field_id, 'F',
          f.NAME, f.description, f.HELP, t.seqno, f.seqno, tt.tablename,
          cc.columnname,
             uc.data_type
          || CASE uc.data_type
                 WHEN 'character varying' THEN '(' || uc.character_maximum_length || ')'
                 WHEN 'character' THEN '(' || uc.character_maximum_length || ')'
                 WHEN 'numeric' THEN CASE
                                       WHEN uc.numeric_precision IS NULL THEN ''
                                       ELSE '('
                                       || uc.numeric_precision
                                       || CASE uc.numeric_scale
                                              WHEN 0 THEN ''
                                              ELSE ',' || uc.numeric_scale
                                          END
                                       || ')'
                                     END
                 ELSE ''
               END,
          (SELECT name FROM ad_reference WHERE ad_reference_id=cc.ad_reference_id), ''
     FROM AD_FIELD f,
          AD_TAB t,
          AD_TABLE tt,
          pg_tables ut,
          AD_COLUMN cc,
          information_schema.columns uc,
          AD_WINDOW
    WHERE f.ad_tab_id = t.ad_tab_id
      AND isdisplayed = 'Y'
      AND f.isactive = 'Y'
      AND t.isactive = 'Y'
      AND t.ad_table_id = tt.ad_table_id
      AND lower (tt.tablename) = ut.tablename
      AND f.ad_column_id = cc.ad_column_id
      AND lower (tt.tablename) = uc.table_name
      AND lower (cc.columnname) = uc.column_name
      AND f.ad_field_id < 1000000
      AND t.ad_window_id = AD_WINDOW.ad_window_id
      AND AD_WINDOW.isactive = 'Y'
      AND AD_WINDOW.ad_window_id < 1000000
   UNION
-- When are views
   SELECT 'en_US_base', t.ad_window_id, t.ad_tab_id, f.ad_field_id, 'F',
          f.NAME, f.description, f.HELP, t.seqno, f.seqno, tt.tablename,
          cc.columnname,
             uc.data_type
          || CASE uc.data_type
                 WHEN 'character varying' THEN '(' || uc.character_maximum_length || ')'
                 WHEN 'character' THEN '(' || uc.character_maximum_length || ')'
                 WHEN 'numeric' THEN CASE
                                       WHEN uc.numeric_precision IS NULL THEN ''
                                       ELSE '('
                                       || uc.numeric_precision
                                       || CASE uc.numeric_scale
                                              WHEN 0 THEN ''
                                              ELSE ',' || uc.numeric_scale
                                          END
                                       || ')'
                                     END
                 ELSE ''
               END,
          (SELECT name FROM ad_reference WHERE ad_reference_id=cc.ad_reference_id), ''
     FROM AD_FIELD f,
          AD_TAB t,
          AD_TABLE tt,
          AD_COLUMN cc,
          pg_views uv,
          information_schema.columns uc,
          AD_WINDOW
    WHERE f.ad_tab_id = t.ad_tab_id
      AND isdisplayed = 'Y'
      AND f.isactive = 'Y'
      AND t.isactive = 'Y'
      AND t.ad_table_id = tt.ad_table_id
      AND lower (tt.tablename) = uv.viewname
      AND f.ad_column_id = cc.ad_column_id
      AND lower (tt.tablename) = uc.table_name
      AND lower (cc.columnname) = uc.column_name
      AND f.ad_field_id < 1000000
      AND t.ad_window_id = AD_WINDOW.ad_window_id
      AND AD_WINDOW.isactive = 'Y'
      AND AD_WINDOW.ad_window_id < 1000000
