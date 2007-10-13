INSERT INTO AD_SYSCONFIG
            (ad_sysconfig_id, ad_client_id, ad_org_id,
             created,
             updated, createdby,
             updatedby, isactive, NAME,
             VALUE,
             description
            )
     VALUES (50000, 0, 0,
             TO_DATE ('10/13/2007 14:30:57', 'MM/DD/YYYY HH24:MI:SS'),
             TO_DATE ('10/13/2007 14:32:17', 'MM/DD/YYYY HH24:MI:SS'), 100,
             100, 'Y', 'DICT_WEBSITE',
             'http://adempiere.globalqss.com/cgi-bin/get_ID',
             'Website where the system sequences are found (MSequence)'
            );

INSERT INTO AD_SYSCONFIG
            (ad_sysconfig_id, ad_client_id, ad_org_id,
             created,
             updated, createdby,
             updatedby, isactive, NAME, VALUE,
             description
            )
     VALUES (50001, 0, 0,
             TO_DATE ('10/13/2007 14:31:09', 'MM/DD/YYYY HH24:MI:SS'),
             TO_DATE ('10/13/2007 14:32:45', 'MM/DD/YYYY HH24:MI:SS'), 100,
             100, 'Y', 'DICT_USER', 'globalqss',
             'User (sourceforge developer) to get the system sequences (MSequence)'
            );

INSERT INTO AD_SYSCONFIG
            (ad_sysconfig_id, ad_client_id, ad_org_id,
             created,
             updated, createdby,
             updatedby, isactive, NAME, VALUE,
             description
            )
     VALUES (50002, 0, 0,
             TO_DATE ('10/13/2007 14:31:19', 'MM/DD/YYYY HH24:MI:SS'),
             TO_DATE ('10/13/2007 14:33:03', 'MM/DD/YYYY HH24:MI:SS'), 100,
             100, 'Y', 'DICT_PASSWORD', 'password_inseguro',
             'Password to get the system sequences (MSequence)'
            );

INSERT INTO AD_SYSCONFIG
            (ad_sysconfig_id, ad_client_id, ad_org_id,
             created,
             updated, createdby,
             updatedby, isactive, NAME,
             VALUE,
             description
            )
     VALUES (50003, 0, 0,
             TO_DATE ('10/13/2007 14:31:38', 'MM/DD/YYYY HH24:MI:SS'),
             TO_DATE ('10/13/2007 14:33:17', 'MM/DD/YYYY HH24:MI:SS'), 100,
             100, 'Y', 'DICT_COMMENTS',
             'Default comment for updating dictionary',
             'Comment to reserve the system sequences (MSequence)'
            );

COMMIT ;
