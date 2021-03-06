CREATE OR REPLACE FUNCTION qss_get_tables_from_window (p_ad_window_id IN NUMBER)
   RETURN VARCHAR2
AS
   v_tables   VARCHAR2 (2000);
BEGIN
   v_tables := RPAD (' ', 2000, ' ');
   v_tables := '';
   FOR r IN (SELECT   ad_tab_id,
                      RPAD ('+', (tablevel), '+') || tablename tablename
                 FROM ad_tab b, ad_table t
                WHERE b.ad_table_id = t.ad_table_id
                  AND b.ad_window_id = p_ad_window_id
             ORDER BY seqno)
   LOOP
      v_tables := v_tables || ' ' || r.tablename;
      FOR j IN (SELECT NVL (p.classname, p.procedurename) cmd
                  FROM ad_field f, ad_column c, ad_process p
                 WHERE f.ad_tab_id = r.ad_tab_id
                   AND f.ad_column_id = c.ad_column_id
                   AND c.ad_reference_id = 28
                   AND c.ad_process_id = p.ad_process_id)
      LOOP
         IF j.cmd IS NOT NULL
         THEN
            v_tables := v_tables || ' (' || j.cmd || ')';
         END IF;
      END LOOP;
   END LOOP;
   RETURN SUBSTR (v_tables, 2);
END;
/
