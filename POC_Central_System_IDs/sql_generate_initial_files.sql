SELECT 'echo ' || currentnextsys || ' > ' || NAME || '.seq'
  FROM AD_SEQUENCE
 WHERE istableid = 'Y'
   AND EXISTS (
          SELECT 1
            FROM user_tab_columns
           WHERE table_name = UPPER (NAME)
             AND column_name = UPPER (NAME) || '_ID')
			 
-- chown apache:apache *.seq
