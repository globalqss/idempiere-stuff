-- tables with ad_client_id
SELECT      'SELECT COUNT(*), '''
         || table_name
         || ''' FROM '
         || table_name
         || ' WHERE ad_client_id = 0 HAVING COUNT (*) > 0 UNION '
    FROM user_tables t
   WHERE
-- tables with ad_client_id
         EXISTS (
            SELECT 1
              FROM user_tab_columns tc
             WHERE tc.table_name = t.table_name
               AND tc.column_name = 'AD_CLIENT_ID')
-- not views
     AND EXISTS (
                SELECT 1
                  FROM user_objects o
                 WHERE o.object_name = t.table_name
                       AND o.object_type = 'TABLE')
ORDER BY table_name;
