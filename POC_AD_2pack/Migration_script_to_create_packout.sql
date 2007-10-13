INSERT INTO AD_PACKAGE_EXP
            (ad_package_exp_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_package_type, email,
             instructions,
             NAME, processed, releaseno, VERSION,
             username, processing, pk_version, file_directory,
             description
            )
     VALUES (50000, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:21:50', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:21:50', 'MM/DD/YYYY HH24:MI:SS'), 100,
             'X', 'team@adempiere.org',
             'Run PackIn against this package to migrate the dictionary',
             'ApplicationDictionary', 'N', 'all', '3.2.0',
             'team@adempiere.org', 'N', '3.2.0', 'C:\Temp\',
             'Application Dictionary for Migration'
            );



INSERT INTO AD_PACKAGE_EXP
            (ad_package_exp_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_package_type, email,
             instructions,
             NAME, processed, releaseno, VERSION, username,
             processing, pk_version, file_directory, description
            )
     VALUES (50001, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:21:50', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:21:50', 'MM/DD/YYYY HH24:MI:SS'), 100,
             'X', 'team@adempiere.org',
             'Run PackIn against this package to migrate the GardenWorld Seed',
             'GardenWorldSeed', 'N', 'all', '3.2.0', 'team@adempiere.org',
             'N', '3.2.0', 'C:\Temp\', 'Garden World Seed for Migration'
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50000, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_CLIENT', 'ALL', 'D',
             'SELECT AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,SMTPHOST ,REQUESTEMAIL ,REQUESTUSER ,REQUESTUSERPW ,REQUESTFOLDER ,AD_LANGUAGE ,ISMULTILINGUALDOCUMENT ,ISSMTPAUTHORIZATION ,ISUSEBETAFUNCTIONS ,LDAPQUERY ,MODELVALIDATIONCLASSES ,AUTOARCHIVE ,MMPOLICY ,EMAILTEST ,ISSERVEREMAIL ,DOCUMENTDIR ,ISPOSTIMMEDIATE ,ISCOSTIMMEDIATE ,STOREATTACHMENTSONFILESYSTEM ,WINDOWSATTACHMENTPATH ,UNIXATTACHMENTPATH FROM AD_CLIENT WHERE AD_Client_ID = 0 AND AD_CLIENT_ID<1000000 ORDER BY AD_CLIENT_ID',
             'N', 'N', 100, 112, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50001, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_ELEMENT', 'ALL', 'D',
             'SELECT AD_ELEMENT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,COLUMNNAME ,ENTITYTYPE ,NAME ,PRINTNAME ,DESCRIPTION ,HELP ,PO_NAME ,PO_PRINTNAME ,PO_DESCRIPTION ,PO_HELP FROM AD_ELEMENT WHERE AD_Client_ID = 0 AND AD_ELEMENT_ID<1000000 ORDER BY AD_ELEMENT_ID',
             'N', 'N', 200, 276, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50002, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_ENTITYTYPE', 'ALL', 'D',
             'SELECT ENTITYTYPE ,AD_CLIENT_ID ,AD_ORG_ID ,AD_ENTITYTYPE_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,VERSION ,MODELPACKAGE ,CLASSPATH ,PROCESSING FROM AD_ENTITYTYPE WHERE AD_Client_ID = 0  ORDER BY ENTITYTYPE',
             'N', 'N', 300, 882, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50003, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_FIELDGROUP', 'ALL', 'D',
             'SELECT AD_FIELDGROUP_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,ENTITYTYPE FROM AD_FIELDGROUP WHERE AD_Client_ID = 0 AND AD_FIELDGROUP_ID<1000000 ORDER BY AD_FIELDGROUP_ID',
             'N', 'N', 400, 414, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50004, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_FORM', 'ALL', 'D',
             'SELECT AD_FORM_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ACCESSLEVEL ,CLASSNAME ,ENTITYTYPE ,ISBETAFUNCTIONALITY ,JSPURL FROM AD_FORM WHERE AD_Client_ID = 0 AND AD_FORM_ID<1000000 ORDER BY AD_FORM_ID',
             'N', 'N', 500, 376, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50005, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_IMAGE', 'ALL', 'D',
             'SELECT AD_IMAGE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,IMAGEURL ,BINARYDATA ,ENTITYTYPE ,DESCRIPTION FROM AD_IMAGE WHERE AD_Client_ID = 0 AND AD_IMAGE_ID<1000000 ORDER BY AD_IMAGE_ID',
             'N', 'N', 600, 461, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50006, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PACKAGE_EXP', 'ALL', 'D',
             'SELECT AD_PACKAGE_EXP_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_PACKAGE_TYPE ,EMAIL ,INSTRUCTIONS ,NAME ,PROCESSED ,RELEASENO ,VERSION ,USERNAME ,PROCESSING ,PK_VERSION ,FILE_DIRECTORY ,DESCRIPTION FROM AD_PACKAGE_EXP WHERE AD_Client_ID = 0 AND AD_PACKAGE_EXP_ID<1000000 ORDER BY AD_PACKAGE_EXP_ID',
             'N', 'N', 700, 50005, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50007, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PACKAGE_EXP_DETAIL', 'ALL', 'D',
             'SELECT AD_PACKAGE_EXP_DETAIL_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_FORM_ID ,AD_IMPFORMAT_ID ,AD_MENU_ID ,AD_PROCESS_ID ,AD_ROLE_ID ,AD_WINDOW_ID ,AD_WORKFLOW_ID ,FILE_DIRECTORY ,FILENAME ,DESTINATION_FILENAME ,DESTINATION_DIRECTORY ,DESCRIPTION ,DBTYPE ,TYPE ,TARGET_DIRECTORY ,SQLSTATEMENT ,RELEASENO ,PROCESSING ,PROCESSED ,NAME2 ,LINE ,AD_WORKBENCH_ID ,AD_TABLE_ID ,AD_REPORTVIEW_ID ,AD_PACKAGE_EXP_ID ,AD_PACKAGE_CODE_NEW ,AD_PACKAGE_CODE_OLD ,AD_VAL_RULE_ID FROM AD_PACKAGE_EXP_DETAIL WHERE AD_Client_ID = 0 AND AD_PACKAGE_EXP_DETAIL_ID<1000000 ORDER BY AD_PACKAGE_EXP_DETAIL_ID',
             'N', 'N', 800, 50006, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50008, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PRINTCOLOR', 'ALL', 'D',
             'SELECT AD_PRINTCOLOR_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,ISDEFAULT ,CODE FROM AD_PRINTCOLOR WHERE AD_Client_ID = 0 AND AD_PRINTCOLOR_ID<1000000 ORDER BY AD_PRINTCOLOR_ID',
             'N', 'N', 900, 490, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50009, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PRINTFONT', 'ALL', 'D',
             'SELECT AD_PRINTFONT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,ISDEFAULT ,CODE FROM AD_PRINTFONT WHERE AD_Client_ID = 0 AND AD_PRINTFONT_ID<1000000 ORDER BY AD_PRINTFONT_ID',
             'N', 'N', 1000, 491, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50010, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PRINTPAPER', 'ALL', 'D',
             'SELECT AD_PRINTPAPER_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,ISDEFAULT ,ISLANDSCAPE ,CODE ,MARGINTOP ,MARGINLEFT ,MARGINRIGHT ,MARGINBOTTOM ,PROCESSING ,SIZEX ,SIZEY ,DIMENSIONUNITS FROM AD_PRINTPAPER WHERE AD_Client_ID = 0 AND AD_PRINTPAPER_ID<1000000 ORDER BY AD_PRINTPAPER_ID',
             'N', 'N', 1100, 492, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50011, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_REPLICATIONSTRATEGY', 'ALL', 'D',
             'SELECT AD_REPLICATIONSTRATEGY_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ENTITYTYPE FROM AD_REPLICATIONSTRATEGY WHERE AD_Client_ID = 0 AND AD_REPLICATIONSTRATEGY_ID<1000000 ORDER BY AD_REPLICATIONSTRATEGY_ID',
             'N', 'N', 1200, 602, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50012, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_SESSION', 'ALL', 'D',
             'SELECT AD_SESSION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,WEBSESSION ,REMOTE_ADDR ,REMOTE_HOST ,PROCESSED FROM AD_SESSION WHERE AD_Client_ID = 0 AND AD_SESSION_ID<1000000 ORDER BY AD_SESSION_ID',
             'N', 'N', 1300, 566, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50013, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_SYSTEM', 'ALL', 'D',
             'SELECT AD_SYSTEM_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,USERNAME ,INFO ,VERSION ,RELEASENO ,SUPPORTUNITS ,PASSWORD ,REPLICATIONTYPE ,IDRANGESTART ,IDRANGEEND ,LDAPHOST ,CUSTOMPREFIX ,ISJUSTMIGRATED ,DBINSTANCE ,DBADDRESS ,NOPROCESSORS ,SUMMARY ,ENCRYPTIONKEY ,LDAPDOMAIN ,ISAUTOERRORREPORT ,RECORD_ID ,SUPPORTEXPDATE ,PROCESSING ,SUPPORTEMAIL ,ISALLOWSTATISTICS ,STATISTICSINFO ,PROFILEINFO ,OLDNAME ,DESCRIPTION ,SYSTEMSTATUS FROM AD_SYSTEM WHERE AD_Client_ID = 0 AND AD_SYSTEM_ID<1000000 AND AD_CLIENT_ID<1000000 ORDER BY AD_SYSTEM_ID ,AD_CLIENT_ID',
             'N', 'N', 1400, 531, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50014, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TREE', 'ALL', 'D',
             'SELECT AD_TREE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISACTIVE ,NAME ,DESCRIPTION ,TREETYPE ,ISALLNODES ,PROCESSING ,ISDEFAULT FROM AD_TREE WHERE AD_Client_ID = 0 AND AD_TREE_ID<1000000 ORDER BY AD_TREE_ID',
             'N', 'N', 1500, 288, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50015, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_CONVERSIONTYPE', 'ALL', 'D',
             'SELECT C_CONVERSIONTYPE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,ISDEFAULT FROM C_CONVERSIONTYPE WHERE AD_Client_ID = 0 AND C_CONVERSIONTYPE_ID<1000000 ORDER BY C_CONVERSIONTYPE_ID',
             'N', 'N', 1600, 637, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50016, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'GL_CATEGORY', 'ALL', 'D',
             'SELECT GL_CATEGORY_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,CATEGORYTYPE ,ISDEFAULT ,DOCBASETYPE FROM GL_CATEGORY WHERE AD_Client_ID = 0 AND GL_CATEGORY_ID<1000000 ORDER BY GL_CATEGORY_ID',
             'N', 'N', 1700, 218, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50017, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_ATTRIBUTESET', 'ALL', 'D',
             'SELECT M_ATTRIBUTESET_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,ISSERNO ,M_SERNOCTL_ID ,ISLOT ,M_LOTCTL_ID ,ISGUARANTEEDATE ,GUARANTEEDAYS ,ISINSTANCEATTRIBUTE ,MANDATORYTYPE ,ISGUARANTEEDATEMANDATORY ,ISLOTMANDATORY ,ISSERNOMANDATORY ,SERNOCHARSOVERWRITE ,LOTCHARSOVERWRITE ,LOTCHAREOVERWRITE ,SERNOCHAREOVERWRITE FROM M_ATTRIBUTESET WHERE AD_Client_ID = 0 AND M_ATTRIBUTESET_ID<1000000 ORDER BY M_ATTRIBUTESET_ID',
             'N', 'N', 1800, 560, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50018, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'PA_MEASURECALC', 'ALL', 'D',
             'SELECT PA_MEASURECALC_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,SELECTCLAUSE ,WHERECLAUSE ,DATECOLUMN ,ORGCOLUMN ,BPARTNERCOLUMN ,PRODUCTCOLUMN ,AD_TABLE_ID ,KEYCOLUMN ,ENTITYTYPE FROM PA_MEASURECALC WHERE AD_Client_ID = 0 AND PA_MEASURECALC_ID<1000000 ORDER BY PA_MEASURECALC_ID',
             'N', 'N', 1900, 442, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50019, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'PA_REPORTCOLUMNSET', 'ALL', 'D',
             'SELECT PA_REPORTCOLUMNSET_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,PROCESSING FROM PA_REPORTCOLUMNSET WHERE AD_Client_ID = 0 AND PA_REPORTCOLUMNSET_ID<1000000 ORDER BY PA_REPORTCOLUMNSET_ID',
             'N', 'N', 2000, 447, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50020, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'PA_SLA_CRITERIA', 'ALL', 'D',
             'SELECT PA_SLA_CRITERIA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISMANUAL ,CLASSNAME FROM PA_SLA_CRITERIA WHERE AD_Client_ID = 0 AND PA_SLA_CRITERIA_ID<1000000 ORDER BY PA_SLA_CRITERIA_ID',
             'N', 'N', 2100, 744, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50021, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'TEST', 'ALL', 'D',
             'SELECT TEST_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,T_INTEGER ,T_NUMBER ,T_DATE ,T_DATETIME ,C_UOM_ID ,T_QTY ,C_CURRENCY_ID ,T_AMOUNT ,C_LOCATION_ID ,ACCOUNT_ACCT ,C_PAYMENT_ID ,M_PRODUCT_ID ,C_BPARTNER_ID ,M_LOCATOR_ID ,PROCESSING ,BINARYDATA ,PROCESSED ,CHARACTERDATA FROM TEST WHERE AD_Client_ID = 0 AND TEST_ID<1000000 ORDER BY TEST_ID',
             'N', 'N', 2200, 135, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50022, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_DESKTOP', 'ALL', 'D',
             'SELECT AD_DESKTOP_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,AD_IMAGE_ID ,AD_COLOR_ID FROM AD_DESKTOP WHERE AD_Client_ID = 0 AND AD_DESKTOP_ID<1000000 ORDER BY AD_DESKTOP_ID',
             'N', 'N', 2300, 458, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50023, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_ORG', 'ALL', 'D',
             'SELECT AD_ORG_ID ,AD_CLIENT_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,ISSUMMARY FROM AD_ORG WHERE AD_Client_ID = 0 AND AD_ORG_ID<1000000 ORDER BY AD_ORG_ID',
             'N', 'N', 2400, 155, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50024, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PRINTTABLEFORMAT', 'ALL', 'D',
             'SELECT AD_PRINTTABLEFORMAT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,HDR_PRINTFONT_ID ,HDRTEXTFG_PRINTCOLOR_ID ,HDRTEXTBG_PRINTCOLOR_ID ,HDRLINE_PRINTCOLOR_ID ,FUNCT_PRINTFONT_ID ,FUNCTBG_PRINTCOLOR_ID ,FUNCTFG_PRINTCOLOR_ID ,LINE_PRINTCOLOR_ID ,DESCRIPTION ,ISPAINTBOUNDARYLINES ,ISPAINTHLINES ,ISPAINTVLINES ,ISPRINTFUNCTIONSYMBOLS ,NAME ,ISDEFAULT ,IMAGEURL ,HEADERLEFT ,HEADERCENTER ,HEADERRIGHT ,FOOTERLEFT ,FOOTERCENTER ,FOOTERRIGHT ,IMAGEISATTACHED ,HDRSTROKE ,LINESTROKE ,HDRSTROKETYPE ,LINESTROKETYPE ,ISPAINTHEADERLINES FROM AD_PRINTTABLEFORMAT WHERE AD_Client_ID = 0 AND AD_PRINTTABLEFORMAT_ID<1000000 ORDER BY AD_PRINTTABLEFORMAT_ID',
             'N', 'N', 2500, 523, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50025, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TREENODE', 'ALL', 'D',
             'SELECT AD_TREE_ID ,NODE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,PARENT_ID ,SEQNO FROM AD_TREENODE WHERE AD_Client_ID = 0 AND AD_TREE_ID<1000000 AND NODE_ID<1000000 ORDER BY AD_TREE_ID ,NODE_ID',
             'N', 'N', 2600, 289, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50026, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TREENODEMM', 'ALL', 'D',
             'SELECT AD_TREE_ID ,NODE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,PARENT_ID ,SEQNO FROM AD_TREENODEMM WHERE AD_Client_ID = 0 AND AD_TREE_ID<1000000 AND NODE_ID<1000000 ORDER BY AD_TREE_ID ,NODE_ID',
             'N', 'N', 2700, 452, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50027, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WORKBENCH', 'ALL', 'D',
             'SELECT AD_WORKBENCH_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,AD_COLUMN_ID ,AD_IMAGE_ID ,AD_COLOR_ID ,ENTITYTYPE FROM AD_WORKBENCH WHERE AD_Client_ID = 0 AND AD_WORKBENCH_ID<1000000 ORDER BY AD_WORKBENCH_ID',
             'N', 'N', 2800, 468, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50028, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_ATTRIBUTESETINSTANCE', 'ALL', 'D',
             'SELECT M_ATTRIBUTESETINSTANCE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,M_ATTRIBUTESET_ID ,SERNO ,LOT ,GUARANTEEDATE ,DESCRIPTION ,M_LOT_ID FROM M_ATTRIBUTESETINSTANCE WHERE AD_Client_ID = 0 AND M_ATTRIBUTESETINSTANCE_ID<1000000 ORDER BY M_ATTRIBUTESETINSTANCE_ID',
             'N', 'N', 2900, 559, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50029, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'PA_COLORSCHEMA', 'ALL', 'D',
             'SELECT PA_COLORSCHEMA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,MARK1PERCENT ,AD_PRINTCOLOR1_ID ,MARK2PERCENT ,AD_PRINTCOLOR2_ID ,MARK3PERCENT ,AD_PRINTCOLOR3_ID ,MARK4PERCENT ,AD_PRINTCOLOR4_ID ,ENTITYTYPE FROM PA_COLORSCHEMA WHERE AD_Client_ID = 0 AND PA_COLORSCHEMA_ID<1000000 ORDER BY PA_COLORSCHEMA_ID',
             'N', 'N', 3000, 831, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50030, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_DESKTOPWORKBENCH', 'ALL', 'D',
             'SELECT AD_DESKTOPWORKBENCH_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_WORKBENCH_ID ,AD_DESKTOP_ID ,SEQNO FROM AD_DESKTOPWORKBENCH WHERE AD_Client_ID = 0 AND AD_DESKTOPWORKBENCH_ID<1000000 ORDER BY AD_DESKTOPWORKBENCH_ID',
             'N', 'N', 3100, 459, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50031, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_LANGUAGE', 'ALL', 'D',
             'SELECT AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,LANGUAGEISO ,COUNTRYCODE ,ISBASELANGUAGE ,ISSYSTEMLANGUAGE ,PROCESSING ,AD_LANGUAGE_ID ,ISDECIMALPOINT ,DATEPATTERN ,TIMEPATTERN FROM AD_LANGUAGE WHERE AD_Client_ID = 0  ORDER BY AD_LANGUAGE',
             'N', 'N', 3200, 111, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50032, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_MESSAGE', 'ALL', 'D',
             'SELECT AD_MESSAGE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,MSGTEXT ,MSGTIP ,MSGTYPE ,ENTITYTYPE FROM AD_MESSAGE WHERE AD_Client_ID = 0 AND AD_MESSAGE_ID<1000000 ORDER BY AD_MESSAGE_ID',
             'N', 'N', 3300, 109, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50033, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_REFERENCE', 'ALL', 'D',
             'SELECT AD_REFERENCE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,VALIDATIONTYPE ,VFORMAT ,ENTITYTYPE FROM AD_REFERENCE WHERE AD_Client_ID = 0 AND AD_REFERENCE_ID<1000000 ORDER BY AD_REFERENCE_ID',
             'N', 'N', 3400, 102, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50034, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_SEQUENCE', 'ALL', 'D',
             'SELECT AD_SEQUENCE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,VFORMAT ,ISAUTOSEQUENCE ,INCREMENTNO ,STARTNO ,CURRENTNEXT ,CURRENTNEXTSYS ,ISAUDITED ,ISTABLEID ,PREFIX ,SUFFIX ,STARTNEWYEAR FROM AD_SEQUENCE WHERE AD_Client_ID = 0 AND AD_SEQUENCE_ID<1000000 ORDER BY AD_SEQUENCE_ID',
             'N', 'N', 3500, 115, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50035, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TASK', 'ALL', 'D',
             'SELECT AD_TASK_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ACCESSLEVEL ,OS_COMMAND ,ENTITYTYPE ,ISSERVERPROCESS FROM AD_TASK WHERE AD_Client_ID = 0 AND AD_TASK_ID<1000000 ORDER BY AD_TASK_ID',
             'N', 'N', 3600, 118, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50036, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_USER', 'ALL', 'D',
             'SELECT AD_USER_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,PASSWORD ,EMAIL ,SUPERVISOR_ID ,C_BPARTNER_ID ,PROCESSING ,EMAILUSER ,EMAILUSERPW ,C_BPARTNER_LOCATION_ID ,C_GREETING_ID ,TITLE ,COMMENTS ,PHONE ,PHONE2 ,FAX ,LASTCONTACT ,LASTRESULT ,BIRTHDAY ,AD_ORGTRX_ID ,EMAILVERIFY ,EMAILVERIFYDATE ,NOTIFICATIONTYPE ,ISFULLBPACCESS ,C_JOB_ID ,LDAPUSER ,CONNECTIONPROFILE ,VALUE FROM AD_USER WHERE AD_Client_ID = 0 AND AD_USER_ID<1000000 ORDER BY AD_USER_ID',
             'N', 'N', 3700, 114, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50037, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_VAL_RULE', 'ALL', 'D',
             'SELECT AD_VAL_RULE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,TYPE ,CODE ,ENTITYTYPE FROM AD_VAL_RULE WHERE AD_Client_ID = 0 AND AD_VAL_RULE_ID<1000000 ORDER BY AD_VAL_RULE_ID',
             'N', 'N', 3800, 108, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50038, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WINDOW', 'ALL', 'D',
             'SELECT AD_WINDOW_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,WINDOWTYPE ,ISSOTRX ,ENTITYTYPE ,PROCESSING ,AD_IMAGE_ID ,AD_COLOR_ID ,ISDEFAULT ,WINHEIGHT ,WINWIDTH ,ISBETAFUNCTIONALITY FROM AD_WINDOW WHERE AD_Client_ID = 0 AND AD_WINDOW_ID<1000000 ORDER BY AD_WINDOW_ID',
             'N', 'N', 3900, 105, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50039, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_CURRENCY', 'ALL', 'D',
             'SELECT C_CURRENCY_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISO_CODE ,CURSYMBOL ,DESCRIPTION ,STDPRECISION ,COSTINGPRECISION ,ISEURO ,ISEMUMEMBER ,EMUENTRYDATE ,EMURATE FROM C_CURRENCY WHERE AD_Client_ID = 0 AND C_CURRENCY_ID<1000000 ORDER BY C_CURRENCY_ID',
             'N', 'N', 4000, 141, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50040, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_UOM', 'ALL', 'D',
             'SELECT C_UOM_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,UPDATED ,CREATEDBY ,UPDATEDBY ,X12DE355 ,UOMSYMBOL ,NAME ,DESCRIPTION ,STDPRECISION ,COSTINGPRECISION ,ISDEFAULT FROM C_UOM WHERE AD_Client_ID = 0 AND C_UOM_ID<1000000 ORDER BY C_UOM_ID',
             'N', 'N', 4100, 146, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50041, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_ALERTPROCESSOR', 'ALL', 'D',
             'SELECT AD_ALERTPROCESSOR_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,FREQUENCYTYPE ,FREQUENCY ,DATELASTRUN ,DATENEXTRUN ,SUPERVISOR_ID ,KEEPLOGDAYS ,PROCESSING FROM AD_ALERTPROCESSOR WHERE AD_Client_ID = 0 AND AD_ALERTPROCESSOR_ID<1000000 ORDER BY AD_ALERTPROCESSOR_ID',
             'N', 'N', 4200, 700, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50042, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_CLIENTINFO', 'ALL', 'D',
             'SELECT AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISDISCOUNTLINEAMT ,C_CALENDAR_ID ,C_ACCTSCHEMA1_ID ,C_UOM_VOLUME_ID ,C_UOM_WEIGHT_ID ,C_UOM_LENGTH_ID ,C_UOM_TIME_ID ,AD_TREE_MENU_ID ,AD_TREE_ORG_ID ,AD_TREE_BPARTNER_ID ,AD_TREE_PROJECT_ID ,AD_TREE_SALESREGION_ID ,AD_TREE_PRODUCT_ID ,M_PRODUCTFREIGHT_ID ,C_BPARTNERCASHTRX_ID ,KEEPLOGDAYS ,AD_TREE_ACTIVITY_ID ,AD_TREE_CAMPAIGN_ID FROM AD_CLIENTINFO WHERE AD_Client_ID = 0 AND AD_CLIENT_ID<1000000 ORDER BY AD_CLIENT_ID',
             'N', 'N', 4300, 227, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50043, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_DESKTOP_TRL', 'ALL', 'D',
             'SELECT AD_DESKTOP_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISTRANSLATED FROM AD_DESKTOP_TRL WHERE AD_Client_ID = 0 AND AD_DESKTOP_ID<1000000 ORDER BY AD_DESKTOP_ID ,AD_LANGUAGE',
             'N', 'N', 4400, 460, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50044, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_ELEMENT_TRL', 'ALL', 'D',
             'SELECT AD_ELEMENT_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,PRINTNAME ,DESCRIPTION ,HELP ,PO_NAME ,PO_PRINTNAME ,PO_DESCRIPTION ,PO_HELP ,ISTRANSLATED FROM AD_ELEMENT_TRL WHERE AD_Client_ID = 0 AND AD_ELEMENT_ID<1000000 ORDER BY AD_ELEMENT_ID ,AD_LANGUAGE',
             'N', 'N', 4500, 277, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50045, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_FIELDGROUP_TRL', 'ALL', 'D',
             'SELECT AD_FIELDGROUP_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,ISTRANSLATED FROM AD_FIELDGROUP_TRL WHERE AD_Client_ID = 0 AND AD_FIELDGROUP_ID<1000000 ORDER BY AD_FIELDGROUP_ID ,AD_LANGUAGE',
             'N', 'N', 4600, 415, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50046, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_FORM_TRL', 'ALL', 'D',
             'SELECT AD_FORM_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISTRANSLATED FROM AD_FORM_TRL WHERE AD_Client_ID = 0 AND AD_FORM_ID<1000000 ORDER BY AD_FORM_ID ,AD_LANGUAGE',
             'N', 'N', 4700, 377, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50047, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_LDAPPROCESSOR', 'ALL', 'D',
             'SELECT AD_LDAPPROCESSOR_ID ,AD_CLIENT_ID ,AD_ORG_ID ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISACTIVE ,NAME ,DESCRIPTION ,LDAPPORT ,DATELASTRUN ,DATENEXTRUN ,SUPERVISOR_ID ,KEEPLOGDAYS ,PROCESSING FROM AD_LDAPPROCESSOR WHERE AD_Client_ID = 0 AND AD_LDAPPROCESSOR_ID<1000000 ORDER BY AD_LDAPPROCESSOR_ID',
             'N', 'N', 4800, 902, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50048, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_MESSAGE_TRL', 'ALL', 'D',
             'SELECT AD_MESSAGE_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,MSGTEXT ,MSGTIP ,ISTRANSLATED FROM AD_MESSAGE_TRL WHERE AD_Client_ID = 0 AND AD_MESSAGE_ID<1000000 ORDER BY AD_MESSAGE_ID ,AD_LANGUAGE',
             'N', 'N', 4900, 119, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50049, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PREFERENCE', 'ALL', 'D',
             'SELECT AD_PREFERENCE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_WINDOW_ID ,AD_USER_ID ,ATTRIBUTE ,VALUE FROM AD_PREFERENCE WHERE AD_Client_ID = 0 AND AD_PREFERENCE_ID<1000000 ORDER BY AD_PREFERENCE_ID',
             'N', 'N', 5000, 195, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50050, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_REF_LIST', 'ALL', 'D',
             'SELECT AD_REF_LIST_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,AD_REFERENCE_ID ,VALIDFROM ,VALIDTO ,ENTITYTYPE FROM AD_REF_LIST WHERE AD_Client_ID = 0 AND AD_REF_LIST_ID<1000000 ORDER BY AD_REF_LIST_ID',
             'N', 'N', 5100, 104, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50051, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_REFERENCE_TRL', 'ALL', 'D',
             'SELECT AD_REFERENCE_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISTRANSLATED FROM AD_REFERENCE_TRL WHERE AD_Client_ID = 0 AND AD_REFERENCE_ID<1000000 ORDER BY AD_REFERENCE_ID ,AD_LANGUAGE',
             'N', 'N', 5200, 126, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50052, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_ROLE', 'ALL', 'D',
             'SELECT AD_ROLE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,NAME ,UPDATEDBY ,DESCRIPTION ,USERLEVEL ,C_CURRENCY_ID ,AMTAPPROVAL ,AD_TREE_MENU_ID ,ISMANUAL ,ISSHOWACCT ,ISPERSONALLOCK ,ISPERSONALACCESS ,ISCANEXPORT ,ISCANREPORT ,SUPERVISOR_ID ,ISCANAPPROVEOWNDOC ,ISACCESSALLORGS ,ISCHANGELOG ,PREFERENCETYPE ,OVERWRITEPRICELIMIT ,ISUSEUSERORGACCESS ,AD_TREE_ORG_ID ,CONFIRMQUERYRECORDS ,MAXQUERYRECORDS ,CONNECTIONPROFILE ,ALLOW_INFO_ACCOUNT ,ALLOW_INFO_ASSET ,ALLOW_INFO_BPARTNER ,ALLOW_INFO_CASHJOURNAL ,ALLOW_INFO_INOUT ,ALLOW_INFO_INVOICE ,ALLOW_INFO_ORDER ,ALLOW_INFO_PAYMENT ,ALLOW_INFO_PRODUCT ,ALLOW_INFO_RESOURCE ,ALLOW_INFO_SCHEDULE FROM AD_ROLE WHERE AD_Client_ID = 0 AND AD_ROLE_ID<1000000 ORDER BY AD_ROLE_ID',
             'N', 'N', 5300, 156, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50053, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TABLE', 'ALL', 'D',
             'SELECT AD_TABLE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,TABLENAME ,ISVIEW ,ACCESSLEVEL ,ENTITYTYPE ,AD_WINDOW_ID ,AD_VAL_RULE_ID ,LOADSEQ ,ISSECURITYENABLED ,ISDELETEABLE ,ISHIGHVOLUME ,IMPORTTABLE ,ISCHANGELOG ,REPLICATIONTYPE ,PO_WINDOW_ID ,COPYCOLUMNSFROMTABLE FROM AD_TABLE WHERE AD_Client_ID = 0 AND AD_TABLE_ID<1000000 ORDER BY AD_TABLE_ID',
             'N', 'N', 5400, 100, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50054, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TASK_TRL', 'ALL', 'D',
             'SELECT AD_TASK_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISTRANSLATED FROM AD_TASK_TRL WHERE AD_Client_ID = 0 AND AD_TASK_ID<1000000 ORDER BY AD_TASK_ID ,AD_LANGUAGE',
             'N', 'N', 5500, 124, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50055, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TREEBAR', 'ALL', 'D',
             'SELECT AD_TREE_ID ,AD_USER_ID ,NODE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY FROM AD_TREEBAR WHERE AD_Client_ID = 0 AND AD_TREE_ID<1000000 AND AD_USER_ID<1000000 AND NODE_ID<1000000 ORDER BY AD_TREE_ID ,AD_USER_ID ,NODE_ID',
             'N', 'N', 5600, 456, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50056, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WINDOW_TRL', 'ALL', 'D',
             'SELECT AD_WINDOW_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISTRANSLATED FROM AD_WINDOW_TRL WHERE AD_Client_ID = 0 AND AD_WINDOW_ID<1000000 ORDER BY AD_WINDOW_ID ,AD_LANGUAGE',
             'N', 'N', 5700, 132, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50057, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WORKBENCH_TRL', 'ALL', 'D',
             'SELECT AD_WORKBENCH_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISTRANSLATED FROM AD_WORKBENCH_TRL WHERE AD_Client_ID = 0 AND AD_WORKBENCH_ID<1000000 ORDER BY AD_WORKBENCH_ID ,AD_LANGUAGE',
             'N', 'N', 5800, 470, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50058, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WORKFLOWPROCESSOR', 'ALL', 'D',
             'SELECT AD_WORKFLOWPROCESSOR_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,FREQUENCYTYPE ,FREQUENCY ,DATELASTRUN ,DATENEXTRUN ,SUPERVISOR_ID ,KEEPLOGDAYS ,PROCESSING ,INACTIVITYALERTDAYS ,REMINDDAYS ,ALERTOVERPRIORITY FROM AD_WORKFLOWPROCESSOR WHERE AD_Client_ID = 0 AND AD_WORKFLOWPROCESSOR_ID<1000000 ORDER BY AD_WORKFLOWPROCESSOR_ID',
             'N', 'N', 5900, 697, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50059, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_CONVERSION_RATE', 'ALL', 'D',
             'SELECT C_CONVERSION_RATE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_CURRENCY_ID ,C_CURRENCY_ID_TO ,VALIDFROM ,VALIDTO ,MULTIPLYRATE ,DIVIDERATE ,C_CONVERSIONTYPE_ID FROM C_CONVERSION_RATE WHERE AD_Client_ID = 0 AND C_CONVERSION_RATE_ID<1000000 ORDER BY C_CONVERSION_RATE_ID',
             'N', 'N', 6000, 140, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50060, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_COUNTRY', 'ALL', 'D',
             'SELECT C_COUNTRY_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,COUNTRYCODE ,HASREGION ,REGIONNAME ,EXPRESSIONPHONE ,DISPLAYSEQUENCE ,EXPRESSIONPOSTAL ,HASPOSTAL_ADD ,EXPRESSIONPOSTAL_ADD ,AD_LANGUAGE ,C_CURRENCY_ID ,DISPLAYSEQUENCELOCAL ,ISADDRESSLINESREVERSE ,ISADDRESSLINESLOCALREVERSE ,EXPRESSIONBANKROUTINGNO ,EXPRESSIONBANKACCOUNTNO ,MEDIASIZE FROM C_COUNTRY WHERE AD_Client_ID = 0 AND C_COUNTRY_ID<1000000 ORDER BY C_COUNTRY_ID',
             'N', 'N', 6100, 170, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50061, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_CURRENCY_TRL', 'ALL', 'D',
             'SELECT C_CURRENCY_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISTRANSLATED ,CURSYMBOL ,DESCRIPTION FROM C_CURRENCY_TRL WHERE AD_Client_ID = 0 AND C_CURRENCY_ID<1000000 ORDER BY C_CURRENCY_ID ,AD_LANGUAGE',
             'N', 'N', 6200, 617, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50062, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_UOM_TRL', 'ALL', 'D',
             'SELECT C_UOM_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,UOMSYMBOL ,NAME ,DESCRIPTION ,ISTRANSLATED FROM C_UOM_TRL WHERE AD_Client_ID = 0 AND C_UOM_ID<1000000 ORDER BY C_UOM_ID ,AD_LANGUAGE',
             'N', 'N', 6300, 339, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50063, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_ALERT', 'ALL', 'D',
             'SELECT AD_ALERT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ALERTSUBJECT ,ALERTMESSAGE ,ENFORCECLIENTSECURITY ,ENFORCEROLESECURITY ,AD_ALERTPROCESSOR_ID ,ISVALID FROM AD_ALERT WHERE AD_Client_ID = 0 AND AD_ALERT_ID<1000000 ORDER BY AD_ALERT_ID',
             'N', 'N', 6400, 594, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50064, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_FORM_ACCESS', 'ALL', 'D',
             'SELECT AD_FORM_ID ,AD_ROLE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISREADWRITE FROM AD_FORM_ACCESS WHERE AD_Client_ID = 0 AND AD_ROLE_ID<1000000 AND AD_FORM_ID<1000000 ORDER BY AD_ROLE_ID ,AD_FORM_ID',
             'N', 'N', 6500, 378, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50065, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_IMPFORMAT', 'ALL', 'D',
             'SELECT AD_IMPFORMAT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,AD_TABLE_ID ,FORMATTYPE ,PROCESSING FROM AD_IMPFORMAT WHERE AD_Client_ID = 0 AND AD_IMPFORMAT_ID<1000000 ORDER BY AD_IMPFORMAT_ID',
             'N', 'N', 6600, 381, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50066, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_REF_LIST_TRL', 'ALL', 'D',
             'SELECT AD_REF_LIST_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,ISTRANSLATED FROM AD_REF_LIST_TRL WHERE AD_Client_ID = 0 AND AD_REF_LIST_ID<1000000 ORDER BY AD_REF_LIST_ID ,AD_LANGUAGE',
             'N', 'N', 6700, 136, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50067, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_REPLICATIONTABLE', 'ALL', 'D',
             'SELECT AD_REPLICATIONTABLE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_REPLICATIONSTRATEGY_ID ,AD_TABLE_ID ,REPLICATIONTYPE ,ENTITYTYPE FROM AD_REPLICATIONTABLE WHERE AD_Client_ID = 0 AND AD_REPLICATIONTABLE_ID<1000000 ORDER BY AD_REPLICATIONTABLE_ID',
             'N', 'N', 6800, 601, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50068, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_REPORTVIEW', 'ALL', 'D',
             'SELECT AD_REPORTVIEW_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,AD_TABLE_ID ,WHERECLAUSE ,ORDERBYCLAUSE ,ENTITYTYPE FROM AD_REPORTVIEW WHERE AD_Client_ID = 0 AND AD_REPORTVIEW_ID<1000000 ORDER BY AD_REPORTVIEW_ID',
             'N', 'N', 6900, 361, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50069, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_ROLE_ORGACCESS', 'ALL', 'D',
             'SELECT AD_ROLE_ID ,AD_ORG_ID ,AD_CLIENT_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISREADONLY FROM AD_ROLE_ORGACCESS WHERE AD_Client_ID = 0 AND AD_ROLE_ID<1000000 AND AD_ORG_ID<1000000 ORDER BY AD_ROLE_ID ,AD_ORG_ID',
             'N', 'N', 7000, 422, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50070, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TABLE_TRL', 'ALL', 'D',
             'SELECT AD_TABLE_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,ISTRANSLATED FROM AD_TABLE_TRL WHERE AD_Client_ID = 0 AND AD_TABLE_ID<1000000 ORDER BY AD_TABLE_ID ,AD_LANGUAGE',
             'N', 'N', 7100, 746, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50071, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TASK_ACCESS', 'ALL', 'D',
             'SELECT AD_TASK_ID ,AD_ROLE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISREADWRITE FROM AD_TASK_ACCESS WHERE AD_Client_ID = 0 AND AD_ROLE_ID<1000000 AND AD_TASK_ID<1000000 ORDER BY AD_ROLE_ID ,AD_TASK_ID',
             'N', 'N', 7200, 199, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50072, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_USER_ROLES', 'ALL', 'D',
             'SELECT AD_USER_ID ,AD_ROLE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY FROM AD_USER_ROLES WHERE AD_Client_ID = 0 AND AD_ROLE_ID<1000000 AND AD_USER_ID<1000000 ORDER BY AD_ROLE_ID ,AD_USER_ID',
             'N', 'N', 7300, 157, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50073, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WF_RESPONSIBLE', 'ALL', 'D',
             'SELECT AD_WF_RESPONSIBLE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,RESPONSIBLETYPE ,AD_USER_ID ,AD_ROLE_ID ,ENTITYTYPE FROM AD_WF_RESPONSIBLE WHERE AD_Client_ID = 0 AND AD_WF_RESPONSIBLE_ID<1000000 ORDER BY AD_WF_RESPONSIBLE_ID',
             'N', 'N', 7400, 646, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50074, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WINDOW_ACCESS', 'ALL', 'D',
             'SELECT AD_WINDOW_ID ,AD_ROLE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISREADWRITE FROM AD_WINDOW_ACCESS WHERE AD_Client_ID = 0 AND AD_ROLE_ID<1000000 AND AD_WINDOW_ID<1000000 ORDER BY AD_ROLE_ID ,AD_WINDOW_ID',
             'N', 'N', 7500, 201, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50075, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_COUNTRY_TRL', 'ALL', 'D',
             'SELECT C_COUNTRY_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISTRANSLATED ,NAME ,DESCRIPTION ,REGIONNAME FROM C_COUNTRY_TRL WHERE AD_Client_ID = 0 AND C_COUNTRY_ID<1000000 ORDER BY C_COUNTRY_ID ,AD_LANGUAGE',
             'N', 'N', 7600, 616, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50076, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_REGION', 'ALL', 'D',
             'SELECT C_REGION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,C_COUNTRY_ID ,ISDEFAULT FROM C_REGION WHERE AD_Client_ID = 0 AND C_REGION_ID<1000000 ORDER BY C_REGION_ID',
             'N', 'N', 7700, 164, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50077, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_ALERTRECIPIENT', 'ALL', 'D',
             'SELECT AD_ALERTRECIPIENT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_ALERT_ID ,AD_USER_ID ,AD_ROLE_ID FROM AD_ALERTRECIPIENT WHERE AD_Client_ID = 0 AND AD_ALERTRECIPIENT_ID<1000000 ORDER BY AD_ALERTRECIPIENT_ID',
             'N', 'N', 7800, 592, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50078, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_ALERTRULE', 'ALL', 'D',
             'SELECT AD_ALERTRULE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,AD_ALERT_ID ,SELECTCLAUSE ,FROMCLAUSE ,WHERECLAUSE ,AD_TABLE_ID ,PREPROCESSING ,POSTPROCESSING ,ISVALID ,ERRORMSG ,OTHERCLAUSE FROM AD_ALERTRULE WHERE AD_Client_ID = 0 AND AD_ALERTRULE_ID<1000000 ORDER BY AD_ALERTRULE_ID',
             'N', 'N', 7900, 593, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50079, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PRINTFORMAT', 'ALL', 'D',
             'SELECT AD_PRINTFORMAT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,ISTABLEBASED ,ISFORM ,AD_TABLE_ID ,AD_PRINTPAPER_ID ,AD_PRINTCOLOR_ID ,AD_PRINTFONT_ID ,ISSTANDARDHEADERFOOTER ,HEADERMARGIN ,FOOTERMARGIN ,CREATECOPY ,AD_REPORTVIEW_ID ,AD_PRINTTABLEFORMAT_ID ,PRINTERNAME ,ISDEFAULT ,JASPERPROCESS_ID FROM AD_PRINTFORMAT WHERE AD_Client_ID = 0 AND AD_PRINTFORMAT_ID<1000000 ORDER BY AD_PRINTFORMAT_ID',
             'N', 'N', 8000, 493, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50080, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WORKFLOW', 'ALL', 'D',
             'SELECT AD_WORKFLOW_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ACCESSLEVEL ,AD_WF_NODE_ID ,ENTITYTYPE ,DURATIONUNIT ,AUTHOR ,VERSION ,VALIDFROM ,VALIDTO ,PRIORITY ,LIMIT ,DURATION ,COST ,WORKINGTIME ,WAITINGTIME ,AD_WF_RESPONSIBLE_ID ,PUBLISHSTATUS ,AD_WORKFLOWPROCESSOR_ID ,VALUE ,ISDEFAULT ,AD_TABLE_ID ,VALIDATEWORKFLOW ,WORKFLOWTYPE ,DOCVALUELOGIC ,ISVALID FROM AD_WORKFLOW WHERE AD_Client_ID = 0 AND AD_WORKFLOW_ID<1000000 ORDER BY AD_WORKFLOW_ID',
             'N', 'N', 8100, 117, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50081, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_CITY', 'ALL', 'D',
             'SELECT C_CITY_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,LOCODE ,COORDINATES ,POSTAL ,AREACODE ,C_COUNTRY_ID ,C_REGION_ID FROM C_CITY WHERE AD_Client_ID = 0 AND C_CITY_ID<1000000 ORDER BY C_CITY_ID',
             'N', 'N', 8200, 186, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50082, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PRINTFORM', 'ALL', 'D',
             'SELECT AD_PRINTFORM_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,INVOICE_PRINTFORMAT_ID ,ORDER_PRINTFORMAT_ID ,REMITTANCE_PRINTFORMAT_ID ,SHIPMENT_PRINTFORMAT_ID ,INVOICE_MAILTEXT_ID ,ORDER_MAILTEXT_ID ,REMITTANCE_MAILTEXT_ID ,SHIPMENT_MAILTEXT_ID ,PROJECT_MAILTEXT_ID ,PROJECT_PRINTFORMAT_ID FROM AD_PRINTFORM WHERE AD_Client_ID = 0 AND AD_PRINTFORM_ID<1000000 ORDER BY AD_PRINTFORM_ID',
             'N', 'N', 8300, 454, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50083, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PROCESS', 'ALL', 'D',
             'SELECT AD_PROCESS_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,HELP ,ACCESSLEVEL ,ENTITYTYPE ,PROCEDURENAME ,ISREPORT ,ISDIRECTPRINT ,AD_REPORTVIEW_ID ,CLASSNAME ,STATISTIC_COUNT ,STATISTIC_SECONDS ,AD_PRINTFORMAT_ID ,WORKFLOWVALUE ,AD_WORKFLOW_ID ,ISBETAFUNCTIONALITY ,ISSERVERPROCESS ,SHOWHELP ,JASPERREPORT FROM AD_PROCESS WHERE AD_Client_ID = 0 AND AD_PROCESS_ID<1000000 ORDER BY AD_PROCESS_ID',
             'N', 'N', 8400, 284, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50084, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WORKFLOW_ACCESS', 'ALL', 'D',
             'SELECT AD_WORKFLOW_ID ,AD_ROLE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISREADWRITE FROM AD_WORKFLOW_ACCESS WHERE AD_Client_ID = 0 AND AD_ROLE_ID<1000000 AND AD_WORKFLOW_ID<1000000 ORDER BY AD_ROLE_ID ,AD_WORKFLOW_ID',
             'N', 'N', 8500, 202, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50085, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WORKFLOW_TRL', 'ALL', 'D',
             'SELECT AD_WORKFLOW_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISTRANSLATED FROM AD_WORKFLOW_TRL WHERE AD_Client_ID = 0 AND AD_WORKFLOW_ID<1000000 ORDER BY AD_WORKFLOW_ID ,AD_LANGUAGE',
             'N', 'N', 8600, 133, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50086, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_DOCTYPE', 'ALL', 'D',
             'SELECT C_DOCTYPE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,PRINTNAME ,DESCRIPTION ,DOCBASETYPE ,ISSOTRX ,DOCSUBTYPESO ,HASPROFORMA ,C_DOCTYPEPROFORMA_ID ,C_DOCTYPESHIPMENT_ID ,C_DOCTYPEINVOICE_ID ,ISDOCNOCONTROLLED ,DOCNOSEQUENCE_ID ,GL_CATEGORY_ID ,HASCHARGES ,DOCUMENTNOTE ,ISDEFAULT ,DOCUMENTCOPIES ,AD_PRINTFORMAT_ID ,ISDEFAULTCOUNTERDOC ,ISSHIPCONFIRM ,ISPICKQACONFIRM ,ISINTRANSIT ,ISSPLITWHENDIFFERENCE ,C_DOCTYPEDIFFERENCE_ID ,ISCREATECOUNTER ,ISINDEXED FROM C_DOCTYPE WHERE AD_Client_ID = 0 AND C_DOCTYPE_ID<1000000 ORDER BY C_DOCTYPE_ID',
             'N', 'N', 8700, 217, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50087, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_LOCATION', 'ALL', 'D',
             'SELECT C_LOCATION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ADDRESS1 ,ADDRESS2 ,CITY ,POSTAL ,POSTAL_ADD ,C_COUNTRY_ID ,C_REGION_ID ,C_CITY_ID ,REGIONNAME ,ADDRESS3 ,ADDRESS4 FROM C_LOCATION WHERE AD_Client_ID = 0 AND C_LOCATION_ID<1000000 ORDER BY C_LOCATION_ID',
             'N', 'N', 8800, 162, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50088, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_COLUMN', 'ALL', 'D',
             'SELECT AD_COLUMN_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,UPDATED ,CREATEDBY ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,VERSION ,ENTITYTYPE ,COLUMNNAME ,AD_TABLE_ID ,AD_REFERENCE_ID ,AD_REFERENCE_VALUE_ID ,AD_VAL_RULE_ID ,FIELDLENGTH ,DEFAULTVALUE ,ISKEY ,ISPARENT ,ISMANDATORY ,ISUPDATEABLE ,READONLYLOGIC ,ISIDENTIFIER ,SEQNO ,ISTRANSLATED ,ISENCRYPTED ,CALLOUT ,VFORMAT ,VALUEMIN ,VALUEMAX ,ISSELECTIONCOLUMN ,AD_ELEMENT_ID ,AD_PROCESS_ID ,ISSYNCDATABASE ,ISALWAYSUPDATEABLE ,COLUMNSQL FROM AD_COLUMN WHERE AD_Client_ID = 0 AND AD_COLUMN_ID<1000000 ORDER BY AD_COLUMN_ID',
             'N', 'N', 8900, 101, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50089, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_MENU', 'ALL', 'D',
             'SELECT AD_MENU_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,NAME ,UPDATEDBY ,DESCRIPTION ,ISSUMMARY ,ISSOTRX ,ISREADONLY ,ACTION ,AD_WINDOW_ID ,AD_WORKFLOW_ID ,AD_TASK_ID ,AD_PROCESS_ID ,AD_FORM_ID ,AD_WORKBENCH_ID ,ENTITYTYPE FROM AD_MENU WHERE AD_Client_ID = 0 AND AD_MENU_ID<1000000 ORDER BY AD_MENU_ID',
             'N', 'N', 9000, 116, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50090, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_ORGINFO', 'ALL', 'D',
             'SELECT AD_ORG_ID ,AD_CLIENT_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_LOCATION_ID ,DUNS ,TAXID ,PA_GOAL_ID ,SUPERVISOR_ID ,PARENT_ORG_ID ,AD_ORGTYPE_ID ,M_WAREHOUSE_ID FROM AD_ORGINFO WHERE AD_Client_ID = 0 AND AD_ORG_ID<1000000 ORDER BY AD_ORG_ID',
             'N', 'N', 9100, 228, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50091, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PROCESS_ACCESS', 'ALL', 'D',
             'SELECT AD_PROCESS_ID ,AD_ROLE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISREADWRITE FROM AD_PROCESS_ACCESS WHERE AD_Client_ID = 0 AND AD_ROLE_ID<1000000 AND AD_PROCESS_ID<1000000 ORDER BY AD_ROLE_ID ,AD_PROCESS_ID',
             'N', 'N', 9200, 197, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50092, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PROCESS_PARA', 'ALL', 'D',
             'SELECT AD_PROCESS_PARA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,AD_PROCESS_ID ,SEQNO ,AD_REFERENCE_ID ,AD_REFERENCE_VALUE_ID ,AD_VAL_RULE_ID ,COLUMNNAME ,ISCENTRALLYMAINTAINED ,FIELDLENGTH ,ISMANDATORY ,ISRANGE ,DEFAULTVALUE ,DEFAULTVALUE2 ,VFORMAT ,VALUEMIN ,VALUEMAX ,AD_ELEMENT_ID ,ENTITYTYPE FROM AD_PROCESS_PARA WHERE AD_Client_ID = 0 AND AD_PROCESS_PARA_ID<1000000 ORDER BY AD_PROCESS_PARA_ID',
             'N', 'N', 9300, 285, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50093, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PROCESS_TRL', 'ALL', 'D',
             'SELECT AD_PROCESS_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISTRANSLATED FROM AD_PROCESS_TRL WHERE AD_Client_ID = 0 AND AD_PROCESS_ID<1000000 ORDER BY AD_PROCESS_ID ,AD_LANGUAGE',
             'N', 'N', 9400, 287, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50094, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_SCHEDULER', 'ALL', 'D',
             'SELECT AD_SCHEDULER_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,AD_PROCESS_ID ,FREQUENCYTYPE ,FREQUENCY ,DATELASTRUN ,DATENEXTRUN ,SUPERVISOR_ID ,KEEPLOGDAYS ,PROCESSING ,WEEKDAY ,SCHEDULETYPE ,MONTHDAY FROM AD_SCHEDULER WHERE AD_Client_ID = 0 AND AD_SCHEDULER_ID<1000000 ORDER BY AD_SCHEDULER_ID',
             'N', 'N', 9500, 688, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50095, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WF_NODE', 'ALL', 'D',
             'SELECT AD_WF_NODE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,AD_WORKFLOW_ID ,ISCENTRALLYMAINTAINED ,ACTION ,AD_WINDOW_ID ,WORKFLOW_ID ,AD_TASK_ID ,AD_PROCESS_ID ,AD_FORM_ID ,ENTITYTYPE ,XPOSITION ,YPOSITION ,AD_WF_BLOCK_ID ,SUBFLOWEXECUTION ,STARTMODE ,FINISHMODE ,LIMIT ,PRIORITY ,DURATION ,COST ,WORKINGTIME ,WAITINGTIME ,AD_WF_RESPONSIBLE_ID ,AD_IMAGE_ID ,JOINELEMENT ,SPLITELEMENT ,WAITTIME ,AD_COLUMN_ID ,ATTRIBUTENAME ,ATTRIBUTEVALUE ,DOCACTION ,VALUE ,DYNPRIORITYUNIT ,DYNPRIORITYCHANGE ,EMAILRECIPIENT ,EMAIL ,R_MAILTEXT_ID FROM AD_WF_NODE WHERE AD_Client_ID = 0 AND AD_WF_NODE_ID<1000000 ORDER BY AD_WF_NODE_ID',
             'N', 'N', 9600, 129, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50096, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WORKBENCHWINDOW', 'ALL', 'D',
             'SELECT AD_WORKBENCHWINDOW_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_WORKBENCH_ID ,SEQNO ,ISPRIMARY ,AD_WINDOW_ID ,AD_FORM_ID ,AD_PROCESS_ID ,AD_TASK_ID ,ENTITYTYPE FROM AD_WORKBENCHWINDOW WHERE AD_Client_ID = 0 AND AD_WORKBENCHWINDOW_ID<1000000 ORDER BY AD_WORKBENCHWINDOW_ID',
             'N', 'N', 9700, 469, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50097, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_DOCTYPE_TRL', 'ALL', 'D',
             'SELECT C_DOCTYPE_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,PRINTNAME ,DOCUMENTNOTE ,ISTRANSLATED FROM C_DOCTYPE_TRL WHERE AD_Client_ID = 0 AND C_DOCTYPE_ID<1000000 ORDER BY C_DOCTYPE_ID ,AD_LANGUAGE',
             'N', 'N', 9800, 300, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50098, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'PA_REPORTCOLUMN', 'ALL', 'D',
             'SELECT PA_REPORTCOLUMN_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,PA_REPORTCOLUMNSET_ID ,NAME ,SEQNO ,DESCRIPTION ,ISPRINTED ,POSTINGTYPE ,GL_BUDGET_ID ,COLUMNTYPE ,RELATIVEPERIOD ,CURRENCYTYPE ,CALCULATIONTYPE ,AMOUNTTYPE ,C_CURRENCY_ID ,ISADHOCCONVERSION ,OPER_1_ID ,OPER_2_ID ,ELEMENTTYPE ,ORG_ID ,C_ELEMENTVALUE_ID ,C_PROJECT_ID ,C_BPARTNER_ID ,M_PRODUCT_ID ,C_CAMPAIGN_ID ,C_LOCATION_ID ,C_SALESREGION_ID ,C_ACTIVITY_ID FROM PA_REPORTCOLUMN WHERE AD_Client_ID = 0 AND PA_REPORTCOLUMN_ID<1000000 ORDER BY PA_REPORTCOLUMN_ID',
             'N', 'N', 9900, 446, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50099, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_COLUMN_TRL', 'ALL', 'D',
             'SELECT AD_COLUMN_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,ISTRANSLATED FROM AD_COLUMN_TRL WHERE AD_Client_ID = 0 AND AD_COLUMN_ID<1000000 ORDER BY AD_COLUMN_ID ,AD_LANGUAGE',
             'N', 'N', 10000, 752, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50100, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_IMPFORMAT_ROW', 'ALL', 'D',
             'SELECT AD_IMPFORMAT_ROW_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_IMPFORMAT_ID ,SEQNO ,NAME ,AD_COLUMN_ID ,STARTNO ,ENDNO ,DATATYPE ,DATAFORMAT ,DECIMALPOINT ,DIVIDEBY100 ,CONSTANTVALUE ,CALLOUT ,SCRIPT FROM AD_IMPFORMAT_ROW WHERE AD_Client_ID = 0 AND AD_IMPFORMAT_ROW_ID<1000000 ORDER BY AD_IMPFORMAT_ROW_ID',
             'N', 'N', 10100, 382, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50101, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_MENU_TRL', 'ALL', 'D',
             'SELECT AD_MENU_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,ISTRANSLATED FROM AD_MENU_TRL WHERE AD_Client_ID = 0 AND AD_MENU_ID<1000000 ORDER BY AD_MENU_ID ,AD_LANGUAGE',
             'N', 'N', 10200, 120, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50102, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PRINTFORMATITEM', 'ALL', 'D',
             'SELECT AD_PRINTFORMATITEM_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_PRINTFORMAT_ID ,NAME ,PRINTNAME ,ISPRINTED ,PRINTAREATYPE ,SEQNO ,PRINTFORMATTYPE ,AD_COLUMN_ID ,AD_PRINTFORMATCHILD_ID ,ISRELATIVEPOSITION ,ISNEXTLINE ,XSPACE ,YSPACE ,XPOSITION ,YPOSITION ,MAXWIDTH ,ISHEIGHTONELINE ,MAXHEIGHT ,FIELDALIGNMENTTYPE ,LINEALIGNMENTTYPE ,AD_PRINTCOLOR_ID ,AD_PRINTFONT_ID ,ISORDERBY ,SORTNO ,ISGROUPBY ,ISPAGEBREAK ,ISSUMMARIZED ,IMAGEISATTACHED ,IMAGEURL ,ISAVERAGED ,ISCOUNTED ,ISSETNLPOSITION ,ISSUPPRESSNULL ,BELOWCOLUMN ,AD_PRINTGRAPH_ID ,ISFIXEDWIDTH ,ISNEXTPAGE ,PRINTNAMESUFFIX ,ISMINCALC ,ISMAXCALC ,ISRUNNINGTOTAL ,RUNNINGTOTALLINES ,ISVARIANCECALC ,ISDEVIATIONCALC ,ISFILLEDRECTANGLE ,LINEWIDTH ,ARCDIAMETER ,SHAPETYPE ,ISCENTRALLYMAINTAINED ,ISIMAGEFIELD ,BARCODETYPE FROM AD_PRINTFORMATITEM WHERE AD_Client_ID = 0 AND AD_PRINTFORMATITEM_ID<1000000 ORDER BY AD_PRINTFORMATITEM_ID',
             'N', 'N', 10300, 489, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50103, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PROCESS_PARA_TRL', 'ALL', 'D',
             'SELECT AD_PROCESS_PARA_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISTRANSLATED FROM AD_PROCESS_PARA_TRL WHERE AD_Client_ID = 0 AND AD_PROCESS_PARA_ID<1000000 ORDER BY AD_PROCESS_PARA_ID ,AD_LANGUAGE',
             'N', 'N', 10400, 286, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50104, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_REF_TABLE', 'ALL', 'D',
             'SELECT AD_REFERENCE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_TABLE_ID ,AD_KEY ,AD_DISPLAY ,ISVALUEDISPLAYED ,WHERECLAUSE ,ORDERBYCLAUSE ,ENTITYTYPE FROM AD_REF_TABLE WHERE AD_Client_ID = 0 AND AD_REFERENCE_ID<1000000 ORDER BY AD_REFERENCE_ID',
             'N', 'N', 10500, 103, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50105, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_SCHEDULER_PARA', 'ALL', 'D',
             'SELECT AD_SCHEDULER_ID ,AD_PROCESS_PARA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,PARAMETERDEFAULT ,DESCRIPTION FROM AD_SCHEDULER_PARA WHERE AD_Client_ID = 0 AND AD_SCHEDULER_ID<1000000 AND AD_PROCESS_PARA_ID<1000000 ORDER BY AD_SCHEDULER_ID ,AD_PROCESS_PARA_ID',
             'N', 'N', 10600, 698, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50106, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TAB', 'ALL', 'D',
             'SELECT AD_TAB_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,AD_TABLE_ID ,AD_WINDOW_ID ,SEQNO ,TABLEVEL ,ISSINGLEROW ,ISINFOTAB ,ISTRANSLATIONTAB ,ISREADONLY ,AD_COLUMN_ID ,HASTREE ,WHERECLAUSE ,ORDERBYCLAUSE ,COMMITWARNING ,AD_PROCESS_ID ,PROCESSING ,AD_IMAGE_ID ,IMPORTFIELDS ,AD_COLUMNSORTORDER_ID ,AD_COLUMNSORTYESNO_ID ,ISSORTTAB ,ENTITYTYPE ,INCLUDED_TAB_ID ,READONLYLOGIC ,DISPLAYLOGIC ,ISINSERTRECORD ,ISADVANCEDTAB FROM AD_TAB WHERE AD_Client_ID = 0 AND AD_TAB_ID<1000000 ORDER BY AD_TAB_ID',
             'N', 'N', 10700, 106, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50107, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WF_NODE_TRL', 'ALL', 'D',
             'SELECT AD_LANGUAGE ,AD_WF_NODE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISTRANSLATED FROM AD_WF_NODE_TRL WHERE AD_Client_ID = 0 AND AD_WF_NODE_ID<1000000 ORDER BY AD_WF_NODE_ID ,AD_LANGUAGE',
             'N', 'N', 10800, 130, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50108, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WF_NODENEXT', 'ALL', 'D',
             'SELECT AD_WF_NODENEXT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_WF_NODE_ID ,AD_WF_NEXT_ID ,DESCRIPTION ,SEQNO ,ENTITYTYPE ,TRANSITIONCODE ,ISSTDUSERWORKFLOW FROM AD_WF_NODENEXT WHERE AD_Client_ID = 0 AND AD_WF_NODENEXT_ID<1000000 ORDER BY AD_WF_NODENEXT_ID',
             'N', 'N', 10900, 131, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50109, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_FIELD', 'ALL', 'D',
             'SELECT AD_FIELD_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISCENTRALLYMAINTAINED ,AD_TAB_ID ,AD_COLUMN_ID ,AD_FIELDGROUP_ID ,ISDISPLAYED ,DISPLAYLOGIC ,DISPLAYLENGTH ,ISREADONLY ,SEQNO ,SORTNO ,ISSAMELINE ,ISHEADING ,ISFIELDONLY ,ISENCRYPTED ,ENTITYTYPE ,OBSCURETYPE ,AD_REFERENCE_ID ,ISMANDATORY FROM AD_FIELD WHERE AD_Client_ID = 0 AND AD_FIELD_ID<1000000 ORDER BY AD_FIELD_ID',
             'N', 'N', 11000, 107, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50110, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PRINTFORMATITEM_TRL', 'ALL', 'D',
             'SELECT AD_PRINTFORMATITEM_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,PRINTNAME ,ISTRANSLATED ,PRINTNAMESUFFIX FROM AD_PRINTFORMATITEM_TRL WHERE AD_Client_ID = 0 AND AD_PRINTFORMATITEM_ID<1000000 ORDER BY AD_PRINTFORMATITEM_ID ,AD_LANGUAGE',
             'N', 'N', 11100, 522, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50111, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TAB_TRL', 'ALL', 'D',
             'SELECT AD_TAB_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,COMMITWARNING ,ISTRANSLATED FROM AD_TAB_TRL WHERE AD_Client_ID = 0 AND AD_TAB_ID<1000000 ORDER BY AD_TAB_ID ,AD_LANGUAGE',
             'N', 'N', 11200, 123, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50112, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_FIELD_TRL', 'ALL', 'D',
             'SELECT AD_FIELD_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISTRANSLATED FROM AD_FIELD_TRL WHERE AD_Client_ID = 0 AND AD_FIELD_ID<1000000 ORDER BY AD_FIELD_ID ,AD_LANGUAGE',
             'N', 'N', 11300, 127, 50000
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50113, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'A_ASSET_GROUP', 'ALL', 'D',
             'SELECT A_ASSET_GROUP_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISOWNED ,ISDEPRECIATED ,ISONEASSETPERUOM ,ISCREATEASACTIVE ,ISTRACKISSUES FROM A_ASSET_GROUP WHERE AD_Client_ID = 11 AND A_ASSET_GROUP_ID<1000000 ORDER BY A_ASSET_GROUP_ID',
             'N', 'N', 100, 542, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50114, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_ATTACHMENT', 'ALL', 'D',
             'SELECT AD_ATTACHMENT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_TABLE_ID ,RECORD_ID ,TITLE ,BINARYDATA ,TEXTMSG FROM AD_ATTACHMENT WHERE AD_Client_ID = 11 AND AD_ATTACHMENT_ID<1000000 ORDER BY AD_ATTACHMENT_ID',
             'N', 'N', 200, 254, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50115, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_CLIENT', 'ALL', 'D',
             'SELECT AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,SMTPHOST ,REQUESTEMAIL ,REQUESTUSER ,REQUESTUSERPW ,REQUESTFOLDER ,AD_LANGUAGE ,ISMULTILINGUALDOCUMENT ,ISSMTPAUTHORIZATION ,ISUSEBETAFUNCTIONS ,LDAPQUERY ,MODELVALIDATIONCLASSES ,AUTOARCHIVE ,MMPOLICY ,EMAILTEST ,ISSERVEREMAIL ,DOCUMENTDIR ,ISPOSTIMMEDIATE ,ISCOSTIMMEDIATE ,STOREATTACHMENTSONFILESYSTEM ,WINDOWSATTACHMENTPATH ,UNIXATTACHMENTPATH FROM AD_CLIENT WHERE AD_Client_ID = 11 AND AD_CLIENT_ID<1000000 ORDER BY AD_CLIENT_ID',
             'N', 'N', 300, 112, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50116, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_IMAGE', 'ALL', 'D',
             'SELECT AD_IMAGE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,IMAGEURL ,BINARYDATA ,ENTITYTYPE ,DESCRIPTION FROM AD_IMAGE WHERE AD_Client_ID = 11 AND AD_IMAGE_ID<1000000 ORDER BY AD_IMAGE_ID',
             'N', 'N', 400, 461, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50117, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_IMPFORMAT', 'ALL', 'D',
             'SELECT AD_IMPFORMAT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,AD_TABLE_ID ,FORMATTYPE ,PROCESSING FROM AD_IMPFORMAT WHERE AD_Client_ID = 11 AND AD_IMPFORMAT_ID<1000000 ORDER BY AD_IMPFORMAT_ID',
             'N', 'N', 500, 381, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50118, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_ORGTYPE', 'ALL', 'D',
             'SELECT AD_ORGTYPE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,AD_PRINTCOLOR_ID FROM AD_ORGTYPE WHERE AD_Client_ID = 11 AND AD_ORGTYPE_ID<1000000 ORDER BY AD_ORGTYPE_ID',
             'N', 'N', 600, 689, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50119, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PRINTFORMAT', 'ALL', 'D',
             'SELECT AD_PRINTFORMAT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,ISTABLEBASED ,ISFORM ,AD_TABLE_ID ,AD_PRINTPAPER_ID ,AD_PRINTCOLOR_ID ,AD_PRINTFONT_ID ,ISSTANDARDHEADERFOOTER ,HEADERMARGIN ,FOOTERMARGIN ,CREATECOPY ,AD_REPORTVIEW_ID ,AD_PRINTTABLEFORMAT_ID ,PRINTERNAME ,ISDEFAULT ,JASPERPROCESS_ID FROM AD_PRINTFORMAT WHERE AD_Client_ID = 11 AND AD_PRINTFORMAT_ID<1000000 ORDER BY AD_PRINTFORMAT_ID',
             'N', 'N', 700, 493, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50120, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_REPLICATION', 'ALL', 'D',
             'SELECT AD_REPLICATION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,HOSTADDRESS ,HOSTPORT ,AD_REPLICATIONSTRATEGY_ID ,ISRMIOVERHTTP ,PROCESSING ,IDRANGESTART ,IDRANGEEND ,REMOTE_CLIENT_ID ,REMOTE_ORG_ID ,PREFIX ,SUFFIX ,DATELASTRUN FROM AD_REPLICATION WHERE AD_Client_ID = 11 AND AD_REPLICATION_ID<1000000 ORDER BY AD_REPLICATION_ID',
             'N', 'N', 800, 605, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50121, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_SESSION', 'ALL', 'D',
             'SELECT AD_SESSION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,WEBSESSION ,REMOTE_ADDR ,REMOTE_HOST ,PROCESSED FROM AD_SESSION WHERE AD_Client_ID = 11 AND AD_SESSION_ID<1000000 ORDER BY AD_SESSION_ID',
             'N', 'N', 900, 566, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50122, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TREE', 'ALL', 'D',
             'SELECT AD_TREE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISACTIVE ,NAME ,DESCRIPTION ,TREETYPE ,ISALLNODES ,PROCESSING ,ISDEFAULT FROM AD_TREE WHERE AD_Client_ID = 11 AND AD_TREE_ID<1000000 ORDER BY AD_TREE_ID',
             'N', 'N', 1000, 288, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50123, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_ALLOCATIONHDR', 'ALL', 'D',
             'SELECT C_ALLOCATIONHDR_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,DOCUMENTNO ,DESCRIPTION ,DATETRX ,DATEACCT ,C_CURRENCY_ID ,APPROVALAMT ,ISMANUAL ,DOCSTATUS ,DOCACTION ,ISAPPROVED ,PROCESSING ,PROCESSED ,POSTED FROM C_ALLOCATIONHDR WHERE AD_Client_ID = 11 AND C_ALLOCATIONHDR_ID<1000000 ORDER BY C_ALLOCATIONHDR_ID',
             'N', 'N', 1100, 735, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50124, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_CASHBOOK', 'ALL', 'D',
             'SELECT C_CASHBOOK_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,ISDEFAULT ,C_CURRENCY_ID FROM C_CASHBOOK WHERE AD_Client_ID = 11 AND C_CASHBOOK_ID<1000000 ORDER BY C_CASHBOOK_ID',
             'N', 'N', 1200, 408, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50125, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_CHANNEL', 'ALL', 'D',
             'SELECT C_CHANNEL_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,AD_PRINTCOLOR_ID FROM C_CHANNEL WHERE AD_Client_ID = 11 AND C_CHANNEL_ID<1000000 ORDER BY C_CHANNEL_ID',
             'N', 'N', 1300, 275, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50126, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_CYCLE', 'ALL', 'D',
             'SELECT C_CYCLE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,C_CURRENCY_ID FROM C_CYCLE WHERE AD_Client_ID = 11 AND C_CYCLE_ID<1000000 ORDER BY C_CYCLE_ID',
             'N', 'N', 1400, 432, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50127, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_DUNNING', 'ALL', 'D',
             'SELECT C_DUNNING_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,SENDDUNNINGLETTER ,ISDEFAULT ,CREATELEVELSSEQUENTIALLY FROM C_DUNNING WHERE AD_Client_ID = 11 AND C_DUNNING_ID<1000000 ORDER BY C_DUNNING_ID',
             'N', 'N', 1500, 301, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50128, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_GREETING', 'ALL', 'D',
             'SELECT C_GREETING_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,GREETING ,ISFIRSTNAMEONLY ,ISDEFAULT FROM C_GREETING WHERE AD_Client_ID = 11 AND C_GREETING_ID<1000000 ORDER BY C_GREETING_ID',
             'N', 'N', 1600, 346, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50129, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_INVOICESCHEDULE', 'ALL', 'D',
             'SELECT C_INVOICESCHEDULE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,ISAMOUNT ,AMT ,INVOICEFREQUENCY ,INVOICEWEEKDAY ,INVOICEWEEKDAYCUTOFF ,EVENINVOICEWEEK ,INVOICEDAY ,INVOICEDAYCUTOFF ,ISDEFAULT FROM C_INVOICESCHEDULE WHERE AD_Client_ID = 11 AND C_INVOICESCHEDULE_ID<1000000 ORDER BY C_INVOICESCHEDULE_ID',
             'N', 'N', 1700, 257, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50130, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_JOBCATEGORY', 'ALL', 'D',
             'SELECT C_JOBCATEGORY_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP FROM C_JOBCATEGORY WHERE AD_Client_ID = 11 AND C_JOBCATEGORY_ID<1000000 ORDER BY C_JOBCATEGORY_ID',
             'N', 'N', 1800, 790, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50131, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_PAYMENTTERM', 'ALL', 'D',
             'SELECT C_PAYMENTTERM_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,DOCUMENTNOTE ,AFTERDELIVERY ,ISDUEFIXED ,NETDAYS ,GRACEDAYS ,FIXMONTHCUTOFF ,FIXMONTHDAY ,FIXMONTHOFFSET ,DISCOUNTDAYS ,DISCOUNT ,DISCOUNTDAYS2 ,DISCOUNT2 ,ISNEXTBUSINESSDAY ,ISDEFAULT ,VALUE ,NETDAY ,ISVALID ,PROCESSING FROM C_PAYMENTTERM WHERE AD_Client_ID = 11 AND C_PAYMENTTERM_ID<1000000 ORDER BY C_PAYMENTTERM_ID',
             'N', 'N', 1900, 113, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50132, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_POSKEYLAYOUT', 'ALL', 'D',
             'SELECT C_POSKEYLAYOUT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP FROM C_POSKEYLAYOUT WHERE AD_Client_ID = 11 AND C_POSKEYLAYOUT_ID<1000000 ORDER BY C_POSKEYLAYOUT_ID',
             'N', 'N', 2000, 749, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50133, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_PROJECTTYPE', 'ALL', 'D',
             'SELECT C_PROJECTTYPE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,PROJECTCATEGORY FROM C_PROJECTTYPE WHERE AD_Client_ID = 11 AND C_PROJECTTYPE_ID<1000000 ORDER BY C_PROJECTTYPE_ID',
             'N', 'N', 2100, 575, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50134, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_REVENUERECOGNITION', 'ALL', 'D',
             'SELECT C_REVENUERECOGNITION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,ISTIMEBASED ,RECOGNITIONFREQUENCY ,NOMONTHS FROM C_REVENUERECOGNITION WHERE AD_Client_ID = 11 AND C_REVENUERECOGNITION_ID<1000000 ORDER BY C_REVENUERECOGNITION_ID',
             'N', 'N', 2200, 336, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50135, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_SALESREGION', 'ALL', 'D',
             'SELECT C_SALESREGION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,ISSUMMARY ,SALESREP_ID ,ISDEFAULT FROM C_SALESREGION WHERE AD_Client_ID = 11 AND C_SALESREGION_ID<1000000 ORDER BY C_SALESREGION_ID',
             'N', 'N', 2300, 230, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50136, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_TAXCATEGORY', 'ALL', 'D',
             'SELECT C_TAXCATEGORY_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,COMMODITYCODE ,ISDEFAULT FROM C_TAXCATEGORY WHERE AD_Client_ID = 11 AND C_TAXCATEGORY_ID<1000000 ORDER BY C_TAXCATEGORY_ID',
             'N', 'N', 2400, 252, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50137, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'GL_BUDGET', 'ALL', 'D',
             'SELECT GL_BUDGET_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,ISPRIMARY ,BUDGETSTATUS FROM GL_BUDGET WHERE AD_Client_ID = 11 AND GL_BUDGET_ID<1000000 ORDER BY GL_BUDGET_ID',
             'N', 'N', 2500, 271, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50138, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'GL_CATEGORY', 'ALL', 'D',
             'SELECT GL_CATEGORY_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,CATEGORYTYPE ,ISDEFAULT ,DOCBASETYPE FROM GL_CATEGORY WHERE AD_Client_ID = 11 AND GL_CATEGORY_ID<1000000 ORDER BY GL_CATEGORY_ID',
             'N', 'N', 2600, 218, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50139, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'K_CATEGORY', 'ALL', 'D',
             'SELECT K_CATEGORY_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP FROM K_CATEGORY WHERE AD_Client_ID = 11 AND K_CATEGORY_ID<1000000 ORDER BY K_CATEGORY_ID',
             'N', 'N', 2700, 615, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50140, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'K_SOURCE', 'ALL', 'D',
             'SELECT K_SOURCE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTIONURL FROM K_SOURCE WHERE AD_Client_ID = 11 AND K_SOURCE_ID<1000000 ORDER BY K_SOURCE_ID',
             'N', 'N', 2800, 609, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50141, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'K_TYPE', 'ALL', 'D',
             'SELECT K_TYPE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISPUBLIC ,ISPUBLICWRITE FROM K_TYPE WHERE AD_Client_ID = 11 AND K_TYPE_ID<1000000 ORDER BY K_TYPE_ID',
             'N', 'N', 2900, 606, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50142, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_ATTRIBUTESEARCH', 'ALL', 'D',
             'SELECT M_ATTRIBUTESEARCH_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION FROM M_ATTRIBUTESEARCH WHERE AD_Client_ID = 11 AND M_ATTRIBUTESEARCH_ID<1000000 ORDER BY M_ATTRIBUTESEARCH_ID',
             'N', 'N', 3000, 564, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50143, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_CHANGENOTICE', 'ALL', 'D',
             'SELECT M_CHANGENOTICE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,DETAILINFO ,PROCESSING ,PROCESSED ,ISAPPROVED FROM M_CHANGENOTICE WHERE AD_Client_ID = 11 AND M_CHANGENOTICE_ID<1000000 ORDER BY M_CHANGENOTICE_ID',
             'N', 'N', 3100, 799, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50144, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_COSTELEMENT', 'ALL', 'D',
             'SELECT M_COSTELEMENT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,COSTELEMENTTYPE ,COSTINGMETHOD ,ISCALCULATED FROM M_COSTELEMENT WHERE AD_Client_ID = 11 AND M_COSTELEMENT_ID<1000000 ORDER BY M_COSTELEMENT_ID',
             'N', 'N', 3200, 770, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50145, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_COSTTYPE', 'ALL', 'D',
             'SELECT M_COSTTYPE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP FROM M_COSTTYPE WHERE AD_Client_ID = 11 AND M_COSTTYPE_ID<1000000 ORDER BY M_COSTTYPE_ID',
             'N', 'N', 3300, 586, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50146, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_DISCOUNTSCHEMA', 'ALL', 'D',
             'SELECT M_DISCOUNTSCHEMA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,VALIDFROM ,DISCOUNTTYPE ,SCRIPT ,FLATDISCOUNT ,ISQUANTITYBASED ,CUMULATIVELEVEL ,PROCESSING ,ISBPARTNERFLATDISCOUNT FROM M_DISCOUNTSCHEMA WHERE AD_Client_ID = 11 AND M_DISCOUNTSCHEMA_ID<1000000 ORDER BY M_DISCOUNTSCHEMA_ID',
             'N', 'N', 3400, 475, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50147, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_DISTRIBUTIONLIST', 'ALL', 'D',
             'SELECT M_DISTRIBUTIONLIST_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,RATIOTOTAL ,PROCESSING FROM M_DISTRIBUTIONLIST WHERE AD_Client_ID = 11 AND M_DISTRIBUTIONLIST_ID<1000000 ORDER BY M_DISTRIBUTIONLIST_ID',
             'N', 'N', 3500, 666, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50148, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_FREIGHTCATEGORY', 'ALL', 'D',
             'SELECT M_FREIGHTCATEGORY_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,HELP FROM M_FREIGHTCATEGORY WHERE AD_Client_ID = 11 AND M_FREIGHTCATEGORY_ID<1000000 ORDER BY M_FREIGHTCATEGORY_ID',
             'N', 'N', 3600, 595, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50149, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_LOTCTL', 'ALL', 'D',
             'SELECT M_LOTCTL_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,STARTNO ,INCREMENTNO ,CURRENTNEXT ,PREFIX ,SUFFIX FROM M_LOTCTL WHERE AD_Client_ID = 11 AND M_LOTCTL_ID<1000000 ORDER BY M_LOTCTL_ID',
             'N', 'N', 3700, 556, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50150, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_PRICELIST', 'ALL', 'D',
             'SELECT M_PRICELIST_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,BASEPRICELIST_ID ,ISTAXINCLUDED ,ISSOPRICELIST ,ISDEFAULT ,C_CURRENCY_ID ,ENFORCEPRICELIMIT ,PRICEPRECISION FROM M_PRICELIST WHERE AD_Client_ID = 11 AND M_PRICELIST_ID<1000000 ORDER BY M_PRICELIST_ID',
             'N', 'N', 3800, 255, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50151, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_RMATYPE', 'ALL', 'D',
             'SELECT M_RMATYPE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP FROM M_RMATYPE WHERE AD_Client_ID = 11 AND M_RMATYPE_ID<1000000 ORDER BY M_RMATYPE_ID',
             'N', 'N', 3900, 729, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50152, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_SERNOCTL', 'ALL', 'D',
             'SELECT M_SERNOCTL_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,UPDATEDBY ,NAME ,DESCRIPTION ,STARTNO ,INCREMENTNO ,CURRENTNEXT ,PREFIX ,SUFFIX ,CREATEDBY ,UPDATED FROM M_SERNOCTL WHERE AD_Client_ID = 11 AND M_SERNOCTL_ID<1000000 ORDER BY M_SERNOCTL_ID',
             'N', 'N', 4000, 555, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50153, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'PA_REPORTCOLUMNSET', 'ALL', 'D',
             'SELECT PA_REPORTCOLUMNSET_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,PROCESSING FROM PA_REPORTCOLUMNSET WHERE AD_Client_ID = 11 AND PA_REPORTCOLUMNSET_ID<1000000 ORDER BY PA_REPORTCOLUMNSET_ID',
             'N', 'N', 4100, 447, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50154, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'PA_REPORTLINESET', 'ALL', 'D',
             'SELECT PA_REPORTLINESET_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,PROCESSING FROM PA_REPORTLINESET WHERE AD_Client_ID = 11 AND PA_REPORTLINESET_ID<1000000 ORDER BY PA_REPORTLINESET_ID',
             'N', 'N', 4200, 449, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50155, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'PA_SLA_CRITERIA', 'ALL', 'D',
             'SELECT PA_SLA_CRITERIA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISMANUAL ,CLASSNAME FROM PA_SLA_CRITERIA WHERE AD_Client_ID = 11 AND PA_SLA_CRITERIA_ID<1000000 ORDER BY PA_SLA_CRITERIA_ID',
             'N', 'N', 4300, 744, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50156, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_CATEGORY', 'ALL', 'D',
             'SELECT R_CATEGORY_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,M_PRODUCT_ID FROM R_CATEGORY WHERE AD_Client_ID = 11 AND R_CATEGORY_ID<1000000 ORDER BY R_CATEGORY_ID',
             'N', 'N', 4400, 772, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50157, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_GROUP', 'ALL', 'D',
             'SELECT R_GROUP_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,M_BOM_ID ,M_CHANGENOTICE_ID FROM R_GROUP WHERE AD_Client_ID = 11 AND R_GROUP_ID<1000000 ORDER BY R_GROUP_ID',
             'N', 'N', 4500, 773, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50158, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_INTERESTAREA', 'ALL', 'D',
             'SELECT R_INTERESTAREA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,ISSELFSERVICE ,VALUE FROM R_INTERESTAREA WHERE AD_Client_ID = 11 AND R_INTERESTAREA_ID<1000000 ORDER BY R_INTERESTAREA_ID',
             'N', 'N', 4600, 530, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50159, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_MAILTEXT', 'ALL', 'D',
             'SELECT R_MAILTEXT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,ISHTML ,MAILHEADER ,MAILTEXT ,MAILTEXT2 ,MAILTEXT3 FROM R_MAILTEXT WHERE AD_Client_ID = 11 AND R_MAILTEXT_ID<1000000 ORDER BY R_MAILTEXT_ID',
             'N', 'N', 4700, 416, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50160, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_REQUESTTYPE', 'ALL', 'D',
             'SELECT R_REQUESTTYPE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,ISDEFAULT ,ISSELFSERVICE ,DUEDATETOLERANCE ,ISEMAILWHENOVERDUE ,ISEMAILWHENDUE ,ISINVOICED ,AUTODUEDATEDAYS ,CONFIDENTIALTYPE ,ISAUTOCHANGEREQUEST ,ISCONFIDENTIALINFO ,R_STATUSCATEGORY_ID ,ISINDEXED FROM R_REQUESTTYPE WHERE AD_Client_ID = 11 AND R_REQUESTTYPE_ID<1000000 ORDER BY R_REQUESTTYPE_ID',
             'N', 'N', 4800, 529, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50161, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_RESOLUTION', 'ALL', 'D',
             'SELECT R_RESOLUTION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP FROM R_RESOLUTION WHERE AD_Client_ID = 11 AND R_RESOLUTION_ID<1000000 ORDER BY R_RESOLUTION_ID',
             'N', 'N', 4900, 774, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50162, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_STANDARDRESPONSE', 'ALL', 'D',
             'SELECT R_STANDARDRESPONSE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,RESPONSETEXT FROM R_STANDARDRESPONSE WHERE AD_Client_ID = 11 AND R_STANDARDRESPONSE_ID<1000000 ORDER BY R_STANDARDRESPONSE_ID',
             'N', 'N', 5000, 775, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50163, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_STATUS', 'ALL', 'D',
             'SELECT R_STATUS_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISDEFAULT ,ISOPEN ,ISCLOSED ,VALUE ,NEXT_STATUS_ID ,UPDATE_STATUS_ID ,TIMEOUTDAYS ,ISWEBCANUPDATE ,ISFINALCLOSE ,SEQNO ,R_STATUSCATEGORY_ID FROM R_STATUS WHERE AD_Client_ID = 11 AND R_STATUS_ID<1000000 ORDER BY R_STATUS_ID',
             'N', 'N', 5100, 776, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50164, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_STATUSCATEGORY', 'ALL', 'D',
             'SELECT R_STATUSCATEGORY_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISDEFAULT FROM R_STATUSCATEGORY WHERE AD_Client_ID = 11 AND R_STATUSCATEGORY_ID<1000000 ORDER BY R_STATUSCATEGORY_ID',
             'N', 'N', 5200, 844, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50165, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_IMPFORMAT_ROW', 'ALL', 'D',
             'SELECT AD_IMPFORMAT_ROW_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_IMPFORMAT_ID ,SEQNO ,NAME ,AD_COLUMN_ID ,STARTNO ,ENDNO ,DATATYPE ,DATAFORMAT ,DECIMALPOINT ,DIVIDEBY100 ,CONSTANTVALUE ,CALLOUT ,SCRIPT FROM AD_IMPFORMAT_ROW WHERE AD_Client_ID = 11 AND AD_IMPFORMAT_ROW_ID<1000000 ORDER BY AD_IMPFORMAT_ROW_ID',
             'N', 'N', 5300, 382, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50166, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_ORG', 'ALL', 'D',
             'SELECT AD_ORG_ID ,AD_CLIENT_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,ISSUMMARY FROM AD_ORG WHERE AD_Client_ID = 11 AND AD_ORG_ID<1000000 ORDER BY AD_ORG_ID',
             'N', 'N', 5400, 155, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50167, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PRINTFORM', 'ALL', 'D',
             'SELECT AD_PRINTFORM_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,INVOICE_PRINTFORMAT_ID ,ORDER_PRINTFORMAT_ID ,REMITTANCE_PRINTFORMAT_ID ,SHIPMENT_PRINTFORMAT_ID ,INVOICE_MAILTEXT_ID ,ORDER_MAILTEXT_ID ,REMITTANCE_MAILTEXT_ID ,SHIPMENT_MAILTEXT_ID ,PROJECT_MAILTEXT_ID ,PROJECT_PRINTFORMAT_ID FROM AD_PRINTFORM WHERE AD_Client_ID = 11 AND AD_PRINTFORM_ID<1000000 ORDER BY AD_PRINTFORM_ID',
             'N', 'N', 5500, 454, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50168, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PRINTFORMATITEM', 'ALL', 'D',
             'SELECT AD_PRINTFORMATITEM_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_PRINTFORMAT_ID ,NAME ,PRINTNAME ,ISPRINTED ,PRINTAREATYPE ,SEQNO ,PRINTFORMATTYPE ,AD_COLUMN_ID ,AD_PRINTFORMATCHILD_ID ,ISRELATIVEPOSITION ,ISNEXTLINE ,XSPACE ,YSPACE ,XPOSITION ,YPOSITION ,MAXWIDTH ,ISHEIGHTONELINE ,MAXHEIGHT ,FIELDALIGNMENTTYPE ,LINEALIGNMENTTYPE ,AD_PRINTCOLOR_ID ,AD_PRINTFONT_ID ,ISORDERBY ,SORTNO ,ISGROUPBY ,ISPAGEBREAK ,ISSUMMARIZED ,IMAGEISATTACHED ,IMAGEURL ,ISAVERAGED ,ISCOUNTED ,ISSETNLPOSITION ,ISSUPPRESSNULL ,BELOWCOLUMN ,AD_PRINTGRAPH_ID ,ISFIXEDWIDTH ,ISNEXTPAGE ,PRINTNAMESUFFIX ,ISMINCALC ,ISMAXCALC ,ISRUNNINGTOTAL ,RUNNINGTOTALLINES ,ISVARIANCECALC ,ISDEVIATIONCALC ,ISFILLEDRECTANGLE ,LINEWIDTH ,ARCDIAMETER ,SHAPETYPE ,ISCENTRALLYMAINTAINED ,ISIMAGEFIELD ,BARCODETYPE FROM AD_PRINTFORMATITEM WHERE AD_Client_ID = 11 AND AD_PRINTFORMATITEM_ID<1000000 ORDER BY AD_PRINTFORMATITEM_ID',
             'N', 'N', 5600, 489, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50169, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TREENODE', 'ALL', 'D',
             'SELECT AD_TREE_ID ,NODE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,PARENT_ID ,SEQNO FROM AD_TREENODE WHERE AD_Client_ID = 11 AND AD_TREE_ID<1000000 AND NODE_ID<1000000 ORDER BY AD_TREE_ID ,NODE_ID',
             'N', 'N', 5700, 289, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50170, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TREENODEBP', 'ALL', 'D',
             'SELECT AD_TREE_ID ,NODE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,PARENT_ID ,SEQNO FROM AD_TREENODEBP WHERE AD_Client_ID = 11 AND AD_TREE_ID<1000000 AND NODE_ID<1000000 ORDER BY AD_TREE_ID ,NODE_ID',
             'N', 'N', 5800, 451, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50171, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TREENODECMC', 'ALL', 'D',
             'SELECT AD_TREE_ID ,NODE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATEDBY ,UPDATED ,PARENT_ID ,SEQNO FROM AD_TREENODECMC WHERE AD_Client_ID = 11 AND AD_TREE_ID<1000000 AND NODE_ID<1000000 ORDER BY AD_TREE_ID ,NODE_ID',
             'N', 'N', 5900, 845, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50172, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TREENODECMM', 'ALL', 'D',
             'SELECT AD_TREE_ID ,NODE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATEDBY ,UPDATED ,PARENT_ID ,SEQNO FROM AD_TREENODECMM WHERE AD_Client_ID = 11 AND AD_TREE_ID<1000000 AND NODE_ID<1000000 ORDER BY AD_TREE_ID ,NODE_ID',
             'N', 'N', 6000, 846, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50173, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TREENODECMS', 'ALL', 'D',
             'SELECT AD_TREE_ID ,NODE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATEDBY ,UPDATED ,PARENT_ID ,SEQNO FROM AD_TREENODECMS WHERE AD_Client_ID = 11 AND AD_TREE_ID<1000000 AND NODE_ID<1000000 ORDER BY AD_TREE_ID ,NODE_ID',
             'N', 'N', 6100, 847, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50174, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TREENODECMT', 'ALL', 'D',
             'SELECT AD_TREE_ID ,NODE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATEDBY ,UPDATED ,PARENT_ID ,SEQNO FROM AD_TREENODECMT WHERE AD_Client_ID = 11 AND AD_TREE_ID<1000000 AND NODE_ID<1000000 ORDER BY AD_TREE_ID ,NODE_ID',
             'N', 'N', 6200, 848, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50175, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TREENODEPR', 'ALL', 'D',
             'SELECT AD_TREE_ID ,NODE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,PARENT_ID ,SEQNO FROM AD_TREENODEPR WHERE AD_Client_ID = 11 AND AD_TREE_ID<1000000 AND NODE_ID<1000000 ORDER BY AD_TREE_ID ,NODE_ID',
             'N', 'N', 6300, 453, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50176, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_BP_GROUP', 'ALL', 'D',
             'SELECT C_BP_GROUP_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,ISDEFAULT ,AD_PRINTCOLOR_ID ,ISCONFIDENTIALINFO ,PRIORITYBASE ,M_PRICELIST_ID ,PO_PRICELIST_ID ,M_DISCOUNTSCHEMA_ID ,PO_DISCOUNTSCHEMA_ID ,CREDITWATCHPERCENT ,PRICEMATCHTOLERANCE ,C_DUNNING_ID FROM C_BP_GROUP WHERE AD_Client_ID = 11 AND C_BP_GROUP_ID<1000000 ORDER BY C_BP_GROUP_ID',
             'N', 'N', 6400, 394, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50177, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_CAMPAIGN', 'ALL', 'D',
             'SELECT C_CAMPAIGN_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,C_CHANNEL_ID ,STARTDATE ,ENDDATE ,COSTS ,ISSUMMARY FROM C_CAMPAIGN WHERE AD_Client_ID = 11 AND C_CAMPAIGN_ID<1000000 ORDER BY C_CAMPAIGN_ID',
             'N', 'N', 6500, 274, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50178, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_CHARGE', 'ALL', 'D',
             'SELECT C_CHARGE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,CHARGEAMT ,ISSAMETAX ,ISSAMECURRENCY ,C_TAXCATEGORY_ID ,ISTAXINCLUDED ,C_BPARTNER_ID FROM C_CHARGE WHERE AD_Client_ID = 11 AND C_CHARGE_ID<1000000 ORDER BY C_CHARGE_ID',
             'N', 'N', 6600, 313, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50179, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_CYCLESTEP', 'ALL', 'D',
             'SELECT C_CYCLESTEP_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_CYCLE_ID ,SEQNO ,RELATIVEWEIGHT ,NAME FROM C_CYCLESTEP WHERE AD_Client_ID = 11 AND C_CYCLESTEP_ID<1000000 ORDER BY C_CYCLESTEP_ID',
             'N', 'N', 6700, 590, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50180, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_DUNNINGLEVEL', 'ALL', 'D',
             'SELECT C_DUNNINGLEVEL_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_DUNNING_ID ,PRINTNAME ,DAYSAFTERDUE ,DAYSBETWEENDUNNING ,NOTE ,CHARGEINTEREST ,INTERESTPERCENT ,CHARGEFEE ,FEEAMT ,DUNNING_PRINTFORMAT_ID ,NAME ,DESCRIPTION ,ISSHOWALLDUE ,ISSHOWNOTDUE ,ISSETCREDITSTOP ,ISSETPAYMENTTERM ,C_PAYMENTTERM_ID FROM C_DUNNINGLEVEL WHERE AD_Client_ID = 11 AND C_DUNNINGLEVEL_ID<1000000 ORDER BY C_DUNNINGLEVEL_ID',
             'N', 'N', 6800, 331, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50181, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_GREETING_TRL', 'ALL', 'D',
             'SELECT AD_LANGUAGE ,C_GREETING_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,GREETING ,ISTRANSLATED FROM C_GREETING_TRL WHERE AD_Client_ID = 11 AND C_GREETING_ID<1000000 ORDER BY C_GREETING_ID ,AD_LANGUAGE',
             'N', 'N', 6900, 347, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50182, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_JOB', 'ALL', 'D',
             'SELECT C_JOB_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,C_JOBCATEGORY_ID ,ISEMPLOYEE FROM C_JOB WHERE AD_Client_ID = 11 AND C_JOB_ID<1000000 ORDER BY C_JOB_ID',
             'N', 'N', 7000, 789, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50183, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_PAYMENTTERM_TRL', 'ALL', 'D',
             'SELECT C_PAYMENTTERM_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,DOCUMENTNOTE ,ISTRANSLATED FROM C_PAYMENTTERM_TRL WHERE AD_Client_ID = 11 AND C_PAYMENTTERM_ID<1000000 ORDER BY C_PAYMENTTERM_ID ,AD_LANGUAGE',
             'N', 'N', 7100, 303, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50184, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_PAYSCHEDULE', 'ALL', 'D',
             'SELECT C_PAYSCHEDULE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_PAYMENTTERM_ID ,PERCENTAGE ,NETDAYS ,NETDAY ,DISCOUNTDAYS ,DISCOUNT ,ISVALID ,GRACEDAYS FROM C_PAYSCHEDULE WHERE AD_Client_ID = 11 AND C_PAYSCHEDULE_ID<1000000 ORDER BY C_PAYSCHEDULE_ID',
             'N', 'N', 7200, 548, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50185, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_RFQ_TOPIC', 'ALL', 'D',
             'SELECT C_RFQ_TOPIC_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,ISSELFSERVICE ,AD_PRINTFORMAT_ID FROM C_RFQ_TOPIC WHERE AD_Client_ID = 11 AND C_RFQ_TOPIC_ID<1000000 ORDER BY C_RFQ_TOPIC_ID',
             'N', 'N', 7300, 671, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50186, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_TAX', 'ALL', 'D',
             'SELECT C_TAX_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,NAME ,UPDATEDBY ,DESCRIPTION ,TAXINDICATOR ,ISDOCUMENTLEVEL ,VALIDFROM ,ISSUMMARY ,REQUIRESTAXCERTIFICATE ,RATE ,PARENT_TAX_ID ,C_COUNTRY_ID ,C_REGION_ID ,TO_COUNTRY_ID ,TO_REGION_ID ,C_TAXCATEGORY_ID ,ISDEFAULT ,ISTAXEXEMPT ,SOPOTYPE ,ISSALESTAX FROM C_TAX WHERE AD_Client_ID = 11 AND C_TAX_ID<1000000 ORDER BY C_TAX_ID',
             'N', 'N', 7400, 261, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50187, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_TAXCATEGORY_TRL', 'ALL', 'D',
             'SELECT C_TAXCATEGORY_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,ISTRANSLATED FROM C_TAXCATEGORY_TRL WHERE AD_Client_ID = 11 AND C_TAXCATEGORY_ID<1000000 ORDER BY C_TAXCATEGORY_ID ,AD_LANGUAGE',
             'N', 'N', 7500, 348, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50188, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'CM_WEBPROJECT', 'ALL', 'D',
             'SELECT CM_WEBPROJECT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,META_COPYRIGHT ,META_PUBLISHER ,META_ROBOTSTAG ,META_AUTHOR ,META_CONTENT ,AD_TREECMC_ID ,AD_TREECMS_ID ,AD_TREECMM_ID ,AD_TREECMT_ID FROM CM_WEBPROJECT WHERE AD_Client_ID = 11 AND CM_WEBPROJECT_ID<1000000 ORDER BY CM_WEBPROJECT_ID',
             'N', 'N', 7600, 853, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50189, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'K_TOPIC', 'ALL', 'D',
             'SELECT K_TOPIC_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,K_TYPE_ID ,ISPUBLIC ,ISPUBLICWRITE FROM K_TOPIC WHERE AD_Client_ID = 11 AND K_TOPIC_ID<1000000 ORDER BY K_TOPIC_ID',
             'N', 'N', 7700, 607, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50190, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_ATTRIBUTE', 'ALL', 'D',
             'SELECT M_ATTRIBUTE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,ISMANDATORY ,ISINSTANCEATTRIBUTE ,M_ATTRIBUTESEARCH_ID ,ATTRIBUTEVALUETYPE FROM M_ATTRIBUTE WHERE AD_Client_ID = 11 AND M_ATTRIBUTE_ID<1000000 ORDER BY M_ATTRIBUTE_ID',
             'N', 'N', 7800, 562, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50191, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_ATTRIBUTESET', 'ALL', 'D',
             'SELECT M_ATTRIBUTESET_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,ISSERNO ,M_SERNOCTL_ID ,ISLOT ,M_LOTCTL_ID ,ISGUARANTEEDATE ,GUARANTEEDAYS ,ISINSTANCEATTRIBUTE ,MANDATORYTYPE ,ISGUARANTEEDATEMANDATORY ,ISLOTMANDATORY ,ISSERNOMANDATORY ,SERNOCHARSOVERWRITE ,LOTCHARSOVERWRITE ,LOTCHAREOVERWRITE ,SERNOCHAREOVERWRITE FROM M_ATTRIBUTESET WHERE AD_Client_ID = 11 AND M_ATTRIBUTESET_ID<1000000 ORDER BY M_ATTRIBUTESET_ID',
             'N', 'N', 7900, 560, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50192, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_PRICELIST_VERSION', 'ALL', 'D',
             'SELECT M_PRICELIST_VERSION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,M_PRICELIST_ID ,M_DISCOUNTSCHEMA_ID ,VALIDFROM ,PROCCREATE ,M_PRICELIST_VERSION_BASE_ID FROM M_PRICELIST_VERSION WHERE AD_Client_ID = 11 AND M_PRICELIST_VERSION_ID<1000000 ORDER BY M_PRICELIST_VERSION_ID',
             'N', 'N', 8000, 295, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50193, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_PRODUCT_CATEGORY', 'ALL', 'D',
             'SELECT M_PRODUCT_CATEGORY_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,ISDEFAULT ,PLANNEDMARGIN ,A_ASSET_GROUP_ID ,ISSELFSERVICE ,AD_PRINTCOLOR_ID ,MMPOLICY ,M_PRODUCT_CATEGORY_PARENT_ID FROM M_PRODUCT_CATEGORY WHERE AD_Client_ID = 11 AND M_PRODUCT_CATEGORY_ID<1000000 ORDER BY M_PRODUCT_CATEGORY_ID',
             'N', 'N', 8100, 209, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50194, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'PA_REPORTLINE', 'ALL', 'D',
             'SELECT PA_REPORTLINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,PA_REPORTLINESET_ID ,NAME ,SEQNO ,DESCRIPTION ,ISPRINTED ,PARENT_ID ,ISSUMMARY ,LINETYPE ,CALCULATIONTYPE ,OPER_1_ID ,OPER_2_ID ,POSTINGTYPE ,GL_BUDGET_ID ,AMOUNTTYPE FROM PA_REPORTLINE WHERE AD_Client_ID = 11 AND PA_REPORTLINE_ID<1000000 ORDER BY PA_REPORTLINE_ID',
             'N', 'N', 8200, 448, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50195, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_MAILTEXT_TRL', 'ALL', 'D',
             'SELECT R_MAILTEXT_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISTRANSLATED ,NAME ,MAILHEADER ,MAILTEXT ,MAILTEXT2 ,MAILTEXT3 FROM R_MAILTEXT_TRL WHERE AD_Client_ID = 11 AND R_MAILTEXT_ID<1000000 ORDER BY R_MAILTEXT_ID ,AD_LANGUAGE',
             'N', 'N', 8300, 826, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50196, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'W_STORE', 'ALL', 'D',
             'SELECT W_STORE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,WSTOREEMAIL ,WSTOREUSER ,WSTOREUSERPW ,WEBINFO ,WEBPARAM1 ,WEBPARAM2 ,WEBPARAM3 ,WEBPARAM4 ,WEBPARAM5 ,WEBPARAM6 ,ISMENUASSETS ,ISMENUORDERS ,ISMENUINVOICES ,ISMENUSHIPMENTS ,ISMENUPAYMENTS ,ISMENURFQS ,ISMENUREQUESTS ,ISMENUINTERESTS ,ISMENUREGISTRATIONS ,ISMENUCONTACT ,EMAILHEADER ,EMAILFOOTER ,SALESREP_ID ,M_WAREHOUSE_ID ,M_PRICELIST_ID ,WEBCONTEXT ,WEBORDEREMAIL ,C_PAYMENTTERM_ID ,ISDEFAULT ,URL ,STYLESHEET FROM W_STORE WHERE AD_Client_ID = 11 AND W_STORE_ID<1000000 ORDER BY W_STORE_ID',
             'N', 'N', 8400, 778, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50197, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PRINTFORMATITEM_TRL', 'ALL', 'D',
             'SELECT AD_PRINTFORMATITEM_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,PRINTNAME ,ISTRANSLATED ,PRINTNAMESUFFIX FROM AD_PRINTFORMATITEM_TRL WHERE AD_Client_ID = 11 AND AD_PRINTFORMATITEM_ID<1000000 ORDER BY AD_PRINTFORMATITEM_ID ,AD_LANGUAGE',
             'N', 'N', 8500, 522, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50198, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_SEQUENCE', 'ALL', 'D',
             'SELECT AD_SEQUENCE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,VFORMAT ,ISAUTOSEQUENCE ,INCREMENTNO ,STARTNO ,CURRENTNEXT ,CURRENTNEXTSYS ,ISAUDITED ,ISTABLEID ,PREFIX ,SUFFIX ,STARTNEWYEAR FROM AD_SEQUENCE WHERE AD_Client_ID = 11 AND AD_SEQUENCE_ID<1000000 ORDER BY AD_SEQUENCE_ID',
             'N', 'N', 8600, 115, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50199, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WORKFLOW', 'ALL', 'D',
             'SELECT AD_WORKFLOW_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ACCESSLEVEL ,AD_WF_NODE_ID ,ENTITYTYPE ,DURATIONUNIT ,AUTHOR ,VERSION ,VALIDFROM ,VALIDTO ,PRIORITY ,LIMIT ,DURATION ,COST ,WORKINGTIME ,WAITINGTIME ,AD_WF_RESPONSIBLE_ID ,PUBLISHSTATUS ,AD_WORKFLOWPROCESSOR_ID ,VALUE ,ISDEFAULT ,AD_TABLE_ID ,VALIDATEWORKFLOW ,WORKFLOWTYPE ,DOCVALUELOGIC ,ISVALID FROM AD_WORKFLOW WHERE AD_Client_ID = 11 AND AD_WORKFLOW_ID<1000000 ORDER BY AD_WORKFLOW_ID',
             'N', 'N', 8700, 117, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50200, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_CALENDAR', 'ALL', 'D',
             'SELECT C_CALENDAR_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION FROM C_CALENDAR WHERE AD_Client_ID = 11 AND C_CALENDAR_ID<1000000 ORDER BY C_CALENDAR_ID',
             'N', 'N', 8800, 139, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50201, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_CONVERSION_RATE', 'ALL', 'D',
             'SELECT C_CONVERSION_RATE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_CURRENCY_ID ,C_CURRENCY_ID_TO ,VALIDFROM ,VALIDTO ,MULTIPLYRATE ,DIVIDERATE ,C_CONVERSIONTYPE_ID FROM C_CONVERSION_RATE WHERE AD_Client_ID = 11 AND C_CONVERSION_RATE_ID<1000000 ORDER BY C_CONVERSION_RATE_ID',
             'N', 'N', 8900, 140, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50202, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_DUNNINGLEVEL_TRL', 'ALL', 'D',
             'SELECT AD_LANGUAGE ,C_DUNNINGLEVEL_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,PRINTNAME ,NOTE ,ISTRANSLATED FROM C_DUNNINGLEVEL_TRL WHERE AD_Client_ID = 11 AND C_DUNNINGLEVEL_ID<1000000 ORDER BY C_DUNNINGLEVEL_ID ,AD_LANGUAGE',
             'N', 'N', 9000, 332, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50203, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_ELEMENT', 'ALL', 'D',
             'SELECT C_ELEMENT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,VFORMAT ,ELEMENTTYPE ,ISBALANCING ,ISNATURALACCOUNT ,AD_TREE_ID FROM C_ELEMENT WHERE AD_Client_ID = 11 AND C_ELEMENT_ID<1000000 ORDER BY C_ELEMENT_ID',
             'N', 'N', 9100, 142, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50204, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_LOCATION', 'ALL', 'D',
             'SELECT C_LOCATION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ADDRESS1 ,ADDRESS2 ,CITY ,POSTAL ,POSTAL_ADD ,C_COUNTRY_ID ,C_REGION_ID ,C_CITY_ID ,REGIONNAME ,ADDRESS3 ,ADDRESS4 FROM C_LOCATION WHERE AD_Client_ID = 11 AND C_LOCATION_ID<1000000 ORDER BY C_LOCATION_ID',
             'N', 'N', 9200, 162, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50205, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_TAX_TRL', 'ALL', 'D',
             'SELECT C_TAX_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISTRANSLATED ,NAME ,DESCRIPTION ,TAXINDICATOR FROM C_TAX_TRL WHERE AD_Client_ID = 11 AND C_TAX_ID<1000000 ORDER BY C_TAX_ID ,AD_LANGUAGE',
             'N', 'N', 9300, 546, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50206, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_UOM', 'ALL', 'D',
             'SELECT C_UOM_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,UPDATED ,CREATEDBY ,UPDATEDBY ,X12DE355 ,UOMSYMBOL ,NAME ,DESCRIPTION ,STDPRECISION ,COSTINGPRECISION ,ISDEFAULT FROM C_UOM WHERE AD_Client_ID = 11 AND C_UOM_ID<1000000 ORDER BY C_UOM_ID',
             'N', 'N', 9400, 146, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50207, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'CM_MEDIA', 'ALL', 'D',
             'SELECT CM_MEDIA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,MEDIATYPE ,NAME ,DESCRIPTION ,HELP ,ISSUMMARY ,CM_WEBPROJECT_ID ,AD_IMAGE_ID ,CONTENTTEXT ,DIRECTDEPLOY FROM CM_MEDIA WHERE AD_Client_ID = 11 AND CM_MEDIA_ID<1000000 ORDER BY CM_MEDIA_ID',
             'N', 'N', 9500, 857, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50208, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'CM_MEDIA_SERVER', 'ALL', 'D',
             'SELECT CM_MEDIA_SERVER_ID ,AD_CLIENT_ID ,AD_ORG_ID ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISACTIVE ,NAME ,DESCRIPTION ,HELP ,CM_WEBPROJECT_ID ,ISPASSIVE ,URL ,IP_ADDRESS ,USERNAME ,PASSWORD ,FOLDER FROM CM_MEDIA_SERVER WHERE AD_Client_ID = 11 AND CM_MEDIA_SERVER_ID<1000000 ORDER BY CM_MEDIA_SERVER_ID',
             'N', 'N', 9600, 859, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50209, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'CM_TEMPLATE', 'ALL', 'D',
             'SELECT CM_TEMPLATE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,CM_WEBPROJECT_ID ,VALUE ,ISINCLUDE ,ISUSEAD ,ISNEWS ,ELEMENTS ,TEMPLATEXST ,ISSUMMARY ,ISVALID ,PROCESSING FROM CM_TEMPLATE WHERE AD_Client_ID = 11 AND CM_TEMPLATE_ID<1000000 ORDER BY CM_TEMPLATE_ID',
             'N', 'N', 9700, 854, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50210, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_ATTRIBUTESETINSTANCE', 'ALL', 'D',
             'SELECT M_ATTRIBUTESETINSTANCE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,M_ATTRIBUTESET_ID ,SERNO ,LOT ,GUARANTEEDATE ,DESCRIPTION ,M_LOT_ID FROM M_ATTRIBUTESETINSTANCE WHERE AD_Client_ID = 11 AND M_ATTRIBUTESETINSTANCE_ID<1000000 ORDER BY M_ATTRIBUTESETINSTANCE_ID',
             'N', 'N', 9800, 559, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50211, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_ATTRIBUTEUSE', 'ALL', 'D',
             'SELECT M_ATTRIBUTE_ID ,M_ATTRIBUTESET_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,SEQNO FROM M_ATTRIBUTEUSE WHERE AD_Client_ID = 11 AND M_ATTRIBUTE_ID<1000000 AND M_ATTRIBUTESET_ID<1000000 ORDER BY M_ATTRIBUTE_ID ,M_ATTRIBUTESET_ID',
             'N', 'N', 9900, 563, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50212, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_ATTRIBUTEVALUE', 'ALL', 'D',
             'SELECT M_ATTRIBUTEVALUE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,M_ATTRIBUTE_ID ,VALUE ,NAME ,DESCRIPTION FROM M_ATTRIBUTEVALUE WHERE AD_Client_ID = 11 AND M_ATTRIBUTEVALUE_ID<1000000 ORDER BY M_ATTRIBUTEVALUE_ID',
             'N', 'N', 10000, 558, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50213, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'W_STORE_TRL', 'ALL', 'D',
             'SELECT W_STORE_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISTRANSLATED ,WEBINFO ,WEBPARAM1 ,WEBPARAM2 ,WEBPARAM3 ,WEBPARAM4 ,WEBPARAM5 ,WEBPARAM6 ,EMAILHEADER ,EMAILFOOTER FROM W_STORE_TRL WHERE AD_Client_ID = 11 AND W_STORE_ID<1000000 ORDER BY W_STORE_ID ,AD_LANGUAGE',
             'N', 'N', 10100, 779, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50214, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WF_NODE', 'ALL', 'D',
             'SELECT AD_WF_NODE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,AD_WORKFLOW_ID ,ISCENTRALLYMAINTAINED ,ACTION ,AD_WINDOW_ID ,WORKFLOW_ID ,AD_TASK_ID ,AD_PROCESS_ID ,AD_FORM_ID ,ENTITYTYPE ,XPOSITION ,YPOSITION ,AD_WF_BLOCK_ID ,SUBFLOWEXECUTION ,STARTMODE ,FINISHMODE ,LIMIT ,PRIORITY ,DURATION ,COST ,WORKINGTIME ,WAITINGTIME ,AD_WF_RESPONSIBLE_ID ,AD_IMAGE_ID ,JOINELEMENT ,SPLITELEMENT ,WAITTIME ,AD_COLUMN_ID ,ATTRIBUTENAME ,ATTRIBUTEVALUE ,DOCACTION ,VALUE ,DYNPRIORITYUNIT ,DYNPRIORITYCHANGE ,EMAILRECIPIENT ,EMAIL ,R_MAILTEXT_ID FROM AD_WF_NODE WHERE AD_Client_ID = 11 AND AD_WF_NODE_ID<1000000 ORDER BY AD_WF_NODE_ID',
             'N', 'N', 10200, 129, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50215, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WORKFLOW_TRL', 'ALL', 'D',
             'SELECT AD_WORKFLOW_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISTRANSLATED FROM AD_WORKFLOW_TRL WHERE AD_Client_ID = 11 AND AD_WORKFLOW_ID<1000000 ORDER BY AD_WORKFLOW_ID ,AD_LANGUAGE',
             'N', 'N', 10300, 133, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50216, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_BANK', 'ALL', 'D',
             'SELECT C_BANK_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,ROUTINGNO ,C_LOCATION_ID ,SWIFTCODE ,ISOWNBANK ,DESCRIPTION FROM C_BANK WHERE AD_Client_ID = 11 AND C_BANK_ID<1000000 ORDER BY C_BANK_ID',
             'N', 'N', 10400, 296, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50217, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_DOCTYPE', 'ALL', 'D',
             'SELECT C_DOCTYPE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,PRINTNAME ,DESCRIPTION ,DOCBASETYPE ,ISSOTRX ,DOCSUBTYPESO ,HASPROFORMA ,C_DOCTYPEPROFORMA_ID ,C_DOCTYPESHIPMENT_ID ,C_DOCTYPEINVOICE_ID ,ISDOCNOCONTROLLED ,DOCNOSEQUENCE_ID ,GL_CATEGORY_ID ,HASCHARGES ,DOCUMENTNOTE ,ISDEFAULT ,DOCUMENTCOPIES ,AD_PRINTFORMAT_ID ,ISDEFAULTCOUNTERDOC ,ISSHIPCONFIRM ,ISPICKQACONFIRM ,ISINTRANSIT ,ISSPLITWHENDIFFERENCE ,C_DOCTYPEDIFFERENCE_ID ,ISCREATECOUNTER ,ISINDEXED FROM C_DOCTYPE WHERE AD_Client_ID = 11 AND C_DOCTYPE_ID<1000000 ORDER BY C_DOCTYPE_ID',
             'N', 'N', 10500, 217, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50218, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_NONBUSINESSDAY', 'ALL', 'D',
             'SELECT C_NONBUSINESSDAY_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DATE1 ,C_CALENDAR_ID FROM C_NONBUSINESSDAY WHERE AD_Client_ID = 11 AND C_NONBUSINESSDAY_ID<1000000 ORDER BY C_NONBUSINESSDAY_ID',
             'N', 'N', 10600, 163, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50219, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_UOM_CONVERSION', 'ALL', 'D',
             'SELECT C_UOM_CONVERSION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_UOM_ID ,C_UOM_TO_ID ,MULTIPLYRATE ,DIVIDERATE ,M_PRODUCT_ID FROM C_UOM_CONVERSION WHERE AD_Client_ID = 11 AND C_UOM_CONVERSION_ID<1000000 ORDER BY C_UOM_CONVERSION_ID',
             'N', 'N', 10700, 175, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50220, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_UOM_TRL', 'ALL', 'D',
             'SELECT C_UOM_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,UOMSYMBOL ,NAME ,DESCRIPTION ,ISTRANSLATED FROM C_UOM_TRL WHERE AD_Client_ID = 11 AND C_UOM_ID<1000000 ORDER BY C_UOM_ID ,AD_LANGUAGE',
             'N', 'N', 10800, 339, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50221, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_YEAR', 'ALL', 'D',
             'SELECT C_YEAR_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,FISCALYEAR ,DESCRIPTION ,C_CALENDAR_ID ,PROCESSING FROM C_YEAR WHERE AD_Client_ID = 11 AND C_YEAR_ID<1000000 ORDER BY C_YEAR_ID',
             'N', 'N', 10900, 177, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50222, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'CM_CONTAINER', 'ALL', 'D',
             'SELECT CM_CONTAINER_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,CM_WEBPROJECT_ID ,CM_TEMPLATE_ID ,TITLE ,NOTICE ,CONTAINERTYPE ,CONTAINERLINKURL ,RELATIVEURL ,PRIORITY ,ISINDEXED ,ISSECURE ,META_ROBOTSTAG ,META_AUTHOR ,META_COPYRIGHT ,META_CONTENT ,META_DESCRIPTION ,META_KEYWORDS ,META_PUBLISHER ,STRUCTUREXML ,CONTAINERXML ,CM_CONTAINERLINK_ID ,ISSUMMARY ,META_LANGUAGE ,ISVALID FROM CM_CONTAINER WHERE AD_Client_ID = 11 AND CM_CONTAINER_ID<1000000 ORDER BY CM_CONTAINER_ID',
             'N', 'N', 11000, 855, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50223, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'CM_CSTAGE', 'ALL', 'D',
             'SELECT CM_CSTAGE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,CM_WEBPROJECT_ID ,CM_TEMPLATE_ID ,TITLE ,NOTICE ,CONTAINERTYPE ,CONTAINERLINKURL ,RELATIVEURL ,PRIORITY ,ISINDEXED ,ISSECURE ,META_ROBOTSTAG ,META_AUTHOR ,META_COPYRIGHT ,META_CONTENT ,META_DESCRIPTION ,META_KEYWORDS ,META_PUBLISHER ,STRUCTUREXML ,CONTAINERXML ,CM_CSTAGELINK_ID ,ISMODIFIED ,PROCESSING ,ISSUMMARY ,META_LANGUAGE ,ISVALID FROM CM_CSTAGE WHERE AD_Client_ID = 11 AND CM_CSTAGE_ID<1000000 ORDER BY CM_CSTAGE_ID',
             'N', 'N', 11100, 866, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50224, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'I_CONVERSION_RATE', 'ALL', 'D',
             'SELECT I_CONVERSION_RATE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_CONVERSION_RATE_ID ,ISO_CODE ,C_CURRENCY_ID ,ISO_CODE_TO ,C_CURRENCY_ID_TO ,CONVERSIONTYPEVALUE ,C_CONVERSIONTYPE_ID ,VALIDFROM ,VALIDTO ,MULTIPLYRATE ,DIVIDERATE ,CREATERECIPROCALRATE ,I_ISIMPORTED ,I_ERRORMSG ,PROCESSING ,PROCESSED FROM I_CONVERSION_RATE WHERE AD_Client_ID = 11 AND I_CONVERSION_RATE_ID<1000000 ORDER BY I_CONVERSION_RATE_ID',
             'N', 'N', 11200, 641, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50225, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_ATTRIBUTEINSTANCE', 'ALL', 'D',
             'SELECT M_ATTRIBUTESETINSTANCE_ID ,M_ATTRIBUTE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,M_ATTRIBUTEVALUE_ID ,VALUE ,VALUENUMBER FROM M_ATTRIBUTEINSTANCE WHERE AD_Client_ID = 11 AND M_ATTRIBUTESETINSTANCE_ID<1000000 AND M_ATTRIBUTE_ID<1000000 ORDER BY M_ATTRIBUTESETINSTANCE_ID ,M_ATTRIBUTE_ID',
             'N', 'N', 11300, 561, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50226, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_WAREHOUSE', 'ALL', 'D',
             'SELECT M_WAREHOUSE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,C_LOCATION_ID ,SEPARATOR ,M_WAREHOUSESOURCE_ID ,REPLENISHMENTCLASS FROM M_WAREHOUSE WHERE AD_Client_ID = 11 AND M_WAREHOUSE_ID<1000000 ORDER BY M_WAREHOUSE_ID',
             'N', 'N', 11400, 190, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50227, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'S_EXPENSETYPE', 'ALL', 'D',
             'SELECT S_EXPENSETYPE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,ISINVOICED ,C_UOM_ID ,M_PRODUCT_CATEGORY_ID ,C_TAXCATEGORY_ID FROM S_EXPENSETYPE WHERE AD_Client_ID = 11 AND S_EXPENSETYPE_ID<1000000 ORDER BY S_EXPENSETYPE_ID',
             'N', 'N', 11500, 481, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50228, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'S_RESOURCETYPE', 'ALL', 'D',
             'SELECT S_RESOURCETYPE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,ISSINGLEASSIGNMENT ,C_UOM_ID ,ALLOWUOMFRACTIONS ,TIMESLOTSTART ,TIMESLOTEND ,ISTIMESLOT ,ISDATESLOT ,ONSUNDAY ,ONMONDAY ,ONTUESDAY ,ONWEDNESDAY ,ONTHURSDAY ,ONFRIDAY ,ONSATURDAY ,M_PRODUCT_CATEGORY_ID ,C_TAXCATEGORY_ID ,CHARGEABLEQTY FROM S_RESOURCETYPE WHERE AD_Client_ID = 11 AND S_RESOURCETYPE_ID<1000000 ORDER BY S_RESOURCETYPE_ID',
             'N', 'N', 11600, 480, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50229, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'S_TRAINING', 'ALL', 'D',
             'SELECT S_TRAINING_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATEDBY ,UPDATED ,NAME ,DESCRIPTION ,HELP ,DOCUMENTNOTE ,IMAGEURL ,DESCRIPTIONURL ,M_PRODUCT_CATEGORY_ID ,C_TAXCATEGORY_ID ,C_UOM_ID ,PROCESSING FROM S_TRAINING WHERE AD_Client_ID = 11 AND S_TRAINING_ID<1000000 ORDER BY S_TRAINING_ID',
             'N', 'N', 11700, 538, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50230, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_USER', 'ALL', 'D',
             'SELECT AD_USER_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,PASSWORD ,EMAIL ,SUPERVISOR_ID ,C_BPARTNER_ID ,PROCESSING ,EMAILUSER ,EMAILUSERPW ,C_BPARTNER_LOCATION_ID ,C_GREETING_ID ,TITLE ,COMMENTS ,PHONE ,PHONE2 ,FAX ,LASTCONTACT ,LASTRESULT ,BIRTHDAY ,AD_ORGTRX_ID ,EMAILVERIFY ,EMAILVERIFYDATE ,NOTIFICATIONTYPE ,ISFULLBPACCESS ,C_JOB_ID ,LDAPUSER ,CONNECTIONPROFILE ,VALUE FROM AD_USER WHERE AD_Client_ID = 11 AND AD_USER_ID<1000000 ORDER BY AD_USER_ID',
             'N', 'N', 11800, 114, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50231, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WF_NODE_PARA', 'ALL', 'D',
             'SELECT AD_WF_NODE_PARA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_WF_NODE_ID ,ATTRIBUTENAME ,AD_PROCESS_PARA_ID ,DESCRIPTION ,ATTRIBUTEVALUE ,ENTITYTYPE FROM AD_WF_NODE_PARA WHERE AD_Client_ID = 11 AND AD_WF_NODE_PARA_ID<1000000 ORDER BY AD_WF_NODE_PARA_ID',
             'N', 'N', 11900, 643, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50232, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WF_NODE_TRL', 'ALL', 'D',
             'SELECT AD_LANGUAGE ,AD_WF_NODE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISTRANSLATED FROM AD_WF_NODE_TRL WHERE AD_Client_ID = 11 AND AD_WF_NODE_ID<1000000 ORDER BY AD_WF_NODE_ID ,AD_LANGUAGE',
             'N', 'N', 12000, 130, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50233, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WF_NODENEXT', 'ALL', 'D',
             'SELECT AD_WF_NODENEXT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_WF_NODE_ID ,AD_WF_NEXT_ID ,DESCRIPTION ,SEQNO ,ENTITYTYPE ,TRANSITIONCODE ,ISSTDUSERWORKFLOW FROM AD_WF_NODENEXT WHERE AD_Client_ID = 11 AND AD_WF_NODENEXT_ID<1000000 ORDER BY AD_WF_NODENEXT_ID',
             'N', 'N', 12100, 131, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50234, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_BANKACCOUNT', 'ALL', 'D',
             'SELECT C_BANKACCOUNT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_BANK_ID ,C_CURRENCY_ID ,BANKACCOUNTTYPE ,ACCOUNTNO ,CURRENTBALANCE ,CREDITLIMIT ,ISDEFAULT ,IBAN ,DESCRIPTION ,BBAN FROM C_BANKACCOUNT WHERE AD_Client_ID = 11 AND C_BANKACCOUNT_ID<1000000 ORDER BY C_BANKACCOUNT_ID',
             'N', 'N', 12200, 297, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50235, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_BPARTNER_LOCATION', 'ALL', 'D',
             'SELECT C_BPARTNER_LOCATION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,ISBILLTO ,ISSHIPTO ,ISPAYFROM ,ISREMITTO ,PHONE ,PHONE2 ,FAX ,ISDN ,C_SALESREGION_ID ,C_BPARTNER_ID ,C_LOCATION_ID FROM C_BPARTNER_LOCATION WHERE AD_Client_ID = 11 AND C_BPARTNER_LOCATION_ID<1000000 ORDER BY C_BPARTNER_LOCATION_ID',
             'N', 'N', 12300, 293, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50236, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_DOCTYPE_TRL', 'ALL', 'D',
             'SELECT C_DOCTYPE_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,PRINTNAME ,DOCUMENTNOTE ,ISTRANSLATED FROM C_DOCTYPE_TRL WHERE AD_Client_ID = 11 AND C_DOCTYPE_ID<1000000 ORDER BY C_DOCTYPE_ID ,AD_LANGUAGE',
             'N', 'N', 12400, 300, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50237, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_DOCTYPECOUNTER', 'ALL', 'D',
             'SELECT C_DOCTYPECOUNTER_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,C_DOCTYPE_ID ,COUNTER_C_DOCTYPE_ID ,ISVALID ,PROCESSING ,DOCACTION ,ISCREATECOUNTER FROM C_DOCTYPECOUNTER WHERE AD_Client_ID = 11 AND C_DOCTYPECOUNTER_ID<1000000 ORDER BY C_DOCTYPECOUNTER_ID',
             'N', 'N', 12500, 718, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50238, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_PERIOD', 'ALL', 'D',
             'SELECT C_PERIOD_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,PERIODNO ,C_YEAR_ID ,STARTDATE ,ENDDATE ,PERIODTYPE ,PROCESSING FROM C_PERIOD WHERE AD_Client_ID = 11 AND C_PERIOD_ID<1000000 ORDER BY C_PERIOD_ID',
             'N', 'N', 12600, 145, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50239, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'CM_CONTAINER_ELEMENT', 'ALL', 'D',
             'SELECT CM_CONTAINER_ELEMENT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,CM_CONTAINER_ID ,CONTENTHTML ,ISVALID FROM CM_CONTAINER_ELEMENT WHERE AD_Client_ID = 11 AND CM_CONTAINER_ELEMENT_ID<1000000 ORDER BY CM_CONTAINER_ELEMENT_ID',
             'N', 'N', 12700, 860, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50240, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'CM_CONTAINER_TRL', 'ALL', 'D',
             'SELECT CM_CONTAINER_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISTRANSLATED ,NAME ,TITLE ,META_DESCRIPTION ,META_KEYWORDS ,STRUCTUREXML ,CONTAINERXML FROM CM_CONTAINER_TRL WHERE AD_Client_ID = 11 AND CM_CONTAINER_ID<1000000 ORDER BY CM_CONTAINER_ID ,AD_LANGUAGE',
             'N', 'N', 12800, 864, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50241, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'CM_CSTAGE_ELEMENT', 'ALL', 'D',
             'SELECT CM_CSTAGE_ELEMENT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,CM_CSTAGE_ID ,CONTENTHTML ,ISVALID FROM CM_CSTAGE_ELEMENT WHERE AD_Client_ID = 11 AND CM_CSTAGE_ELEMENT_ID<1000000 ORDER BY CM_CSTAGE_ELEMENT_ID',
             'N', 'N', 12900, 867, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50242, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'CM_CSTAGE_TRL', 'ALL', 'D',
             'SELECT CM_CSTAGE_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISTRANSLATED ,NAME ,TITLE ,META_DESCRIPTION ,META_KEYWORDS ,STRUCTUREXML ,CONTAINERXML FROM CM_CSTAGE_TRL WHERE AD_Client_ID = 11 AND CM_CSTAGE_ID<1000000 ORDER BY CM_CSTAGE_ID ,AD_LANGUAGE',
             'N', 'N', 13000, 869, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50243, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'CM_WEBPROJECT_DOMAIN', 'ALL', 'D',
             'SELECT CM_WEBPROJECT_DOMAIN_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,CM_WEBPROJECT_ID ,CM_CONTAINER_ID ,FQDN FROM CM_WEBPROJECT_DOMAIN WHERE AD_Client_ID = 11 AND CM_WEBPROJECT_DOMAIN_ID<1000000 ORDER BY CM_WEBPROJECT_DOMAIN_ID',
             'N', 'N', 13100, 873, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50244, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_LOCATOR', 'ALL', 'D',
             'SELECT M_LOCATOR_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,M_WAREHOUSE_ID ,PRIORITYNO ,ISDEFAULT ,X ,Y ,Z FROM M_LOCATOR WHERE AD_Client_ID = 11 AND M_LOCATOR_ID<1000000 ORDER BY M_LOCATOR_ID',
             'N', 'N', 13200, 207, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50245, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_ORGINFO', 'ALL', 'D',
             'SELECT AD_ORG_ID ,AD_CLIENT_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_LOCATION_ID ,DUNS ,TAXID ,PA_GOAL_ID ,SUPERVISOR_ID ,PARENT_ORG_ID ,AD_ORGTYPE_ID ,M_WAREHOUSE_ID FROM AD_ORGINFO WHERE AD_Client_ID = 11 AND AD_ORG_ID<1000000 ORDER BY AD_ORG_ID',
             'N', 'N', 13300, 228, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50246, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PREFERENCE', 'ALL', 'D',
             'SELECT AD_PREFERENCE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_WINDOW_ID ,AD_USER_ID ,ATTRIBUTE ,VALUE FROM AD_PREFERENCE WHERE AD_Client_ID = 11 AND AD_PREFERENCE_ID<1000000 ORDER BY AD_PREFERENCE_ID',
             'N', 'N', 13400, 195, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50247, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_ROLE', 'ALL', 'D',
             'SELECT AD_ROLE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,NAME ,UPDATEDBY ,DESCRIPTION ,USERLEVEL ,C_CURRENCY_ID ,AMTAPPROVAL ,AD_TREE_MENU_ID ,ISMANUAL ,ISSHOWACCT ,ISPERSONALLOCK ,ISPERSONALACCESS ,ISCANEXPORT ,ISCANREPORT ,SUPERVISOR_ID ,ISCANAPPROVEOWNDOC ,ISACCESSALLORGS ,ISCHANGELOG ,PREFERENCETYPE ,OVERWRITEPRICELIMIT ,ISUSEUSERORGACCESS ,AD_TREE_ORG_ID ,CONFIRMQUERYRECORDS ,MAXQUERYRECORDS ,CONNECTIONPROFILE ,ALLOW_INFO_ACCOUNT ,ALLOW_INFO_ASSET ,ALLOW_INFO_BPARTNER ,ALLOW_INFO_CASHJOURNAL ,ALLOW_INFO_INOUT ,ALLOW_INFO_INVOICE ,ALLOW_INFO_ORDER ,ALLOW_INFO_PAYMENT ,ALLOW_INFO_PRODUCT ,ALLOW_INFO_RESOURCE ,ALLOW_INFO_SCHEDULE FROM AD_ROLE WHERE AD_Client_ID = 11 AND AD_ROLE_ID<1000000 ORDER BY AD_ROLE_ID',
             'N', 'N', 13500, 156, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50248, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TREEBAR', 'ALL', 'D',
             'SELECT AD_TREE_ID ,AD_USER_ID ,NODE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY FROM AD_TREEBAR WHERE AD_Client_ID = 11 AND AD_TREE_ID<1000000 AND AD_USER_ID<1000000 AND NODE_ID<1000000 ORDER BY AD_TREE_ID ,AD_USER_ID ,NODE_ID',
             'N', 'N', 13600, 456, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50249, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_USERMAIL', 'ALL', 'D',
             'SELECT AD_USERMAIL_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_USER_ID ,R_MAILTEXT_ID ,W_MAILMSG_ID ,MESSAGEID ,DELIVERYCONFIRMATION ,ISDELIVERED ,SUBJECT ,MAILTEXT FROM AD_USERMAIL WHERE AD_Client_ID = 11 AND AD_USERMAIL_ID<1000000 ORDER BY AD_USERMAIL_ID',
             'N', 'N', 13700, 782, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50250, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WF_NEXTCONDITION', 'ALL', 'D',
             'SELECT AD_WF_NEXTCONDITION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,AD_WF_NODENEXT_ID ,SEQNO ,ENTITYTYPE ,ANDOR ,AD_COLUMN_ID ,OPERATION ,VALUE ,VALUE2 FROM AD_WF_NEXTCONDITION WHERE AD_Client_ID = 11 AND AD_WF_NEXTCONDITION_ID<1000000 ORDER BY AD_WF_NEXTCONDITION_ID',
             'N', 'N', 13800, 706, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50251, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_ACCTPROCESSOR', 'ALL', 'D',
             'SELECT C_ACCTPROCESSOR_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,FREQUENCYTYPE ,FREQUENCY ,DATELASTRUN ,DATENEXTRUN ,SUPERVISOR_ID ,KEEPLOGDAYS ,PROCESSING ,C_ACCTSCHEMA_ID ,AD_TABLE_ID FROM C_ACCTPROCESSOR WHERE AD_Client_ID = 11 AND C_ACCTPROCESSOR_ID<1000000 ORDER BY C_ACCTPROCESSOR_ID',
             'N', 'N', 13900, 695, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50252, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_ACCTSCHEMA', 'ALL', 'D',
             'SELECT C_ACCTSCHEMA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,GAAP ,ISACCRUAL ,COSTINGMETHOD ,C_CURRENCY_ID ,AUTOPERIODCONTROL ,C_PERIOD_ID ,PERIOD_OPENHISTORY ,PERIOD_OPENFUTURE ,SEPARATOR ,HASALIAS ,HASCOMBINATION ,ISTRADEDISCOUNTPOSTED ,ISDISCOUNTCORRECTSTAX ,M_COSTTYPE_ID ,COSTINGLEVEL ,ISADJUSTCOGS ,AD_ORGONLY_ID ,ISPOSTSERVICES ,ISEXPLICITCOSTADJUSTMENT ,COMMITMENTTYPE ,PROCESSING ,TAXCORRECTIONTYPE ,ISALLOWNEGATIVEPOSTING FROM C_ACCTSCHEMA WHERE AD_Client_ID = 11 AND C_ACCTSCHEMA_ID<1000000 ORDER BY C_ACCTSCHEMA_ID',
             'N', 'N', 14000, 265, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50253, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_BANKACCOUNTDOC', 'ALL', 'D',
             'SELECT C_BANKACCOUNTDOC_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_BANKACCOUNT_ID ,NAME ,DESCRIPTION ,PAYMENTRULE ,CURRENTNEXT ,CHECK_PRINTFORMAT_ID FROM C_BANKACCOUNTDOC WHERE AD_Client_ID = 11 AND C_BANKACCOUNTDOC_ID<1000000 ORDER BY C_BANKACCOUNTDOC_ID',
             'N', 'N', 14100, 455, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50254, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_BANKSTATEMENT', 'ALL', 'D',
             'SELECT C_BANKSTATEMENT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_BANKACCOUNT_ID ,NAME ,DESCRIPTION ,ISMANUAL ,STATEMENTDATE ,BEGINNINGBALANCE ,ENDINGBALANCE ,STATEMENTDIFFERENCE ,CREATEFROM ,PROCESSING ,PROCESSED ,POSTED ,EFTSTATEMENTREFERENCE ,EFTSTATEMENTDATE ,MATCHSTATEMENT ,ISAPPROVED ,DOCSTATUS ,DOCACTION FROM C_BANKSTATEMENT WHERE AD_Client_ID = 11 AND C_BANKSTATEMENT_ID<1000000 ORDER BY C_BANKSTATEMENT_ID',
             'N', 'N', 14200, 392, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50255, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_BPARTNER', 'ALL', 'D',
             'SELECT C_BPARTNER_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,NAME2 ,DESCRIPTION ,ISSUMMARY ,C_BP_GROUP_ID ,ISONETIME ,ISPROSPECT ,ISVENDOR ,ISCUSTOMER ,ISEMPLOYEE ,ISSALESREP ,REFERENCENO ,DUNS ,URL ,AD_LANGUAGE ,TAXID ,ISTAXEXEMPT ,C_INVOICESCHEDULE_ID ,RATING ,SALESVOLUME ,NUMBEREMPLOYEES ,NAICS ,FIRSTSALE ,ACQUSITIONCOST ,POTENTIALLIFETIMEVALUE ,ACTUALLIFETIMEVALUE ,SHAREOFCUSTOMER ,PAYMENTRULE ,SO_CREDITLIMIT ,SO_CREDITUSED ,C_PAYMENTTERM_ID ,M_PRICELIST_ID ,M_DISCOUNTSCHEMA_ID ,C_DUNNING_ID ,ISDISCOUNTPRINTED ,SO_DESCRIPTION ,POREFERENCE ,PAYMENTRULEPO ,PO_PRICELIST_ID ,PO_DISCOUNTSCHEMA_ID ,PO_PAYMENTTERM_ID ,DOCUMENTCOPIES ,C_GREETING_ID ,INVOICERULE ,DELIVERYRULE ,FREIGHTCOSTRULE ,DELIVERYVIARULE ,SALESREP_ID ,SENDEMAIL ,BPARTNER_PARENT_ID ,INVOICE_PRINTFORMAT_ID ,SOCREDITSTATUS ,SHELFLIFEMINPCT ,AD_ORGBP_ID ,FLATDISCOUNT ,TOTALOPENBALANCE FROM C_BPARTNER WHERE AD_Client_ID = 11 AND C_BPARTNER_ID<1000000 ORDER BY C_BPARTNER_ID',
             'N', 'N', 14300, 291, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50256, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_ELEMENTVALUE', 'ALL', 'D',
             'SELECT C_ELEMENTVALUE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,ACCOUNTTYPE ,ACCOUNTSIGN ,ISDOCCONTROLLED ,C_ELEMENT_ID ,ISSUMMARY ,VALIDFROM ,VALIDTO ,POSTACTUAL ,POSTBUDGET ,POSTENCUMBRANCE ,POSTSTATISTICAL ,ISBANKACCOUNT ,C_BANKACCOUNT_ID ,ISFOREIGNCURRENCY ,C_CURRENCY_ID FROM C_ELEMENTVALUE WHERE AD_Client_ID = 11 AND C_ELEMENTVALUE_ID<1000000 ORDER BY C_ELEMENTVALUE_ID',
             'N', 'N', 14400, 188, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50257, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_PAYMENTPROCESSOR', 'ALL', 'D',
             'SELECT C_PAYMENTPROCESSOR_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,C_BANKACCOUNT_ID ,AD_SEQUENCE_ID ,PAYPROCESSORCLASS ,USERID ,PASSWORD ,HOSTADDRESS ,HOSTPORT ,PROXYADDRESS ,PROXYPORT ,PROXYLOGON ,PROXYPASSWORD ,ACCEPTVISA ,ACCEPTMC ,ACCEPTAMEX ,ACCEPTDINERS ,ACCEPTDISCOVER ,ACCEPTCORPORATE ,ACCEPTCHECK ,ACCEPTATM ,REQUIREVV ,C_CURRENCY_ID ,COSTPERTRX ,COMMISSION ,PARTNERID ,VENDORID ,MINIMUMAMT ,ACCEPTDIRECTDEBIT ,ACCEPTDIRECTDEPOSIT FROM C_PAYMENTPROCESSOR WHERE AD_Client_ID = 11 AND C_PAYMENTPROCESSOR_ID<1000000 ORDER BY C_PAYMENTPROCESSOR_ID',
             'N', 'N', 14500, 398, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50258, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_PAYSELECTION', 'ALL', 'D',
             'SELECT C_PAYSELECTION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,C_BANKACCOUNT_ID ,PAYDATE ,ISAPPROVED ,TOTALAMT ,CREATEFROM ,PROCESSING ,PROCESSED FROM C_PAYSELECTION WHERE AD_Client_ID = 11 AND C_PAYSELECTION_ID<1000000 ORDER BY C_PAYSELECTION_ID',
             'N', 'N', 14600, 426, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50259, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_PERIODCONTROL', 'ALL', 'D',
             'SELECT C_PERIODCONTROL_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_PERIOD_ID ,DOCBASETYPE ,PERIODSTATUS ,PERIODACTION ,PROCESSING FROM C_PERIODCONTROL WHERE AD_Client_ID = 11 AND C_PERIODCONTROL_ID<1000000 ORDER BY C_PERIODCONTROL_ID',
             'N', 'N', 14700, 229, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50260, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_POS', 'ALL', 'D',
             'SELECT C_POS_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,SALESREP_ID ,M_PRICELIST_ID ,C_CASHBOOK_ID ,M_WAREHOUSE_ID ,PRINTERNAME ,C_POSKEYLAYOUT_ID ,ISMODIFYPRICE ,C_BPARTNERCASHTRX_ID ,C_DOCTYPE_ID FROM C_POS WHERE AD_Client_ID = 11 AND C_POS_ID<1000000 ORDER BY C_POS_ID',
             'N', 'N', 14800, 748, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50261, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'CM_CONTAINER_ELEMENT_TRL', 'ALL', 'D',
             'SELECT CM_CONTAINER_ELEMENT_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISTRANSLATED ,CONTENTHTML ,NAME ,DESCRIPTION ,HELP FROM CM_CONTAINER_ELEMENT_TRL WHERE AD_Client_ID = 11 AND CM_CONTAINER_ELEMENT_ID<1000000 ORDER BY CM_CONTAINER_ELEMENT_ID ,AD_LANGUAGE',
             'N', 'N', 14900, 861, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50262, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'CM_CSTAGE_ELEMENT_TRL', 'ALL', 'D',
             'SELECT CM_CSTAGE_ELEMENT_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISTRANSLATED ,NAME ,DESCRIPTION ,HELP ,CONTENTHTML FROM CM_CSTAGE_ELEMENT_TRL WHERE AD_Client_ID = 11 AND CM_CSTAGE_ELEMENT_ID<1000000 ORDER BY CM_CSTAGE_ELEMENT_ID ,AD_LANGUAGE',
             'N', 'N', 15000, 868, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50263, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'GL_JOURNALBATCH', 'ALL', 'D',
             'SELECT GL_JOURNALBATCH_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,DOCUMENTNO ,DESCRIPTION ,POSTINGTYPE ,GL_CATEGORY_ID ,DATEDOC ,DATEACCT ,C_PERIOD_ID ,C_CURRENCY_ID ,TOTALDR ,TOTALCR ,CONTROLAMT ,PROCESSING ,PROCESSED ,COPYFROM ,C_DOCTYPE_ID ,DOCSTATUS ,DOCACTION ,ISAPPROVED FROM GL_JOURNALBATCH WHERE AD_Client_ID = 11 AND GL_JOURNALBATCH_ID<1000000 ORDER BY GL_JOURNALBATCH_ID',
             'N', 'N', 15100, 225, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50264, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_REQUISITION', 'ALL', 'D',
             'SELECT M_REQUISITION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,DOCUMENTNO ,DESCRIPTION ,HELP ,AD_USER_ID ,M_PRICELIST_ID ,M_WAREHOUSE_ID ,ISAPPROVED ,PRIORITYRULE ,DATEREQUIRED ,TOTALLINES ,DOCACTION ,DOCSTATUS ,PROCESSING ,PROCESSED ,POSTED ,DATEDOC ,C_DOCTYPE_ID FROM M_REQUISITION WHERE AD_Client_ID = 11 AND M_REQUISITION_ID<1000000 ORDER BY M_REQUISITION_ID',
             'N', 'N', 15200, 702, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50265, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_CATEGORYUPDATES', 'ALL', 'D',
             'SELECT AD_USER_ID ,R_CATEGORY_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISSELFSERVICE FROM R_CATEGORYUPDATES WHERE AD_Client_ID = 11 AND AD_USER_ID<1000000 AND R_CATEGORY_ID<1000000 ORDER BY AD_USER_ID ,R_CATEGORY_ID',
             'N', 'N', 15300, 785, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50266, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 02:09:40', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_CONTACTINTEREST', 'ALL', 'D',
             'SELECT R_INTERESTAREA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,SUBSCRIBEDATE ,OPTOUTDATE ,AD_USER_ID FROM R_CONTACTINTEREST WHERE AD_Client_ID = 11  ORDER BY R_INTERESTAREA_ID , AD_USER_ID',
             'N', 'N', 15400, 528, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50267, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_GROUPUPDATES', 'ALL', 'D',
             'SELECT AD_USER_ID ,R_GROUP_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISSELFSERVICE FROM R_GROUPUPDATES WHERE AD_Client_ID = 11 AND AD_USER_ID<1000000 AND R_GROUP_ID<1000000 ORDER BY AD_USER_ID ,R_GROUP_ID',
             'N', 'N', 15500, 786, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50268, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_REQUESTPROCESSOR', 'ALL', 'D',
             'SELECT R_REQUESTPROCESSOR_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,FREQUENCY ,FREQUENCYTYPE ,DATELASTRUN ,DATENEXTRUN ,PROCESSING ,OVERDUEALERTDAYS ,OVERDUEASSIGNDAYS ,SUPERVISOR_ID ,KEEPLOGDAYS ,REMINDDAYS ,INACTIVITYALERTDAYS ,R_REQUESTTYPE_ID FROM R_REQUESTPROCESSOR WHERE AD_Client_ID = 11 AND R_REQUESTPROCESSOR_ID<1000000 ORDER BY R_REQUESTPROCESSOR_ID',
             'N', 'N', 15600, 420, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50269, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_REQUESTTYPEUPDATES', 'ALL', 'D',
             'SELECT AD_USER_ID ,R_REQUESTTYPE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISSELFSERVICE FROM R_REQUESTTYPEUPDATES WHERE AD_Client_ID = 11 AND AD_USER_ID<1000000 AND R_REQUESTTYPE_ID<1000000 ORDER BY AD_USER_ID ,R_REQUESTTYPE_ID',
             'N', 'N', 15700, 784, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50270, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'S_RESOURCE', 'ALL', 'D',
             'SELECT S_RESOURCE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,S_RESOURCETYPE_ID ,M_WAREHOUSE_ID ,ISAVAILABLE ,AD_USER_ID ,CHARGEABLEQTY FROM S_RESOURCE WHERE AD_Client_ID = 11 AND S_RESOURCE_ID<1000000 ORDER BY S_RESOURCE_ID',
             'N', 'N', 15800, 487, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50271, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_CLIENTINFO', 'ALL', 'D',
             'SELECT AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISDISCOUNTLINEAMT ,C_CALENDAR_ID ,C_ACCTSCHEMA1_ID ,C_UOM_VOLUME_ID ,C_UOM_WEIGHT_ID ,C_UOM_LENGTH_ID ,C_UOM_TIME_ID ,AD_TREE_MENU_ID ,AD_TREE_ORG_ID ,AD_TREE_BPARTNER_ID ,AD_TREE_PROJECT_ID ,AD_TREE_SALESREGION_ID ,AD_TREE_PRODUCT_ID ,M_PRODUCTFREIGHT_ID ,C_BPARTNERCASHTRX_ID ,KEEPLOGDAYS ,AD_TREE_ACTIVITY_ID ,AD_TREE_CAMPAIGN_ID FROM AD_CLIENTINFO WHERE AD_Client_ID = 11 AND AD_CLIENT_ID<1000000 ORDER BY AD_CLIENT_ID',
             'N', 'N', 15900, 227, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50272, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_FORM_ACCESS', 'ALL', 'D',
             'SELECT AD_FORM_ID ,AD_ROLE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISREADWRITE FROM AD_FORM_ACCESS WHERE AD_Client_ID = 11 AND AD_ROLE_ID<1000000 AND AD_FORM_ID<1000000 ORDER BY AD_ROLE_ID ,AD_FORM_ID',
             'N', 'N', 16000, 378, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50273, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_PROCESS_ACCESS', 'ALL', 'D',
             'SELECT AD_PROCESS_ID ,AD_ROLE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISREADWRITE FROM AD_PROCESS_ACCESS WHERE AD_Client_ID = 11 AND AD_ROLE_ID<1000000 AND AD_PROCESS_ID<1000000 ORDER BY AD_ROLE_ID ,AD_PROCESS_ID',
             'N', 'N', 16100, 197, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50274, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_ROLE_ORGACCESS', 'ALL', 'D',
             'SELECT AD_ROLE_ID ,AD_ORG_ID ,AD_CLIENT_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISREADONLY FROM AD_ROLE_ORGACCESS WHERE AD_Client_ID = 11 AND AD_ROLE_ID<1000000 AND AD_ORG_ID<1000000 ORDER BY AD_ROLE_ID ,AD_ORG_ID',
             'N', 'N', 16200, 422, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50275, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_TABLE_ACCESS', 'ALL', 'D',
             'SELECT AD_ROLE_ID ,AD_TABLE_ID ,ACCESSTYPERULE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATEDBY ,UPDATED ,ISREADONLY ,ISCANREPORT ,ISCANEXPORT ,ISEXCLUDE FROM AD_TABLE_ACCESS WHERE AD_Client_ID = 11 AND AD_ROLE_ID<1000000 AND AD_TABLE_ID<1000000 ORDER BY AD_ROLE_ID ,AD_TABLE_ID ,ACCESSTYPERULE',
             'N', 'N', 16300, 565, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50276, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_USER_ROLES', 'ALL', 'D',
             'SELECT AD_USER_ID ,AD_ROLE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY FROM AD_USER_ROLES WHERE AD_Client_ID = 11 AND AD_ROLE_ID<1000000 AND AD_USER_ID<1000000 ORDER BY AD_ROLE_ID ,AD_USER_ID',
             'N', 'N', 16400, 157, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50277, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WINDOW_ACCESS', 'ALL', 'D',
             'SELECT AD_WINDOW_ID ,AD_ROLE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISREADWRITE FROM AD_WINDOW_ACCESS WHERE AD_Client_ID = 11 AND AD_ROLE_ID<1000000 AND AD_WINDOW_ID<1000000 ORDER BY AD_ROLE_ID ,AD_WINDOW_ID',
             'N', 'N', 16500, 201, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50278, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'AD_WORKFLOW_ACCESS', 'ALL', 'D',
             'SELECT AD_WORKFLOW_ID ,AD_ROLE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISREADWRITE FROM AD_WORKFLOW_ACCESS WHERE AD_Client_ID = 11 AND AD_ROLE_ID<1000000 AND AD_WORKFLOW_ID<1000000 ORDER BY AD_ROLE_ID ,AD_WORKFLOW_ID',
             'N', 'N', 16600, 202, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50279, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_BP_BANKACCOUNT', 'ALL', 'D',
             'SELECT C_BP_BANKACCOUNT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,CREATED ,UPDATED ,ISACTIVE ,CREATEDBY ,UPDATEDBY ,C_BPARTNER_ID ,C_BANK_ID ,ISACH ,BANKACCOUNTTYPE ,ROUTINGNO ,ACCOUNTNO ,CREDITCARDTYPE ,CREDITCARDNUMBER ,CREDITCARDVV ,CREDITCARDEXPMM ,CREDITCARDEXPYY ,A_NAME ,A_STREET ,A_CITY ,A_STATE ,A_ZIP ,A_IDENT_DL ,A_EMAIL ,A_IDENT_SSN ,R_AVSADDR ,R_AVSZIP ,A_COUNTRY ,AD_USER_ID ,BPBANKACCTUSE FROM C_BP_BANKACCOUNT WHERE AD_Client_ID = 11 AND C_BP_BANKACCOUNT_ID<1000000 ORDER BY C_BP_BANKACCOUNT_ID',
             'N', 'N', 16700, 298, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50280, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_BP_RELATION', 'ALL', 'D',
             'SELECT C_BP_RELATION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,C_BPARTNER_ID ,C_BPARTNER_LOCATION_ID ,ISSHIPTO ,ISBILLTO ,ISPAYFROM ,ISREMITTO ,C_BPARTNERRELATION_ID ,C_BPARTNERRELATION_LOCATION_ID FROM C_BP_RELATION WHERE AD_Client_ID = 11 AND C_BP_RELATION_ID<1000000 ORDER BY C_BP_RELATION_ID',
             'N', 'N', 16800, 678, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50281, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_COMMISSION', 'ALL', 'D',
             'SELECT C_COMMISSION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,C_BPARTNER_ID ,C_CURRENCY_ID ,FREQUENCYTYPE ,DOCBASISTYPE ,LISTDETAILS ,DATELASTRUN ,CREATEFROM ,PROCESSING ,C_CHARGE_ID FROM C_COMMISSION WHERE AD_Client_ID = 11 AND C_COMMISSION_ID<1000000 ORDER BY C_COMMISSION_ID',
             'N', 'N', 16900, 429, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50282, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_ELEMENTVALUE_TRL', 'ALL', 'D',
             'SELECT C_ELEMENTVALUE_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,ISTRANSLATED FROM C_ELEMENTVALUE_TRL WHERE AD_Client_ID = 11 AND C_ELEMENTVALUE_ID<1000000 ORDER BY C_ELEMENTVALUE_ID ,AD_LANGUAGE',
             'N', 'N', 17000, 302, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50283, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_RFQ_TOPICSUBSCRIBER', 'ALL', 'D',
             'SELECT C_RFQ_TOPICSUBSCRIBER_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_RFQ_TOPIC_ID ,C_BPARTNER_ID ,C_BPARTNER_LOCATION_ID ,AD_USER_ID ,SUBSCRIBEDATE ,OPTOUTDATE FROM C_RFQ_TOPICSUBSCRIBER WHERE AD_Client_ID = 11 AND C_RFQ_TOPICSUBSCRIBER_ID<1000000 ORDER BY C_RFQ_TOPICSUBSCRIBER_ID',
             'N', 'N', 17100, 670, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50284, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'GL_JOURNAL', 'ALL', 'D',
             'SELECT GL_JOURNAL_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_ACCTSCHEMA_ID ,C_DOCTYPE_ID ,DOCUMENTNO ,DOCSTATUS ,DOCACTION ,ISAPPROVED ,ISPRINTED ,DESCRIPTION ,POSTINGTYPE ,GL_BUDGET_ID ,GL_CATEGORY_ID ,DATEDOC ,DATEACCT ,C_PERIOD_ID ,C_CURRENCY_ID ,CURRENCYRATE ,GL_JOURNALBATCH_ID ,TOTALDR ,TOTALCR ,CONTROLAMT ,PROCESSING ,PROCESSED ,POSTED ,C_CONVERSIONTYPE_ID FROM GL_JOURNAL WHERE AD_Client_ID = 11 AND GL_JOURNAL_ID<1000000 ORDER BY GL_JOURNAL_ID',
             'N', 'N', 17200, 224, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50285, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_DISTRIBUTIONLISTLINE', 'ALL', 'D',
             'SELECT M_DISTRIBUTIONLISTLINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,M_DISTRIBUTIONLIST_ID ,C_BPARTNER_ID ,C_BPARTNER_LOCATION_ID ,MINQTY ,RATIO ,DESCRIPTION FROM M_DISTRIBUTIONLISTLINE WHERE AD_Client_ID = 11 AND M_DISTRIBUTIONLISTLINE_ID<1000000 ORDER BY M_DISTRIBUTIONLISTLINE_ID',
             'N', 'N', 17300, 665, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50286, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_DISTRIBUTIONRUN', 'ALL', 'D',
             'SELECT M_DISTRIBUTIONRUN_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,ISCREATESINGLEORDER ,C_BPARTNER_ID ,C_BPARTNER_LOCATION_ID ,PROCESSING FROM M_DISTRIBUTIONRUN WHERE AD_Client_ID = 11 AND M_DISTRIBUTIONRUN_ID<1000000 ORDER BY M_DISTRIBUTIONRUN_ID',
             'N', 'N', 17400, 712, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50287, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_PRODUCT', 'ALL', 'D',
             'SELECT M_PRODUCT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,DOCUMENTNOTE ,HELP ,UPC ,SKU ,C_UOM_ID ,SALESREP_ID ,ISSUMMARY ,ISSTOCKED ,ISPURCHASED ,ISSOLD ,ISBOM ,ISINVOICEPRINTDETAILS ,ISPICKLISTPRINTDETAILS ,ISVERIFIED ,C_REVENUERECOGNITION_ID ,M_PRODUCT_CATEGORY_ID ,CLASSIFICATION ,VOLUME ,WEIGHT ,SHELFWIDTH ,SHELFHEIGHT ,SHELFDEPTH ,UNITSPERPALLET ,C_TAXCATEGORY_ID ,S_RESOURCE_ID ,DISCONTINUED ,DISCONTINUEDBY ,PROCESSING ,S_EXPENSETYPE_ID ,PRODUCTTYPE ,IMAGEURL ,DESCRIPTIONURL ,GUARANTEEDAYS ,R_MAILTEXT_ID ,VERSIONNO ,M_ATTRIBUTESET_ID ,M_ATTRIBUTESETINSTANCE_ID ,DOWNLOADURL ,M_FREIGHTCATEGORY_ID ,M_LOCATOR_ID ,GUARANTEEDAYSMIN ,ISWEBSTOREFEATURED ,ISSELFSERVICE ,C_SUBSCRIPTIONTYPE_ID ,ISDROPSHIP ,ISEXCLUDEAUTODELIVERY FROM M_PRODUCT WHERE AD_Client_ID = 11 AND M_PRODUCT_ID<1000000 ORDER BY M_PRODUCT_ID',
             'N', 'N', 17500, 208, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50288, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_SHIPPER', 'ALL', 'D',
             'SELECT M_SHIPPER_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,C_BPARTNER_ID ,TRACKINGURL FROM M_SHIPPER WHERE AD_Client_ID = 11 AND M_SHIPPER_ID<1000000 ORDER BY M_SHIPPER_ID',
             'N', 'N', 17600, 253, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50289, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'PA_RATIO', 'ALL', 'D',
             'SELECT PA_RATIO_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,C_ACCTSCHEMA_ID FROM PA_RATIO WHERE AD_Client_ID = 11 AND PA_RATIO_ID<1000000 ORDER BY PA_RATIO_ID',
             'N', 'N', 17700, 835, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50290, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'PA_REPORT', 'ALL', 'D',
             'SELECT PA_REPORT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,PA_REPORTLINESET_ID ,PA_REPORTCOLUMNSET_ID ,C_ACCTSCHEMA_ID ,C_CALENDAR_ID ,PROCESSING ,AD_PRINTFORMAT_ID ,LISTSOURCES ,LISTTRX FROM PA_REPORT WHERE AD_Client_ID = 11 AND PA_REPORT_ID<1000000 ORDER BY PA_REPORT_ID',
             'N', 'N', 17800, 445, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50291, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'PA_SLA_GOAL', 'ALL', 'D',
             'SELECT PA_SLA_GOAL_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,PA_SLA_CRITERIA_ID ,C_BPARTNER_ID ,VALIDFROM ,VALIDTO ,MEASURETARGET ,MEASUREACTUAL ,DATELASTRUN ,PROCESSING ,PROCESSED FROM PA_SLA_GOAL WHERE AD_Client_ID = 11 AND PA_SLA_GOAL_ID<1000000 ORDER BY PA_SLA_GOAL_ID',
             'N', 'N', 17900, 745, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50292, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_REQUESTPROCESSOR_ROUTE', 'ALL', 'D',
             'SELECT R_REQUESTPROCESSOR_ROUTE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,R_REQUESTPROCESSOR_ID ,SEQNO ,KEYWORD ,AD_USER_ID ,R_REQUESTTYPE_ID FROM R_REQUESTPROCESSOR_ROUTE WHERE AD_Client_ID = 11 AND R_REQUESTPROCESSOR_ROUTE_ID<1000000 ORDER BY R_REQUESTPROCESSOR_ROUTE_ID',
             'N', 'N', 18000, 474, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50293, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'S_RESOURCEASSIGNMENT', 'ALL', 'D',
             'SELECT S_RESOURCEASSIGNMENT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,S_RESOURCE_ID ,NAME ,DESCRIPTION ,ASSIGNDATEFROM ,ASSIGNDATETO ,QTY ,ISCONFIRMED FROM S_RESOURCEASSIGNMENT WHERE AD_Client_ID = 11 AND S_RESOURCEASSIGNMENT_ID<1000000 ORDER BY S_RESOURCEASSIGNMENT_ID',
             'N', 'N', 18100, 485, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50294, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'S_RESOURCEUNAVAILABLE', 'ALL', 'D',
             'SELECT S_RESOURCEUNAVAILABLE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,S_RESOURCE_ID ,DATEFROM ,DATETO ,DESCRIPTION FROM S_RESOURCEUNAVAILABLE WHERE AD_Client_ID = 11 AND S_RESOURCEUNAVAILABLE_ID<1000000 ORDER BY S_RESOURCEUNAVAILABLE_ID',
             'N', 'N', 18200, 482, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50295, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'S_TIMEEXPENSE', 'ALL', 'D',
             'SELECT S_TIMEEXPENSE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,DOCUMENTNO ,C_BPARTNER_ID ,DATEREPORT ,DESCRIPTION ,PROCESSING ,PROCESSED ,M_PRICELIST_ID ,M_WAREHOUSE_ID ,ISAPPROVED ,DOCSTATUS ,DOCACTION ,APPROVALAMT FROM S_TIMEEXPENSE WHERE AD_Client_ID = 11 AND S_TIMEEXPENSE_ID<1000000 ORDER BY S_TIMEEXPENSE_ID',
             'N', 'N', 18300, 486, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50296, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'W_CLICKCOUNT', 'ALL', 'D',
             'SELECT W_CLICKCOUNT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,TARGETURL ,C_BPARTNER_ID FROM W_CLICKCOUNT WHERE AD_Client_ID = 11 AND W_CLICKCOUNT_ID<1000000 ORDER BY W_CLICKCOUNT_ID',
             'N', 'N', 18400, 553, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50297, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'W_COUNTERCOUNT', 'ALL', 'D',
             'SELECT W_COUNTERCOUNT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,PAGEURL ,C_BPARTNER_ID FROM W_COUNTERCOUNT WHERE AD_Client_ID = 11 AND W_COUNTERCOUNT_ID<1000000 ORDER BY W_COUNTERCOUNT_ID',
             'N', 'N', 18500, 552, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50298, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_BPARTNER_PRODUCT', 'ALL', 'D',
             'SELECT C_BPARTNER_ID ,M_PRODUCT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,DESCRIPTION ,SHELFLIFEMINPCT ,SHELFLIFEMINDAYS ,QUALITYRATING ,VENDORPRODUCTNO ,VENDORCATEGORY ,MANUFACTURER FROM C_BPARTNER_PRODUCT WHERE AD_Client_ID = 11 AND C_BPARTNER_ID<1000000 AND M_PRODUCT_ID<1000000 ORDER BY C_BPARTNER_ID ,M_PRODUCT_ID',
             'N', 'N', 18600, 632, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50299, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_COMMISSIONLINE', 'ALL', 'D',
             'SELECT C_COMMISSIONLINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_COMMISSION_ID ,LINE ,DESCRIPTION ,AMTSUBTRACT ,AMTMULTIPLIER ,QTYSUBTRACT ,QTYMULTIPLIER ,ISPOSITIVEONLY ,COMMISSIONORDERS ,ORG_ID ,M_PRODUCT_CATEGORY_ID ,M_PRODUCT_ID ,C_BP_GROUP_ID ,C_BPARTNER_ID ,C_SALESREGION_ID FROM C_COMMISSIONLINE WHERE AD_Client_ID = 11 AND C_COMMISSIONLINE_ID<1000000 ORDER BY C_COMMISSIONLINE_ID',
             'N', 'N', 18700, 431, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50300, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_PHASE', 'ALL', 'D',
             'SELECT AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,SEQNO ,NAME ,DESCRIPTION ,HELP ,C_PROJECTTYPE_ID ,STANDARDQTY ,C_PHASE_ID ,M_PRODUCT_ID FROM C_PHASE WHERE AD_Client_ID = 11 AND C_PHASE_ID<1000000 ORDER BY C_PHASE_ID',
             'N', 'N', 18800, 577, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50301, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_POSKEY', 'ALL', 'D',
             'SELECT C_POSKEY_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,C_POSKEYLAYOUT_ID ,SEQNO ,M_PRODUCT_ID ,QTY ,AD_PRINTCOLOR_ID FROM C_POSKEY WHERE AD_Client_ID = 11 AND C_POSKEY_ID<1000000 ORDER BY C_POSKEY_ID',
             'N', 'N', 18900, 750, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50302, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_BOM', 'ALL', 'D',
             'SELECT M_BOM_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,M_PRODUCT_ID ,M_CHANGENOTICE_ID ,BOMTYPE ,BOMUSE ,NAME ,DESCRIPTION ,HELP ,PROCESSING FROM M_BOM WHERE AD_Client_ID = 11 AND M_BOM_ID<1000000 ORDER BY M_BOM_ID',
             'N', 'N', 19000, 798, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50303, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_BOMALTERNATIVE', 'ALL', 'D',
             'SELECT M_BOMALTERNATIVE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,M_PRODUCT_ID FROM M_BOMALTERNATIVE WHERE AD_Client_ID = 11 AND M_BOMALTERNATIVE_ID<1000000 ORDER BY M_BOMALTERNATIVE_ID',
             'N', 'N', 19100, 795, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50304, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_COST', 'ALL', 'D',
             'SELECT AD_CLIENT_ID ,AD_ORG_ID ,M_PRODUCT_ID ,M_COSTTYPE_ID ,C_ACCTSCHEMA_ID ,M_COSTELEMENT_ID ,M_ATTRIBUTESETINSTANCE_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,CURRENTCOSTPRICE ,CURRENTQTY ,CUMULATEDAMT ,CUMULATEDQTY ,FUTURECOSTPRICE ,DESCRIPTION ,PERCENT FROM M_COST WHERE AD_Client_ID = 11 AND AD_CLIENT_ID<1000000 AND AD_ORG_ID<1000000 AND M_PRODUCT_ID<1000000 AND M_COSTTYPE_ID<1000000 AND C_ACCTSCHEMA_ID<1000000 AND M_COSTELEMENT_ID<1000000 AND M_ATTRIBUTESETINSTANCE_ID<1000000 ORDER BY AD_CLIENT_ID ,AD_ORG_ID ,M_PRODUCT_ID ,M_COSTTYPE_ID ,C_ACCTSCHEMA_ID ,M_COSTELEMENT_ID ,M_ATTRIBUTESETINSTANCE_ID',
             'N', 'N', 19200, 771, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50305, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_DISCOUNTSCHEMABREAK', 'ALL', 'D',
             'SELECT M_DISCOUNTSCHEMABREAK_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,M_DISCOUNTSCHEMA_ID ,SEQNO ,BREAKVALUE ,BREAKDISCOUNT ,M_PRODUCT_CATEGORY_ID ,M_PRODUCT_ID ,ISBPARTNERFLATDISCOUNT FROM M_DISCOUNTSCHEMABREAK WHERE AD_Client_ID = 11 AND M_DISCOUNTSCHEMABREAK_ID<1000000 ORDER BY M_DISCOUNTSCHEMABREAK_ID',
             'N', 'N', 19300, 476, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50306, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_DISCOUNTSCHEMALINE', 'ALL', 'D',
             'SELECT M_DISCOUNTSCHEMALINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,M_DISCOUNTSCHEMA_ID ,SEQNO ,M_PRODUCT_CATEGORY_ID ,C_BPARTNER_ID ,M_PRODUCT_ID ,CONVERSIONDATE ,LIST_BASE ,LIST_ADDAMT ,LIST_DISCOUNT ,LIST_ROUNDING ,LIST_MINAMT ,LIST_MAXAMT ,LIST_FIXED ,STD_BASE ,STD_ADDAMT ,STD_DISCOUNT ,STD_ROUNDING ,STD_MINAMT ,STD_MAXAMT ,STD_FIXED ,LIMIT_BASE ,LIMIT_ADDAMT ,LIMIT_DISCOUNT ,LIMIT_ROUNDING ,LIMIT_MINAMT ,LIMIT_MAXAMT ,LIMIT_FIXED ,C_CONVERSIONTYPE_ID FROM M_DISCOUNTSCHEMALINE WHERE AD_Client_ID = 11 AND M_DISCOUNTSCHEMALINE_ID<1000000 ORDER BY M_DISCOUNTSCHEMALINE_ID',
             'N', 'N', 19400, 477, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50307, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_DISTRIBUTIONRUNLINE', 'ALL', 'D',
             'SELECT M_DISTRIBUTIONRUNLINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,M_DISTRIBUTIONRUN_ID ,LINE ,DESCRIPTION ,M_DISTRIBUTIONLIST_ID ,M_PRODUCT_ID ,TOTALQTY ,MINQTY FROM M_DISTRIBUTIONRUNLINE WHERE AD_Client_ID = 11 AND M_DISTRIBUTIONRUNLINE_ID<1000000 ORDER BY M_DISTRIBUTIONRUNLINE_ID',
             'N', 'N', 19500, 713, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50308, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_FREIGHT', 'ALL', 'D',
             'SELECT M_FREIGHT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,M_SHIPPER_ID ,M_FREIGHTCATEGORY_ID ,VALIDFROM ,C_COUNTRY_ID ,TO_COUNTRY_ID ,C_REGION_ID ,TO_REGION_ID ,C_CURRENCY_ID ,FREIGHTAMT FROM M_FREIGHT WHERE AD_Client_ID = 11 AND M_FREIGHT_ID<1000000 ORDER BY M_FREIGHT_ID',
             'N', 'N', 19600, 596, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50309, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_PRODUCT_BOM', 'ALL', 'D',
             'SELECT M_PRODUCT_BOM_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,LINE ,M_PRODUCT_ID ,M_PRODUCTBOM_ID ,BOMQTY ,DESCRIPTION ,BOMTYPE FROM M_PRODUCT_BOM WHERE AD_Client_ID = 11 AND M_PRODUCT_BOM_ID<1000000 ORDER BY M_PRODUCT_BOM_ID',
             'N', 'N', 19700, 383, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50310, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_PRODUCT_COSTING', 'ALL', 'D',
             'SELECT M_PRODUCT_ID ,C_ACCTSCHEMA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,CURRENTCOSTPRICE ,FUTURECOSTPRICE ,COSTSTANDARD ,COSTSTANDARDPOQTY ,COSTSTANDARDPOAMT ,COSTSTANDARDCUMQTY ,COSTSTANDARDCUMAMT ,COSTAVERAGE ,COSTAVERAGECUMQTY ,COSTAVERAGECUMAMT ,PRICELASTPO ,PRICELASTINV ,TOTALINVQTY ,TOTALINVAMT FROM M_PRODUCT_COSTING WHERE AD_Client_ID = 11 AND M_PRODUCT_ID<1000000 AND C_ACCTSCHEMA_ID<1000000 ORDER BY M_PRODUCT_ID ,C_ACCTSCHEMA_ID',
             'N', 'N', 19800, 327, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50311, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_PRODUCT_PO', 'ALL', 'D',
             'SELECT M_PRODUCT_ID ,C_BPARTNER_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISCURRENTVENDOR ,C_UOM_ID ,C_CURRENCY_ID ,PRICELIST ,PRICEPO ,PRICEEFFECTIVE ,PRICELASTPO ,PRICELASTINV ,VENDORPRODUCTNO ,UPC ,VENDORCATEGORY ,DISCONTINUED ,DISCONTINUEDBY ,ORDER_MIN ,ORDER_PACK ,COSTPERORDER ,DELIVERYTIME_PROMISED ,DELIVERYTIME_ACTUAL ,QUALITYRATING ,ROYALTYAMT ,MANUFACTURER FROM M_PRODUCT_PO WHERE AD_Client_ID = 11 AND M_PRODUCT_ID<1000000 AND C_BPARTNER_ID<1000000 ORDER BY M_PRODUCT_ID ,C_BPARTNER_ID',
             'N', 'N', 19900, 210, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50312, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_PRODUCT_TRL', 'ALL', 'D',
             'SELECT M_PRODUCT_ID ,AD_LANGUAGE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DOCUMENTNOTE ,ISTRANSLATED ,DESCRIPTION FROM M_PRODUCT_TRL WHERE AD_Client_ID = 11 AND M_PRODUCT_ID<1000000 ORDER BY M_PRODUCT_ID ,AD_LANGUAGE',
             'N', 'N', 20000, 312, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50313, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_PRODUCTDOWNLOAD', 'ALL', 'D',
             'SELECT M_PRODUCTDOWNLOAD_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,M_PRODUCT_ID ,NAME ,DOWNLOADURL FROM M_PRODUCTDOWNLOAD WHERE AD_Client_ID = 11 AND M_PRODUCTDOWNLOAD_ID<1000000 ORDER BY M_PRODUCTDOWNLOAD_ID',
             'N', 'N', 20100, 777, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50314, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_PRODUCTPRICE', 'ALL', 'D',
             'SELECT M_PRICELIST_VERSION_ID ,M_PRODUCT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,PRICELIST ,PRICESTD ,PRICELIMIT FROM M_PRODUCTPRICE WHERE AD_Client_ID = 11 AND M_PRICELIST_VERSION_ID<1000000 AND M_PRODUCT_ID<1000000 ORDER BY M_PRICELIST_VERSION_ID ,M_PRODUCT_ID',
             'N', 'N', 20200, 251, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50315, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_RELATEDPRODUCT', 'ALL', 'D',
             'SELECT M_PRODUCT_ID ,RELATEDPRODUCT_ID ,RELATEDPRODUCTTYPE ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION FROM M_RELATEDPRODUCT WHERE AD_Client_ID = 11 AND M_PRODUCT_ID<1000000 AND RELATEDPRODUCT_ID<1000000 ORDER BY M_PRODUCT_ID ,RELATEDPRODUCT_ID ,RELATEDPRODUCTTYPE',
             'N', 'N', 20300, 662, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50316, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_REPLENISH', 'ALL', 'D',
             'SELECT M_PRODUCT_ID ,M_WAREHOUSE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,REPLENISHTYPE ,LEVEL_MIN ,LEVEL_MAX ,M_WAREHOUSESOURCE_ID FROM M_REPLENISH WHERE AD_Client_ID = 11 AND M_PRODUCT_ID<1000000 AND M_WAREHOUSE_ID<1000000 ORDER BY M_PRODUCT_ID ,M_WAREHOUSE_ID',
             'N', 'N', 20400, 249, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50317, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_REQUISITIONLINE', 'ALL', 'D',
             'SELECT M_REQUISITIONLINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,LINE ,M_REQUISITION_ID ,QTY ,M_PRODUCT_ID ,DESCRIPTION ,PRICEACTUAL ,LINENETAMT ,C_ORDERLINE_ID ,M_ATTRIBUTESETINSTANCE_ID ,C_CHARGE_ID FROM M_REQUISITIONLINE WHERE AD_Client_ID = 11 AND M_REQUISITIONLINE_ID<1000000 ORDER BY M_REQUISITIONLINE_ID',
             'N', 'N', 20500, 703, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50318, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_STORAGE', 'ALL', 'D',
             'SELECT M_PRODUCT_ID ,M_LOCATOR_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,QTYONHAND ,QTYRESERVED ,QTYORDERED ,DATELASTINVENTORY ,M_ATTRIBUTESETINSTANCE_ID FROM M_STORAGE WHERE AD_Client_ID = 11 AND M_PRODUCT_ID<1000000 AND M_LOCATOR_ID<1000000 AND M_ATTRIBUTESETINSTANCE_ID<1000000 ORDER BY M_PRODUCT_ID ,M_LOCATOR_ID ,M_ATTRIBUTESETINSTANCE_ID',
             'N', 'N', 20600, 250, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50319, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'PA_MEASURE', 'ALL', 'D',
             'SELECT PA_MEASURE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,MEASURETYPE ,MANUALACTUAL ,MANUALNOTE ,CALCULATIONCLASS ,PA_MEASURECALC_ID ,PA_BENCHMARK_ID ,PA_RATIO_ID ,PA_HIERARCHY_ID ,MEASUREDATATYPE ,R_REQUESTTYPE_ID ,C_PROJECTTYPE_ID FROM PA_MEASURE WHERE AD_Client_ID = 11 AND PA_MEASURE_ID<1000000 ORDER BY PA_MEASURE_ID',
             'N', 'N', 20700, 441, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50320, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'PA_RATIOELEMENT', 'ALL', 'D',
             'SELECT PA_RATIOELEMENT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,PA_RATIO_ID ,RATIOOPERAND ,RATIOELEMENTTYPE ,ACCOUNT_ID ,PA_RATIOUSED_ID ,PA_MEASURECALC_ID ,CONSTANTVALUE ,SEQNO ,POSTINGTYPE FROM PA_RATIOELEMENT WHERE AD_Client_ID = 11 AND PA_RATIOELEMENT_ID<1000000 ORDER BY PA_RATIOELEMENT_ID',
             'N', 'N', 20800, 836, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50321, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'PA_SLA_MEASURE', 'ALL', 'D',
             'SELECT PA_SLA_MEASURE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,PA_SLA_GOAL_ID ,DATETRX ,MEASUREACTUAL ,DESCRIPTION ,AD_TABLE_ID ,RECORD_ID ,PROCESSED ,PROCESSING FROM PA_SLA_MEASURE WHERE AD_Client_ID = 11 AND PA_SLA_MEASURE_ID<1000000 ORDER BY PA_SLA_MEASURE_ID',
             'N', 'N', 20900, 743, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50322, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'W_ADVERTISEMENT', 'ALL', 'D',
             'SELECT W_ADVERTISEMENT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,ISSELFSERVICE ,C_BPARTNER_ID ,AD_USER_ID ,W_CLICKCOUNT_ID ,W_COUNTERCOUNT_ID ,VALIDFROM ,VALIDTO ,IMAGEURL ,ADTEXT ,WEBPARAM1 ,WEBPARAM2 ,WEBPARAM3 ,WEBPARAM4 ,PUBLISHSTATUS ,VERSION ,PROCESSING FROM W_ADVERTISEMENT WHERE AD_Client_ID = 11 AND W_ADVERTISEMENT_ID<1000000 ORDER BY W_ADVERTISEMENT_ID',
             'N', 'N', 21000, 579, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50323, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_CYCLEPHASE', 'ALL', 'D',
             'SELECT C_CYCLESTEP_ID ,C_PHASE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY FROM C_CYCLEPHASE WHERE AD_Client_ID = 11 AND C_CYCLESTEP_ID<1000000 AND C_PHASE_ID<1000000 ORDER BY C_CYCLESTEP_ID ,C_PHASE_ID',
             'N', 'N', 21100, 433, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50324, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_PROJECT', 'ALL', 'D',
             'SELECT C_PROJECT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,VALUE ,NAME ,DESCRIPTION ,NOTE ,ISSUMMARY ,AD_USER_ID ,C_BPARTNER_ID ,C_BPARTNER_LOCATION_ID ,POREFERENCE ,C_PAYMENTTERM_ID ,C_CURRENCY_ID ,M_PRICELIST_VERSION_ID ,C_CAMPAIGN_ID ,ISCOMMITMENT ,PLANNEDAMT ,PLANNEDQTY ,PLANNEDMARGINAMT ,COMMITTEDAMT ,DATECONTRACT ,DATEFINISH ,GENERATETO ,PROCESSED ,SALESREP_ID ,COPYFROM ,C_PROJECTTYPE_ID ,COMMITTEDQTY ,INVOICEDAMT ,INVOICEDQTY ,PROJECTBALANCEAMT ,C_PHASE_ID ,ISCOMMITCEILING ,M_WAREHOUSE_ID ,PROJECTCATEGORY ,PROCESSING ,C_BPARTNERSR_ID ,PROJINVOICERULE ,PROJECTLINELEVEL FROM C_PROJECT WHERE AD_Client_ID = 11 AND C_PROJECT_ID<1000000 ORDER BY C_PROJECT_ID',
             'N', 'N', 21200, 203, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50325, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_TASK', 'ALL', 'D',
             'SELECT C_TASK_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,SEQNO ,NAME ,DESCRIPTION ,HELP ,C_PHASE_ID ,M_PRODUCT_ID ,STANDARDQTY FROM C_TASK WHERE AD_Client_ID = 11 AND C_TASK_ID<1000000 ORDER BY C_TASK_ID',
             'N', 'N', 21300, 583, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50326, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'PA_GOAL', 'ALL', 'D',
             'SELECT PA_GOAL_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,SEQNO ,NAME ,DESCRIPTION ,NOTE ,AD_USER_ID ,PA_COLORSCHEMA_ID ,ISSUMMARY ,PA_GOALPARENT_ID ,PA_MEASURE_ID ,RELATIVEWEIGHT ,MEASURETARGET ,MEASURESCOPE ,MEASUREDISPLAY ,DATEFROM ,DATETO ,MEASUREACTUAL ,GOALPERFORMANCE ,DATELASTRUN ,AD_ROLE_ID FROM PA_GOAL WHERE AD_Client_ID = 11 AND PA_GOAL_ID<1000000 ORDER BY PA_GOAL_ID',
             'N', 'N', 21400, 440, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50327, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_ACCTSCHEMA_ELEMENT', 'ALL', 'D',
             'SELECT C_ACCTSCHEMA_ELEMENT_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,AD_ORG_ID ,UPDATEDBY ,C_ACCTSCHEMA_ID ,ELEMENTTYPE ,NAME ,SEQNO ,C_ELEMENT_ID ,AD_CLIENT_ID ,ISMANDATORY ,ISBALANCED ,ORG_ID ,C_ELEMENTVALUE_ID ,M_PRODUCT_ID ,C_BPARTNER_ID ,C_LOCATION_ID ,C_SALESREGION_ID ,C_PROJECT_ID ,C_CAMPAIGN_ID ,C_ACTIVITY_ID ,AD_COLUMN_ID FROM C_ACCTSCHEMA_ELEMENT WHERE AD_Client_ID = 11 AND C_ACCTSCHEMA_ELEMENT_ID<1000000 ORDER BY C_ACCTSCHEMA_ELEMENT_ID',
             'N', 'N', 21500, 279, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50328, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_CASH', 'ALL', 'D',
             'SELECT C_CASH_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_CASHBOOK_ID ,NAME ,DESCRIPTION ,STATEMENTDATE ,DATEACCT ,BEGINNINGBALANCE ,ENDINGBALANCE ,STATEMENTDIFFERENCE ,PROCESSING ,PROCESSED ,POSTED ,AD_ORGTRX_ID ,C_PROJECT_ID ,C_CAMPAIGN_ID ,C_ACTIVITY_ID ,USER1_ID ,USER2_ID ,ISAPPROVED ,DOCSTATUS ,DOCACTION FROM C_CASH WHERE AD_Client_ID = 11 AND C_CASH_ID<1000000 ORDER BY C_CASH_ID',
             'N', 'N', 21600, 407, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50329, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_PAYMENT', 'ALL', 'D',
             'SELECT C_PAYMENT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,DOCUMENTNO ,DATETRX ,ISRECEIPT ,C_DOCTYPE_ID ,TRXTYPE ,C_BANKACCOUNT_ID ,C_BPARTNER_ID ,C_INVOICE_ID ,C_BP_BANKACCOUNT_ID ,C_PAYMENTBATCH_ID ,TENDERTYPE ,CREDITCARDTYPE ,CREDITCARDNUMBER ,CREDITCARDVV ,CREDITCARDEXPMM ,CREDITCARDEXPYY ,MICR ,ROUTINGNO ,ACCOUNTNO ,CHECKNO ,A_NAME ,A_STREET ,A_CITY ,A_STATE ,A_ZIP ,A_IDENT_DL ,A_IDENT_SSN ,A_EMAIL ,VOICEAUTHCODE ,ORIG_TRXID ,PONUM ,C_CURRENCY_ID ,PAYAMT ,DISCOUNTAMT ,WRITEOFFAMT ,TAXAMT ,ISAPPROVED ,R_PNREF ,R_RESULT ,R_RESPMSG ,R_AUTHCODE ,R_AVSADDR ,R_AVSZIP ,R_INFO ,PROCESSING ,OPROCESSING ,DOCSTATUS ,DOCACTION ,ISRECONCILED ,ISALLOCATED ,ISONLINE ,PROCESSED ,POSTED ,ISOVERUNDERPAYMENT ,OVERUNDERAMT ,A_COUNTRY ,C_PROJECT_ID ,ISSELFSERVICE ,CHARGEAMT ,C_CHARGE_ID ,ISDELAYEDCAPTURE ,R_AUTHCODE_DC ,R_CVV2MATCH ,R_PNREF_DC ,SWIPE ,AD_ORGTRX_ID ,C_CAMPAIGN_ID ,C_ACTIVITY_ID ,USER1_ID ,USER2_ID ,C_CONVERSIONTYPE_ID ,DESCRIPTION ,DATEACCT ,C_ORDER_ID ,ISPREPAYMENT ,REF_PAYMENT_ID FROM C_PAYMENT WHERE AD_Client_ID = 11 AND C_PAYMENT_ID<1000000 ORDER BY C_PAYMENT_ID',
             'N', 'N', 21700, 335, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50330, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_VALIDCOMBINATION', 'ALL', 'D',
             'SELECT C_VALIDCOMBINATION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ALIAS ,COMBINATION ,DESCRIPTION ,ISFULLYQUALIFIED ,C_ACCTSCHEMA_ID ,ACCOUNT_ID ,M_PRODUCT_ID ,C_BPARTNER_ID ,AD_ORGTRX_ID ,C_LOCFROM_ID ,C_LOCTO_ID ,C_SALESREGION_ID ,C_PROJECT_ID ,C_CAMPAIGN_ID ,C_ACTIVITY_ID ,USER1_ID ,USER2_ID ,C_SUBACCT_ID ,USERELEMENT1_ID ,USERELEMENT2_ID FROM C_VALIDCOMBINATION WHERE AD_Client_ID = 11 AND C_VALIDCOMBINATION_ID<1000000 ORDER BY C_VALIDCOMBINATION_ID',
             'N', 'N', 21800, 176, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50331, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'GL_DISTRIBUTION', 'ALL', 'D',
             'SELECT GL_DISTRIBUTION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,POSTINGTYPE ,C_DOCTYPE_ID ,C_ACCTSCHEMA_ID ,ANYORG ,ORG_ID ,ANYACCT ,ACCOUNT_ID ,ANYPRODUCT ,M_PRODUCT_ID ,ANYBPARTNER ,C_BPARTNER_ID ,ANYPROJECT ,C_PROJECT_ID ,ANYCAMPAIGN ,C_CAMPAIGN_ID ,ANYACTIVITY ,C_ACTIVITY_ID ,ANYSALESREGION ,C_SALESREGION_ID ,ANYORGTRX ,AD_ORGTRX_ID ,ANYLOCTO ,C_LOCTO_ID ,ANYLOCFROM ,C_LOCFROM_ID ,ANYUSER1 ,USER1_ID ,ANYUSER2 ,USER2_ID ,PERCENTTOTAL ,ISVALID ,PROCESSING FROM GL_DISTRIBUTION WHERE AD_Client_ID = 11 AND GL_DISTRIBUTION_ID<1000000 ORDER BY GL_DISTRIBUTION_ID',
             'N', 'N', 21900, 708, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50332, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_INVENTORY', 'ALL', 'D',
             'SELECT M_INVENTORY_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,DOCUMENTNO ,DESCRIPTION ,M_WAREHOUSE_ID ,MOVEMENTDATE ,POSTED ,PROCESSED ,PROCESSING ,UPDATEQTY ,GENERATELIST ,M_PERPETUALINV_ID ,AD_ORGTRX_ID ,C_PROJECT_ID ,C_CAMPAIGN_ID ,C_ACTIVITY_ID ,USER1_ID ,USER2_ID ,ISAPPROVED ,DOCSTATUS ,DOCACTION ,APPROVALAMT ,C_DOCTYPE_ID FROM M_INVENTORY WHERE AD_Client_ID = 11 AND M_INVENTORY_ID<1000000 ORDER BY M_INVENTORY_ID',
             'N', 'N', 22000, 321, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50333, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_MOVEMENT', 'ALL', 'D',
             'SELECT M_MOVEMENT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATEDBY ,UPDATED ,DOCUMENTNO ,DESCRIPTION ,MOVEMENTDATE ,POSTED ,PROCESSED ,PROCESSING ,AD_ORGTRX_ID ,C_PROJECT_ID ,C_CAMPAIGN_ID ,C_ACTIVITY_ID ,USER1_ID ,USER2_ID ,DATERECEIVED ,DOCACTION ,DOCSTATUS ,ISINTRANSIT ,C_DOCTYPE_ID ,ISAPPROVED ,APPROVALAMT FROM M_MOVEMENT WHERE AD_Client_ID = 11 AND M_MOVEMENT_ID<1000000 ORDER BY M_MOVEMENT_ID',
             'N', 'N', 22100, 323, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50334, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'PA_REPORTCOLUMN', 'ALL', 'D',
             'SELECT PA_REPORTCOLUMN_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,PA_REPORTCOLUMNSET_ID ,NAME ,SEQNO ,DESCRIPTION ,ISPRINTED ,POSTINGTYPE ,GL_BUDGET_ID ,COLUMNTYPE ,RELATIVEPERIOD ,CURRENCYTYPE ,CALCULATIONTYPE ,AMOUNTTYPE ,C_CURRENCY_ID ,ISADHOCCONVERSION ,OPER_1_ID ,OPER_2_ID ,ELEMENTTYPE ,ORG_ID ,C_ELEMENTVALUE_ID ,C_PROJECT_ID ,C_BPARTNER_ID ,M_PRODUCT_ID ,C_CAMPAIGN_ID ,C_LOCATION_ID ,C_SALESREGION_ID ,C_ACTIVITY_ID FROM PA_REPORTCOLUMN WHERE AD_Client_ID = 11 AND PA_REPORTCOLUMN_ID<1000000 ORDER BY PA_REPORTCOLUMN_ID',
             'N', 'N', 22200, 446, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50335, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'PA_REPORTSOURCE', 'ALL', 'D',
             'SELECT PA_REPORTSOURCE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,DESCRIPTION ,PA_REPORTLINE_ID ,ELEMENTTYPE ,ORG_ID ,C_ELEMENTVALUE_ID ,C_PROJECT_ID ,C_BPARTNER_ID ,M_PRODUCT_ID ,C_CAMPAIGN_ID ,C_LOCATION_ID ,C_SALESREGION_ID ,C_ACTIVITY_ID FROM PA_REPORTSOURCE WHERE AD_Client_ID = 11 AND PA_REPORTSOURCE_ID<1000000 ORDER BY PA_REPORTSOURCE_ID',
             'N', 'N', 22300, 450, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50336, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_ACCTSCHEMA_DEFAULT', 'ALL', 'D',
             'SELECT C_ACCTSCHEMA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,W_INVENTORY_ACCT ,W_INVACTUALADJUST_ACCT ,W_DIFFERENCES_ACCT ,W_REVALUATION_ACCT ,P_REVENUE_ACCT ,P_EXPENSE_ACCT ,P_ASSET_ACCT ,P_PURCHASEPRICEVARIANCE_ACCT ,P_INVOICEPRICEVARIANCE_ACCT ,P_TRADEDISCOUNTREC_ACCT ,P_TRADEDISCOUNTGRANT_ACCT ,P_COGS_ACCT ,C_RECEIVABLE_ACCT ,C_PREPAYMENT_ACCT ,V_LIABILITY_ACCT ,V_LIABILITY_SERVICES_ACCT ,V_PREPAYMENT_ACCT ,PAYDISCOUNT_EXP_ACCT ,WRITEOFF_ACCT ,PAYDISCOUNT_REV_ACCT ,UNREALIZEDGAIN_ACCT ,UNREALIZEDLOSS_ACCT ,REALIZEDGAIN_ACCT ,REALIZEDLOSS_ACCT ,WITHHOLDING_ACCT ,E_PREPAYMENT_ACCT ,E_EXPENSE_ACCT ,PJ_ASSET_ACCT ,PJ_WIP_ACCT ,T_EXPENSE_ACCT ,T_LIABILITY_ACCT ,T_RECEIVABLES_ACCT ,T_DUE_ACCT ,T_CREDIT_ACCT ,B_INTRANSIT_ACCT ,B_ASSET_ACCT ,B_EXPENSE_ACCT ,B_INTERESTREV_ACCT ,B_INTERESTEXP_ACCT ,B_UNIDENTIFIED_ACCT ,B_UNALLOCATEDCASH_ACCT ,B_PAYMENTSELECT_ACCT ,B_SETTLEMENTGAIN_ACCT ,B_SETTLEMENTLOSS_ACCT ,B_REVALUATIONGAIN_ACCT ,B_REVALUATIONLOSS_ACCT ,CH_EXPENSE_ACCT ,CH_REVENUE_ACCT ,UNEARNEDREVENUE_ACCT ,NOTINVOICEDRECEIVABLES_ACCT ,NOTINVOICEDREVENUE_ACCT ,NOTINVOICEDRECEIPTS_ACCT ,CB_ASSET_ACCT ,CB_CASHTRANSFER_ACCT ,CB_DIFFERENCES_ACCT ,CB_EXPENSE_ACCT ,CB_RECEIPT_ACCT ,PROCESSING ,C_RECEIVABLE_SERVICES_ACCT ,P_INVENTORYCLEARING_ACCT ,P_COSTADJUSTMENT_ACCT FROM C_ACCTSCHEMA_DEFAULT WHERE AD_Client_ID = 11 AND C_ACCTSCHEMA_ID<1000000 ORDER BY C_ACCTSCHEMA_ID',
             'N', 'N', 22400, 315, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50337, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_ACCTSCHEMA_GL', 'ALL', 'D',
             'SELECT C_ACCTSCHEMA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,USESUSPENSEBALANCING ,SUSPENSEBALANCING_ACCT ,USESUSPENSEERROR ,SUSPENSEERROR_ACCT ,USECURRENCYBALANCING ,CURRENCYBALANCING_ACCT ,RETAINEDEARNING_ACCT ,INCOMESUMMARY_ACCT ,INTERCOMPANYDUETO_ACCT ,INTERCOMPANYDUEFROM_ACCT ,PPVOFFSET_ACCT ,COMMITMENTOFFSET_ACCT FROM C_ACCTSCHEMA_GL WHERE AD_Client_ID = 11 AND C_ACCTSCHEMA_ID<1000000 ORDER BY C_ACCTSCHEMA_ID',
             'N', 'N', 22500, 266, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50338, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_BANKACCOUNT_ACCT', 'ALL', 'D',
             'SELECT C_BANKACCOUNT_ID ,C_ACCTSCHEMA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,B_INTRANSIT_ACCT ,B_ASSET_ACCT ,B_EXPENSE_ACCT ,B_INTERESTREV_ACCT ,B_INTERESTEXP_ACCT ,B_UNIDENTIFIED_ACCT ,B_UNALLOCATEDCASH_ACCT ,B_PAYMENTSELECT_ACCT ,B_SETTLEMENTGAIN_ACCT ,B_SETTLEMENTLOSS_ACCT ,B_REVALUATIONGAIN_ACCT ,B_REVALUATIONLOSS_ACCT FROM C_BANKACCOUNT_ACCT WHERE AD_Client_ID = 11 AND C_BANKACCOUNT_ID<1000000 AND C_ACCTSCHEMA_ID<1000000 ORDER BY C_BANKACCOUNT_ID ,C_ACCTSCHEMA_ID',
             'N', 'N', 22600, 391, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50339, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_BP_CUSTOMER_ACCT', 'ALL', 'D',
             'SELECT C_BPARTNER_ID ,C_ACCTSCHEMA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_RECEIVABLE_ACCT ,C_PREPAYMENT_ACCT ,C_RECEIVABLE_SERVICES_ACCT FROM C_BP_CUSTOMER_ACCT WHERE AD_Client_ID = 11 AND C_BPARTNER_ID<1000000 AND C_ACCTSCHEMA_ID<1000000 ORDER BY C_BPARTNER_ID ,C_ACCTSCHEMA_ID',
             'N', 'N', 22700, 183, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50340, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_BP_EMPLOYEE_ACCT', 'ALL', 'D',
             'SELECT C_BPARTNER_ID ,C_ACCTSCHEMA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,E_EXPENSE_ACCT ,E_PREPAYMENT_ACCT FROM C_BP_EMPLOYEE_ACCT WHERE AD_Client_ID = 11 AND C_BPARTNER_ID<1000000 AND C_ACCTSCHEMA_ID<1000000 ORDER BY C_BPARTNER_ID ,C_ACCTSCHEMA_ID',
             'N', 'N', 22800, 184, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50341, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_BP_GROUP_ACCT', 'ALL', 'D',
             'SELECT C_ACCTSCHEMA_ID ,C_BP_GROUP_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_RECEIVABLE_ACCT ,C_PREPAYMENT_ACCT ,V_LIABILITY_ACCT ,V_LIABILITY_SERVICES_ACCT ,V_PREPAYMENT_ACCT ,PAYDISCOUNT_EXP_ACCT ,PAYDISCOUNT_REV_ACCT ,WRITEOFF_ACCT ,NOTINVOICEDRECEIPTS_ACCT ,UNEARNEDREVENUE_ACCT ,NOTINVOICEDREVENUE_ACCT ,NOTINVOICEDRECEIVABLES_ACCT ,PROCESSING ,C_RECEIVABLE_SERVICES_ACCT FROM C_BP_GROUP_ACCT WHERE AD_Client_ID = 11 AND C_ACCTSCHEMA_ID<1000000 AND C_BP_GROUP_ID<1000000 ORDER BY C_ACCTSCHEMA_ID ,C_BP_GROUP_ID',
             'N', 'N', 22900, 395, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50342, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_BP_VENDOR_ACCT', 'ALL', 'D',
             'SELECT C_ACCTSCHEMA_ID ,C_BPARTNER_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,V_LIABILITY_ACCT ,V_LIABILITY_SERVICES_ACCT ,V_PREPAYMENT_ACCT FROM C_BP_VENDOR_ACCT WHERE AD_Client_ID = 11 AND C_ACCTSCHEMA_ID<1000000 AND C_BPARTNER_ID<1000000 ORDER BY C_ACCTSCHEMA_ID ,C_BPARTNER_ID',
             'N', 'N', 23000, 185, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50343, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_CASHBOOK_ACCT', 'ALL', 'D',
             'SELECT C_CASHBOOK_ID ,C_ACCTSCHEMA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,CB_ASSET_ACCT ,CB_CASHTRANSFER_ACCT ,CB_DIFFERENCES_ACCT ,CB_EXPENSE_ACCT ,CB_RECEIPT_ACCT FROM C_CASHBOOK_ACCT WHERE AD_Client_ID = 11 AND C_CASHBOOK_ID<1000000 AND C_ACCTSCHEMA_ID<1000000 ORDER BY C_CASHBOOK_ID ,C_ACCTSCHEMA_ID',
             'N', 'N', 23100, 409, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50344, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_CHARGE_ACCT', 'ALL', 'D',
             'SELECT C_CHARGE_ID ,C_ACCTSCHEMA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,CH_EXPENSE_ACCT ,CH_REVENUE_ACCT FROM C_CHARGE_ACCT WHERE AD_Client_ID = 11 AND C_CHARGE_ID<1000000 AND C_ACCTSCHEMA_ID<1000000 ORDER BY C_CHARGE_ID ,C_ACCTSCHEMA_ID',
             'N', 'N', 23200, 396, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50345, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_PAYSELECTIONCHECK', 'ALL', 'D',
             'SELECT C_PAYSELECTIONCHECK_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_PAYSELECTION_ID ,C_BPARTNER_ID ,PAYAMT ,QTY ,C_PAYMENT_ID ,DOCUMENTNO ,ISPRINTED ,PAYMENTRULE ,PROCESSED ,DISCOUNTAMT ,ISRECEIPT ,C_BP_BANKACCOUNT_ID FROM C_PAYSELECTIONCHECK WHERE AD_Client_ID = 11 AND C_PAYSELECTIONCHECK_ID<1000000 ORDER BY C_PAYSELECTIONCHECK_ID',
             'N', 'N', 23300, 525, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50346, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_PROJECT_ACCT', 'ALL', 'D',
             'SELECT C_PROJECT_ID ,C_ACCTSCHEMA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,PJ_ASSET_ACCT ,PJ_WIP_ACCT FROM C_PROJECT_ACCT WHERE AD_Client_ID = 11 AND C_PROJECT_ID<1000000 AND C_ACCTSCHEMA_ID<1000000 ORDER BY C_PROJECT_ID ,C_ACCTSCHEMA_ID',
             'N', 'N', 23400, 204, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50347, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_TAX_ACCT', 'ALL', 'D',
             'SELECT C_TAX_ID ,C_ACCTSCHEMA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,T_DUE_ACCT ,T_LIABILITY_ACCT ,T_CREDIT_ACCT ,T_RECEIVABLES_ACCT ,T_EXPENSE_ACCT FROM C_TAX_ACCT WHERE AD_Client_ID = 11 AND C_TAX_ID<1000000 AND C_ACCTSCHEMA_ID<1000000 ORDER BY C_TAX_ID ,C_ACCTSCHEMA_ID',
             'N', 'N', 23500, 399, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50348, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'GL_DISTRIBUTIONLINE', 'ALL', 'D',
             'SELECT GL_DISTRIBUTIONLINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,GL_DISTRIBUTION_ID ,LINE ,PERCENT ,DESCRIPTION ,OVERWRITEORG ,ORG_ID ,OVERWRITEACCT ,ACCOUNT_ID ,OVERWRITEPRODUCT ,M_PRODUCT_ID ,OVERWRITEBPARTNER ,C_BPARTNER_ID ,OVERWRITEPROJECT ,C_PROJECT_ID ,OVERWRITECAMPAIGN ,C_CAMPAIGN_ID ,OVERWRITEACTIVITY ,C_ACTIVITY_ID ,OVERWRITESALESREGION ,C_SALESREGION_ID ,OVERWRITEORGTRX ,AD_ORGTRX_ID ,OVERWRITELOCTO ,C_LOCTO_ID ,OVERWRITELOCFROM ,C_LOCFROM_ID ,OVERWRITEUSER1 ,USER1_ID ,OVERWRITEUSER2 ,USER2_ID FROM GL_DISTRIBUTIONLINE WHERE AD_Client_ID = 11 AND GL_DISTRIBUTIONLINE_ID<1000000 ORDER BY GL_DISTRIBUTIONLINE_ID',
             'N', 'N', 23600, 707, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50349, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'GL_JOURNALLINE', 'ALL', 'D',
             'SELECT GL_JOURNALLINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,GL_JOURNAL_ID ,LINE ,ISGENERATED ,DESCRIPTION ,AMTSOURCEDR ,AMTSOURCECR ,C_CURRENCY_ID ,CURRENCYRATE ,DATEACCT ,AMTACCTDR ,AMTACCTCR ,C_UOM_ID ,QTY ,C_VALIDCOMBINATION_ID ,C_CONVERSIONTYPE_ID ,PROCESSED FROM GL_JOURNALLINE WHERE AD_Client_ID = 11 AND GL_JOURNALLINE_ID<1000000 ORDER BY GL_JOURNALLINE_ID',
             'N', 'N', 23700, 226, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50350, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_INVENTORYLINE', 'ALL', 'D',
             'SELECT M_INVENTORYLINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,M_INVENTORY_ID ,M_LOCATOR_ID ,M_PRODUCT_ID ,LINE ,QTYBOOK ,QTYCOUNT ,DESCRIPTION ,M_ATTRIBUTESETINSTANCE_ID ,C_CHARGE_ID ,INVENTORYTYPE ,PROCESSED ,QTYINTERNALUSE FROM M_INVENTORYLINE WHERE AD_Client_ID = 11 AND M_INVENTORYLINE_ID<1000000 ORDER BY M_INVENTORYLINE_ID',
             'N', 'N', 23800, 322, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50351, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_MOVEMENTLINE', 'ALL', 'D',
             'SELECT M_MOVEMENTLINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,M_MOVEMENT_ID ,M_LOCATOR_ID ,M_LOCATORTO_ID ,M_PRODUCT_ID ,LINE ,MOVEMENTQTY ,DESCRIPTION ,M_ATTRIBUTESETINSTANCE_ID ,CONFIRMEDQTY ,SCRAPPEDQTY ,TARGETQTY ,PROCESSED ,M_ATTRIBUTESETINSTANCETO_ID FROM M_MOVEMENTLINE WHERE AD_Client_ID = 11 AND M_MOVEMENTLINE_ID<1000000 ORDER BY M_MOVEMENTLINE_ID',
             'N', 'N', 23900, 324, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50352, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_PRODUCT_ACCT', 'ALL', 'D',
             'SELECT M_PRODUCT_ID ,C_ACCTSCHEMA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,P_REVENUE_ACCT ,P_EXPENSE_ACCT ,P_ASSET_ACCT ,P_PURCHASEPRICEVARIANCE_ACCT ,P_INVOICEPRICEVARIANCE_ACCT ,P_COGS_ACCT ,P_TRADEDISCOUNTREC_ACCT ,P_TRADEDISCOUNTGRANT_ACCT ,P_INVENTORYCLEARING_ACCT ,P_COSTADJUSTMENT_ACCT FROM M_PRODUCT_ACCT WHERE AD_Client_ID = 11 AND M_PRODUCT_ID<1000000 AND C_ACCTSCHEMA_ID<1000000 ORDER BY M_PRODUCT_ID ,C_ACCTSCHEMA_ID',
             'N', 'N', 24000, 273, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50353, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_PRODUCT_CATEGORY_ACCT', 'ALL', 'D',
             'SELECT M_PRODUCT_CATEGORY_ID ,C_ACCTSCHEMA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,P_REVENUE_ACCT ,P_EXPENSE_ACCT ,P_ASSET_ACCT ,P_COGS_ACCT ,P_PURCHASEPRICEVARIANCE_ACCT ,P_INVOICEPRICEVARIANCE_ACCT ,P_TRADEDISCOUNTREC_ACCT ,P_TRADEDISCOUNTGRANT_ACCT ,PROCESSING ,COSTINGMETHOD ,COSTINGLEVEL ,P_INVENTORYCLEARING_ACCT ,P_COSTADJUSTMENT_ACCT FROM M_PRODUCT_CATEGORY_ACCT WHERE AD_Client_ID = 11 AND M_PRODUCT_CATEGORY_ID<1000000 AND C_ACCTSCHEMA_ID<1000000 ORDER BY M_PRODUCT_CATEGORY_ID ,C_ACCTSCHEMA_ID',
             'N', 'N', 24100, 401, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50354, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_WAREHOUSE_ACCT', 'ALL', 'D',
             'SELECT M_WAREHOUSE_ID ,C_ACCTSCHEMA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,W_INVENTORY_ACCT ,W_INVACTUALADJUST_ACCT ,W_DIFFERENCES_ACCT ,W_REVALUATION_ACCT FROM M_WAREHOUSE_ACCT WHERE AD_Client_ID = 11 AND M_WAREHOUSE_ID<1000000 AND C_ACCTSCHEMA_ID<1000000 ORDER BY M_WAREHOUSE_ID ,C_ACCTSCHEMA_ID',
             'N', 'N', 24200, 191, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50355, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_CASHLINE', 'ALL', 'D',
             'SELECT C_CASHLINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_CASH_ID ,LINE ,DESCRIPTION ,CASHTYPE ,C_BANKACCOUNT_ID ,C_CHARGE_ID ,C_INVOICE_ID ,C_CURRENCY_ID ,AMOUNT ,DISCOUNTAMT ,WRITEOFFAMT ,ISGENERATED ,PROCESSED FROM C_CASHLINE WHERE AD_Client_ID = 11 AND C_CASHLINE_ID<1000000 ORDER BY C_CASHLINE_ID',
             'N', 'N', 24300, 410, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50356, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_INVOICE', 'ALL', 'D',
             'SELECT C_INVOICE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISSOTRX ,DOCUMENTNO ,DOCSTATUS ,DOCACTION ,PROCESSING ,PROCESSED ,POSTED ,C_DOCTYPE_ID ,C_DOCTYPETARGET_ID ,C_ORDER_ID ,DESCRIPTION ,ISAPPROVED ,ISTRANSFERRED ,ISPRINTED ,SALESREP_ID ,DATEINVOICED ,DATEPRINTED ,DATEACCT ,C_BPARTNER_ID ,C_BPARTNER_LOCATION_ID ,POREFERENCE ,ISDISCOUNTPRINTED ,DATEORDERED ,C_CURRENCY_ID ,PAYMENTRULE ,C_PAYMENTTERM_ID ,C_CHARGE_ID ,CHARGEAMT ,TOTALLINES ,GRANDTOTAL ,M_PRICELIST_ID ,ISTAXINCLUDED ,C_CAMPAIGN_ID ,C_PROJECT_ID ,C_ACTIVITY_ID ,ISPAID ,C_PAYMENT_ID ,C_CASHLINE_ID ,CREATEFROM ,GENERATETO ,SENDEMAIL ,AD_USER_ID ,COPYFROM ,ISSELFSERVICE ,AD_ORGTRX_ID ,USER1_ID ,USER2_ID ,C_CONVERSIONTYPE_ID ,ISPAYSCHEDULEVALID ,REF_INVOICE_ID ,ISINDISPUTE ,INVOICECOLLECTIONTYPE FROM C_INVOICE WHERE AD_Client_ID = 11 AND C_INVOICE_ID<1000000 ORDER BY C_INVOICE_ID',
             'N', 'N', 24400, 318, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50357, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_ORDER', 'ALL', 'D',
             'SELECT C_ORDER_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISSOTRX ,DOCUMENTNO ,DOCSTATUS ,DOCACTION ,PROCESSING ,PROCESSED ,C_DOCTYPE_ID ,C_DOCTYPETARGET_ID ,DESCRIPTION ,ISAPPROVED ,ISCREDITAPPROVED ,ISDELIVERED ,ISINVOICED ,ISPRINTED ,ISTRANSFERRED ,ISSELECTED ,SALESREP_ID ,DATEORDERED ,DATEPROMISED ,DATEPRINTED ,DATEACCT ,C_BPARTNER_ID ,C_BPARTNER_LOCATION_ID ,POREFERENCE ,ISDISCOUNTPRINTED ,C_CURRENCY_ID ,PAYMENTRULE ,C_PAYMENTTERM_ID ,INVOICERULE ,DELIVERYRULE ,FREIGHTCOSTRULE ,FREIGHTAMT ,DELIVERYVIARULE ,M_SHIPPER_ID ,C_CHARGE_ID ,CHARGEAMT ,PRIORITYRULE ,TOTALLINES ,GRANDTOTAL ,M_WAREHOUSE_ID ,M_PRICELIST_ID ,ISTAXINCLUDED ,C_CAMPAIGN_ID ,C_PROJECT_ID ,C_ACTIVITY_ID ,POSTED ,C_PAYMENT_ID ,C_CASHLINE_ID ,SENDEMAIL ,AD_USER_ID ,COPYFROM ,ISSELFSERVICE ,AD_ORGTRX_ID ,USER1_ID ,USER2_ID ,C_CONVERSIONTYPE_ID ,BILL_BPARTNER_ID ,BILL_LOCATION_ID ,BILL_USER_ID ,PAY_BPARTNER_ID ,PAY_LOCATION_ID ,REF_ORDER_ID ,ISDROPSHIP ,VOLUME ,WEIGHT FROM C_ORDER WHERE AD_Client_ID = 11 AND C_ORDER_ID<1000000 ORDER BY C_ORDER_ID',
             'N', 'N', 24500, 259, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50358, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_ALLOCATIONLINE', 'ALL', 'D',
             'SELECT C_ALLOCATIONLINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ALLOCATIONNO ,DATETRX ,ISMANUAL ,C_INVOICE_ID ,C_BPARTNER_ID ,C_ORDER_ID ,C_PAYMENT_ID ,C_CASHLINE_ID ,AMOUNT ,DISCOUNTAMT ,WRITEOFFAMT ,POSTED ,OVERUNDERAMT ,C_ALLOCATIONHDR_ID FROM C_ALLOCATIONLINE WHERE AD_Client_ID = 11 AND C_ALLOCATIONLINE_ID<1000000 ORDER BY C_ALLOCATIONLINE_ID',
             'N', 'N', 24600, 390, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50359, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_BANKSTATEMENTLINE', 'ALL', 'D',
             'SELECT C_BANKSTATEMENTLINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_BANKSTATEMENT_ID ,LINE ,DESCRIPTION ,ISREVERSAL ,C_PAYMENT_ID ,VALUTADATE ,DATEACCT ,C_CURRENCY_ID ,TRXAMT ,STMTAMT ,C_CHARGE_ID ,CHARGEAMT ,INTERESTAMT ,MEMO ,REFERENCENO ,ISMANUAL ,EFTTRXID ,EFTTRXTYPE ,EFTMEMO ,EFTPAYEE ,EFTPAYEEACCOUNT ,CREATEPAYMENT ,STATEMENTLINEDATE ,EFTSTATEMENTLINEDATE ,EFTVALUTADATE ,EFTREFERENCE ,EFTCURRENCY ,EFTAMT ,EFTCHECKNO ,MATCHSTATEMENT ,C_BPARTNER_ID ,C_INVOICE_ID ,PROCESSED FROM C_BANKSTATEMENTLINE WHERE AD_Client_ID = 11 AND C_BANKSTATEMENTLINE_ID<1000000 ORDER BY C_BANKSTATEMENTLINE_ID',
             'N', 'N', 24700, 393, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50360, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_INVOICEPAYSCHEDULE', 'ALL', 'D',
             'SELECT C_INVOICEPAYSCHEDULE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_INVOICE_ID ,C_PAYSCHEDULE_ID ,DUEDATE ,DUEAMT ,DISCOUNTDATE ,DISCOUNTAMT ,ISVALID ,PROCESSING ,PROCESSED FROM C_INVOICEPAYSCHEDULE WHERE AD_Client_ID = 11 AND C_INVOICEPAYSCHEDULE_ID<1000000 ORDER BY C_INVOICEPAYSCHEDULE_ID',
             'N', 'N', 24800, 551, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50361, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_INVOICETAX', 'ALL', 'D',
             'SELECT C_TAX_ID ,C_INVOICE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,TAXBASEAMT ,TAXAMT ,PROCESSED ,ISTAXINCLUDED FROM C_INVOICETAX WHERE AD_Client_ID = 11 AND C_TAX_ID<1000000 AND C_INVOICE_ID<1000000 ORDER BY C_TAX_ID ,C_INVOICE_ID',
             'N', 'N', 24900, 334, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50362, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_ORDERLINE', 'ALL', 'D',
             'SELECT C_ORDERLINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_ORDER_ID ,LINE ,C_BPARTNER_ID ,C_BPARTNER_LOCATION_ID ,DATEORDERED ,DATEPROMISED ,DATEDELIVERED ,DATEINVOICED ,DESCRIPTION ,M_PRODUCT_ID ,M_WAREHOUSE_ID ,C_UOM_ID ,QTYORDERED ,QTYRESERVED ,QTYDELIVERED ,QTYINVOICED ,M_SHIPPER_ID ,C_CURRENCY_ID ,PRICELIST ,PRICEACTUAL ,PRICELIMIT ,LINENETAMT ,DISCOUNT ,FREIGHTAMT ,C_CHARGE_ID ,C_TAX_ID ,S_RESOURCEASSIGNMENT_ID ,REF_ORDERLINE_ID ,M_ATTRIBUTESETINSTANCE_ID ,ISDESCRIPTION ,PROCESSED ,QTYENTERED ,PRICEENTERED ,C_PROJECT_ID ,PRICECOST ,QTYLOSTSALES ,C_PROJECTPHASE_ID ,C_PROJECTTASK_ID ,RRSTARTDATE ,RRAMT ,C_CAMPAIGN_ID ,C_ACTIVITY_ID ,USER1_ID ,USER2_ID ,AD_ORGTRX_ID FROM C_ORDERLINE WHERE AD_Client_ID = 11 AND C_ORDERLINE_ID<1000000 ORDER BY C_ORDERLINE_ID',
             'N', 'N', 25000, 260, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50363, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_ORDERTAX', 'ALL', 'D',
             'SELECT C_ORDER_ID ,C_TAX_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,TAXBASEAMT ,TAXAMT ,PROCESSED ,ISTAXINCLUDED FROM C_ORDERTAX WHERE AD_Client_ID = 11 AND C_ORDER_ID<1000000 AND C_TAX_ID<1000000 ORDER BY C_ORDER_ID ,C_TAX_ID',
             'N', 'N', 25100, 314, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50364, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_PAYSELECTIONLINE', 'ALL', 'D',
             'SELECT C_PAYSELECTIONLINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_PAYSELECTION_ID ,LINE ,DESCRIPTION ,PAYMENTRULE ,ISMANUAL ,C_INVOICE_ID ,PAYAMT ,DIFFERENCEAMT ,C_PAYSELECTIONCHECK_ID ,PROCESSED ,DISCOUNTAMT ,OPENAMT ,ISSOTRX FROM C_PAYSELECTIONLINE WHERE AD_Client_ID = 11 AND C_PAYSELECTIONLINE_ID<1000000 ORDER BY C_PAYSELECTIONLINE_ID',
             'N', 'N', 25200, 427, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50365, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_PROJECTLINE', 'ALL', 'D',
             'SELECT C_PROJECTLINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_PROJECT_ID ,LINE ,DESCRIPTION ,PLANNEDQTY ,PLANNEDPRICE ,PLANNEDAMT ,PLANNEDMARGINAMT ,COMMITTEDAMT ,M_PRODUCT_ID ,M_PRODUCT_CATEGORY_ID ,INVOICEDAMT ,INVOICEDQTY ,COMMITTEDQTY ,C_PROJECTISSUE_ID ,C_ORDER_ID ,C_ORDERPO_ID ,ISPRINTED ,PROCESSED ,DOPRICING ,C_PROJECTPHASE_ID ,C_PROJECTTASK_ID FROM C_PROJECTLINE WHERE AD_Client_ID = 11 AND C_PROJECTLINE_ID<1000000 ORDER BY C_PROJECTLINE_ID',
             'N', 'N', 25300, 434, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50366, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_RECURRING', 'ALL', 'D',
             'SELECT C_RECURRING_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,RECURRINGTYPE ,C_ORDER_ID ,C_INVOICE_ID ,C_PAYMENT_ID ,C_PROJECT_ID ,GL_JOURNALBATCH_ID ,FREQUENCYTYPE ,RUNSMAX ,RUNSREMAINING ,DATELASTRUN ,DATENEXTRUN ,PROCESSING ,FREQUENCY FROM C_RECURRING WHERE AD_Client_ID = 11 AND C_RECURRING_ID<1000000 ORDER BY C_RECURRING_ID',
             'N', 'N', 25400, 574, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50367, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_RFQ', 'ALL', 'D',
             'SELECT C_RFQ_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,NAME ,DESCRIPTION ,HELP ,C_RFQ_TOPIC_ID ,C_CURRENCY_ID ,DATERESPONSE ,ISRFQRESPONSEACCEPTED ,DATEWORKSTART ,DELIVERYDAYS ,DATEWORKCOMPLETE ,QUOTETYPE ,ISQUOTETOTALAMT ,ISQUOTEALLQTY ,ISSELFSERVICE ,ISINVITEDVENDORSONLY ,C_BPARTNER_ID ,C_BPARTNER_LOCATION_ID ,AD_USER_ID ,SALESREP_ID ,MARGIN ,CREATESO ,CREATEPO ,PUBLISHRFQ ,C_ORDER_ID ,COPYLINES ,RANKRFQ ,PROCESSING ,PROCESSED ,DOCUMENTNO FROM C_RFQ WHERE AD_Client_ID = 11 AND C_RFQ_ID<1000000 ORDER BY C_RFQ_ID',
             'N', 'N', 25500, 677, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50368, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_INOUT', 'ALL', 'D',
             'SELECT M_INOUT_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,ISSOTRX ,DOCUMENTNO ,DOCACTION ,DOCSTATUS ,POSTED ,PROCESSING ,PROCESSED ,C_DOCTYPE_ID ,DESCRIPTION ,C_ORDER_ID ,DATEORDERED ,ISPRINTED ,MOVEMENTTYPE ,MOVEMENTDATE ,DATEACCT ,C_BPARTNER_ID ,C_BPARTNER_LOCATION_ID ,M_WAREHOUSE_ID ,POREFERENCE ,DELIVERYRULE ,FREIGHTCOSTRULE ,FREIGHTAMT ,DELIVERYVIARULE ,M_SHIPPER_ID ,C_CHARGE_ID ,CHARGEAMT ,PRIORITYRULE ,DATEPRINTED ,C_INVOICE_ID ,CREATEFROM ,GENERATETO ,SENDEMAIL ,AD_USER_ID ,SALESREP_ID ,NOPACKAGES ,PICKDATE ,SHIPDATE ,TRACKINGNO ,AD_ORGTRX_ID ,C_PROJECT_ID ,C_CAMPAIGN_ID ,C_ACTIVITY_ID ,USER1_ID ,USER2_ID ,DATERECEIVED ,ISINTRANSIT ,REF_INOUT_ID ,CREATECONFIRM ,CREATEPACKAGE ,ISAPPROVED ,ISINDISPUTE ,VOLUME ,WEIGHT FROM M_INOUT WHERE AD_Client_ID = 11 AND M_INOUT_ID<1000000 ORDER BY M_INOUT_ID',
             'N', 'N', 25600, 319, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50369, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_RFQLINE', 'ALL', 'D',
             'SELECT C_RFQLINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_RFQ_ID ,LINE ,M_PRODUCT_ID ,M_ATTRIBUTESETINSTANCE_ID ,DESCRIPTION ,HELP ,DELIVERYDAYS ,DATEWORKCOMPLETE ,DATEWORKSTART FROM C_RFQLINE WHERE AD_Client_ID = 11 AND C_RFQLINE_ID<1000000 ORDER BY C_RFQLINE_ID',
             'N', 'N', 25700, 676, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50370, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_INOUTCONFIRM', 'ALL', 'D',
             'SELECT M_INOUTCONFIRM_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,DOCUMENTNO ,M_INOUT_ID ,CONFIRMTYPE ,ISAPPROVED ,DESCRIPTION ,PROCESSING ,PROCESSED ,CREATEPACKAGE ,ISCANCELLED ,DOCSTATUS ,DOCACTION ,ISINDISPUTE ,M_INVENTORY_ID ,C_INVOICE_ID ,APPROVALAMT ,CONFIRMATIONNO FROM M_INOUTCONFIRM WHERE AD_Client_ID = 11 AND M_INOUTCONFIRM_ID<1000000 ORDER BY M_INOUTCONFIRM_ID',
             'N', 'N', 25800, 727, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50371, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_INOUTLINE', 'ALL', 'D',
             'SELECT M_INOUTLINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,LINE ,DESCRIPTION ,M_INOUT_ID ,C_ORDERLINE_ID ,M_LOCATOR_ID ,M_PRODUCT_ID ,C_UOM_ID ,MOVEMENTQTY ,ISINVOICED ,M_ATTRIBUTESETINSTANCE_ID ,ISDESCRIPTION ,CONFIRMEDQTY ,PICKEDQTY ,SCRAPPEDQTY ,TARGETQTY ,REF_INOUTLINE_ID ,PROCESSED ,QTYENTERED ,C_CHARGE_ID ,C_PROJECT_ID ,C_PROJECTPHASE_ID ,C_PROJECTTASK_ID ,C_CAMPAIGN_ID ,C_ACTIVITY_ID ,USER1_ID ,USER2_ID ,AD_ORGTRX_ID FROM M_INOUTLINE WHERE AD_Client_ID = 11 AND M_INOUTLINE_ID<1000000 ORDER BY M_INOUTLINE_ID',
             'N', 'N', 25900, 320, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50372, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_PACKAGE', 'ALL', 'D',
             'SELECT M_PACKAGE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,DOCUMENTNO ,M_INOUT_ID ,DESCRIPTION ,M_SHIPPER_ID ,TRACKINGINFO ,DATERECEIVED ,RECEIVEDINFO ,SHIPDATE FROM M_PACKAGE WHERE AD_Client_ID = 11 AND M_PACKAGE_ID<1000000 ORDER BY M_PACKAGE_ID',
             'N', 'N', 26000, 664, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50373, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_RMA', 'ALL', 'D',
             'SELECT M_RMA_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,DOCUMENTNO ,NAME ,DESCRIPTION ,M_INOUT_ID ,PROCESSING ,PROCESSED ,C_ORDER_ID ,C_DOCTYPE_ID ,SALESREP_ID ,DOCACTION ,DOCSTATUS ,ISAPPROVED ,AMT ,M_RMATYPE_ID ,HELP ,C_CURRENCY_ID ,C_BPARTNER_ID FROM M_RMA WHERE AD_Client_ID = 11 AND M_RMA_ID<1000000 ORDER BY M_RMA_ID',
             'N', 'N', 26100, 661, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50374, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_INVOICELINE', 'ALL', 'D',
             'SELECT C_INVOICELINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_INVOICE_ID ,C_ORDERLINE_ID ,M_INOUTLINE_ID ,LINE ,DESCRIPTION ,M_PRODUCT_ID ,QTYINVOICED ,PRICELIST ,PRICEACTUAL ,PRICELIMIT ,LINENETAMT ,C_CHARGE_ID ,C_UOM_ID ,C_TAX_ID ,S_RESOURCEASSIGNMENT_ID ,A_ASSET_ID ,TAXAMT ,M_ATTRIBUTESETINSTANCE_ID ,ISDESCRIPTION ,ISPRINTED ,LINETOTALAMT ,REF_INVOICELINE_ID ,PROCESSED ,QTYENTERED ,PRICEENTERED ,C_PROJECT_ID ,C_PROJECTPHASE_ID ,C_PROJECTTASK_ID ,RRSTARTDATE ,RRAMT ,C_CAMPAIGN_ID ,C_ACTIVITY_ID ,USER1_ID ,USER2_ID ,AD_ORGTRX_ID FROM C_INVOICELINE WHERE AD_Client_ID = 11 AND C_INVOICELINE_ID<1000000 ORDER BY C_INVOICELINE_ID',
             'N', 'N', 26200, 333, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50375, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'C_RFQLINEQTY', 'ALL', 'D',
             'SELECT C_RFQLINEQTY_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_RFQLINE_ID ,C_UOM_ID ,QTY ,MARGIN ,ISPURCHASEQTY ,BESTRESPONSEAMT ,ISOFFERQTY ,OFFERAMT ,BENCHMARKPRICE ,ISRFQQTY FROM C_RFQLINEQTY WHERE AD_Client_ID = 11 AND C_RFQLINEQTY_ID<1000000 ORDER BY C_RFQLINEQTY_ID',
             'N', 'N', 26300, 675, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50376, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_INOUTLINECONFIRM', 'ALL', 'D',
             'SELECT M_INOUTLINECONFIRM_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,M_INOUTCONFIRM_ID ,M_INOUTLINE_ID ,TARGETQTY ,CONFIRMEDQTY ,DESCRIPTION ,PROCESSED ,DIFFERENCEQTY ,SCRAPPEDQTY ,M_INVENTORYLINE_ID ,C_INVOICELINE_ID ,CONFIRMATIONNO FROM M_INOUTLINECONFIRM WHERE AD_Client_ID = 11 AND M_INOUTLINECONFIRM_ID<1000000 ORDER BY M_INOUTLINECONFIRM_ID',
             'N', 'N', 26400, 728, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50377, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_PACKAGELINE', 'ALL', 'D',
             'SELECT M_PACKAGELINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,M_PACKAGE_ID ,M_INOUTLINE_ID ,QTY ,DESCRIPTION FROM M_PACKAGELINE WHERE AD_Client_ID = 11 AND M_PACKAGELINE_ID<1000000 ORDER BY M_PACKAGELINE_ID',
             'N', 'N', 26500, 663, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50378, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_RMALINE', 'ALL', 'D',
             'SELECT M_RMALINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,M_RMA_ID ,M_INOUTLINE_ID ,QTY ,DESCRIPTION ,PROCESSED FROM M_RMALINE WHERE AD_Client_ID = 11 AND M_RMALINE_ID<1000000 ORDER BY M_RMALINE_ID',
             'N', 'N', 26600, 660, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50379, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_TRANSACTION', 'ALL', 'D',
             'SELECT M_TRANSACTION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,MOVEMENTTYPE ,M_LOCATOR_ID ,M_PRODUCT_ID ,MOVEMENTDATE ,MOVEMENTQTY ,M_INVENTORYLINE_ID ,M_MOVEMENTLINE_ID ,M_INOUTLINE_ID ,M_PRODUCTIONLINE_ID ,C_PROJECTISSUE_ID ,M_ATTRIBUTESETINSTANCE_ID FROM M_TRANSACTION WHERE AD_Client_ID = 11 AND M_TRANSACTION_ID<1000000 ORDER BY M_TRANSACTION_ID',
             'N', 'N', 26700, 329, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50380, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_REQUEST', 'ALL', 'D',
             'SELECT R_REQUEST_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,DOCUMENTNO ,R_REQUESTTYPE_ID ,R_GROUP_ID ,R_CATEGORY_ID ,R_STATUS_ID ,R_RESOLUTION_ID ,R_REQUESTRELATED_ID ,PRIORITY ,PRIORITYUSER ,DUETYPE ,SUMMARY ,CONFIDENTIALTYPE ,ISESCALATED ,ISSELFSERVICE ,SALESREP_ID ,AD_ROLE_ID ,DATELASTACTION ,DATELASTALERT ,LASTRESULT ,PROCESSED ,ISINVOICED ,C_BPARTNER_ID ,AD_USER_ID ,C_CAMPAIGN_ID ,C_ORDER_ID ,C_INVOICE_ID ,C_PAYMENT_ID ,M_PRODUCT_ID ,C_PROJECT_ID ,A_ASSET_ID ,M_INOUT_ID ,M_RMA_ID ,AD_TABLE_ID ,RECORD_ID ,REQUESTAMT ,R_MAILTEXT_ID ,RESULT ,CONFIDENTIALTYPEENTRY ,R_STANDARDRESPONSE_ID ,NEXTACTION ,DATENEXTACTION ,STARTTIME ,ENDTIME ,QTYSPENT ,QTYINVOICED ,M_PRODUCTSPENT_ID ,C_ACTIVITY_ID ,STARTDATE ,CLOSEDATE ,C_INVOICEREQUEST_ID ,M_CHANGEREQUEST_ID ,TASKSTATUS ,QTYPLAN ,DATECOMPLETEPLAN ,DATESTARTPLAN ,M_FIXCHANGENOTICE_ID FROM R_REQUEST WHERE AD_Client_ID = 11 AND R_REQUEST_ID<1000000 ORDER BY R_REQUEST_ID',
             'N', 'N', 26800, 417, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50381, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_MATCHINV', 'ALL', 'D',
             'SELECT M_MATCHINV_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,M_INOUTLINE_ID ,C_INVOICELINE_ID ,M_PRODUCT_ID ,DATETRX ,QTY ,PROCESSING ,PROCESSED ,POSTED ,DOCUMENTNO ,DATEACCT ,M_ATTRIBUTESETINSTANCE_ID ,DESCRIPTION FROM M_MATCHINV WHERE AD_Client_ID = 11 AND M_MATCHINV_ID<1000000 ORDER BY M_MATCHINV_ID',
             'N', 'N', 26900, 472, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50382, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'M_MATCHPO', 'ALL', 'D',
             'SELECT M_MATCHPO_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,C_ORDERLINE_ID ,M_PRODUCT_ID ,M_INOUTLINE_ID ,C_INVOICELINE_ID ,DATETRX ,QTY ,PROCESSING ,PROCESSED ,POSTED ,DOCUMENTNO ,DATEACCT ,M_ATTRIBUTESETINSTANCE_ID ,PRICEMATCHDIFFERENCE ,ISAPPROVED ,DESCRIPTION FROM M_MATCHPO WHERE AD_Client_ID = 11 AND M_MATCHPO_ID<1000000 ORDER BY M_MATCHPO_ID',
             'N', 'N', 27000, 473, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50383, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_REQUESTACTION', 'ALL', 'D',
             'SELECT R_REQUESTACTION_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,R_REQUEST_ID ,R_GROUP_ID ,R_CATEGORY_ID ,R_STATUS_ID ,R_RESOLUTION_ID ,SALESREP_ID ,AD_ROLE_ID ,ISESCALATED ,ISINVOICED ,CONFIDENTIALTYPE ,ISSELFSERVICE ,PRIORITY ,PRIORITYUSER ,C_BPARTNER_ID ,AD_USER_ID ,C_ORDER_ID ,C_INVOICE_ID ,C_PAYMENT_ID ,M_PRODUCT_ID ,C_PROJECT_ID ,SUMMARY ,DATENEXTACTION ,C_ACTIVITY_ID ,R_REQUESTTYPE_ID ,A_ASSET_ID ,M_INOUT_ID ,M_RMA_ID ,NULLCOLUMNS ,TASKSTATUS ,DATECOMPLETEPLAN ,QTYPLAN ,QTYSPENT ,STARTDATE ,ENDDATE ,DATESTARTPLAN ,QTYINVOICED ,M_PRODUCTSPENT_ID FROM R_REQUESTACTION WHERE AD_Client_ID = 11 AND R_REQUESTACTION_ID<1000000 ORDER BY R_REQUESTACTION_ID',
             'N', 'N', 27100, 418, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50384, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'R_REQUESTUPDATE', 'ALL', 'D',
             'SELECT R_REQUESTUPDATE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,R_REQUEST_ID ,CONFIDENTIALTYPEENTRY ,STARTTIME ,ENDTIME ,QTYSPENT ,QTYINVOICED ,M_PRODUCTSPENT_ID ,RESULT FROM R_REQUESTUPDATE WHERE AD_Client_ID = 11 AND R_REQUESTUPDATE_ID<1000000 ORDER BY R_REQUESTUPDATE_ID',
             'N', 'N', 27200, 802, 50001
            );


INSERT INTO AD_PACKAGE_EXP_DETAIL
            (ad_package_exp_detail_id, ad_client_id, ad_org_id, isactive,
             created, createdby,
             updated, updatedby,
             ad_role_id, description, dbtype, TYPE,
             sqlstatement,
             processing, processed, line, ad_table_id, ad_package_exp_id
            )
     VALUES (50385, 0, 0, 'Y',
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             TO_DATE ('10/13/2007 00:38:38', 'MM/DD/YYYY HH24:MI:SS'), 100,
             0, 'S_TIMEEXPENSELINE', 'ALL', 'D',
             'SELECT S_TIMEEXPENSELINE_ID ,AD_CLIENT_ID ,AD_ORG_ID ,ISACTIVE ,CREATED ,CREATEDBY ,UPDATED ,UPDATEDBY ,S_TIMEEXPENSE_ID ,LINE ,ISTIMEREPORT ,DATEEXPENSE ,M_PRODUCT_ID ,QTY ,EXPENSEAMT ,C_CURRENCY_ID ,CONVERTEDAMT ,S_RESOURCEASSIGNMENT_ID ,DESCRIPTION ,NOTE ,ISINVOICED ,C_BPARTNER_ID ,C_PROJECT_ID ,C_ACTIVITY_ID ,C_CAMPAIGN_ID ,C_INVOICELINE_ID ,INVOICEPRICE ,C_UOM_ID ,C_ORDERLINE_ID ,C_PROJECTPHASE_ID ,C_PROJECTTASK_ID ,S_TIMETYPE_ID ,PROCESSED ,QTYINVOICED ,QTYREIMBURSED ,PRICEINVOICED ,PRICEREIMBURSED FROM S_TIMEEXPENSELINE WHERE AD_Client_ID = 11 AND S_TIMEEXPENSELINE_ID<1000000 ORDER BY S_TIMEEXPENSELINE_ID',
             'N', 'N', 27300, 488, 50001
            );



COMMIT ;