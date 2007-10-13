CREATE OR REPLACE FUNCTION Getkeycolumnsand (
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
      IF r.column_name NOT IN
            ('AD_LANGUAGE',
             'ENTITYTYPE',
             'ACCESSTYPERULE',
             'RELATEDPRODUCTTYPE'
            )
      THEN
         retorno := TRIM (retorno) || ' AND ' || r.column_name || '<1000000';
      END IF;
   END LOOP;

   RETURN TRIM (retorno);
END;
