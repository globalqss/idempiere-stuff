CREATE OR REPLACE FUNCTION getcolumns (
   p_table_name   user_tables.table_name%TYPE
)
   RETURN VARCHAR2
AS
   retorno   VARCHAR2 (4000) := RPAD (' ', 4000, ' ');
BEGIN
   FOR r IN (SELECT   column_name, column_id
                 FROM user_tab_columns
                WHERE table_name = p_table_name
             ORDER BY column_id)
   LOOP
      IF r.column_id = 1
      THEN
         retorno := r.column_name;
      ELSE
         retorno := TRIM (retorno) || ' ,' || r.column_name;
      END IF;
   END LOOP;

   RETURN TRIM (retorno);
END;
