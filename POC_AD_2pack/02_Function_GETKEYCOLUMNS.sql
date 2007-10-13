CREATE OR REPLACE FUNCTION getkeycolumns (
   p_table_name   user_tables.table_name%TYPE
)
   RETURN VARCHAR2
AS
   retorno   VARCHAR2 (4000) := RPAD (' ', 4000, ' ');
BEGIN
   FOR r IN (SELECT   uc.column_name, uc.POSITION
                 FROM user_constraints c, user_cons_columns uc
                WHERE c.table_name = p_table_name
                  AND c.constraint_type = 'P'
                  AND c.constraint_name = uc.constraint_name
             ORDER BY POSITION)
   LOOP
      IF r.POSITION = 1
      THEN
         retorno := r.column_name;
      ELSE
         retorno := TRIM (retorno) || ' ,' || r.column_name;
      END IF;
   END LOOP;

   RETURN trim(retorno);
END;
