SELECT   tabla
    FROM (SELECT COUNT (*), 'A_ASSET' AS tabla
            FROM A_ASSET
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'A_ASSET_ACCT'
            FROM A_ASSET_ACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'A_ASSET_ADDITION'
            FROM A_ASSET_ADDITION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'A_ASSET_CHANGE'
            FROM A_ASSET_CHANGE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'A_ASSET_CHANGE_AMT'
            FROM A_ASSET_CHANGE_AMT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'A_ASSET_DELIVERY'
            FROM A_ASSET_DELIVERY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'A_ASSET_GROUP'
            FROM A_ASSET_GROUP
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'A_ASSET_GROUP_ACCT'
            FROM A_ASSET_GROUP_ACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'A_ASSET_RETIREMENT'
            FROM A_ASSET_RETIREMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'A_ASSET_USE'
            FROM A_ASSET_USE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ACCESSLOG'
            FROM AD_ACCESSLOG
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ALERT'
            FROM AD_ALERT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ALERTPROCESSOR'
            FROM AD_ALERTPROCESSOR
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ALERTPROCESSORLOG'
            FROM AD_ALERTPROCESSORLOG
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ALERTRECIPIENT'
            FROM AD_ALERTRECIPIENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ALERTRULE'
            FROM AD_ALERTRULE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ARCHIVE'
            FROM AD_ARCHIVE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ATTACHMENT'
            FROM AD_ATTACHMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ATTACHMENTNOTE'
            FROM AD_ATTACHMENTNOTE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ATTRIBUTE'
            FROM AD_ATTRIBUTE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_CHANGELOG'
            FROM AD_CHANGELOG
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_CLIENT'
            FROM AD_CLIENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_CLIENTINFO'
            FROM AD_CLIENTINFO
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_CLIENTSHARE'
            FROM AD_CLIENTSHARE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_COLOR'
            FROM AD_COLOR
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_COLUMN'
            FROM AD_COLUMN
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_COLUMN_ACCESS'
            FROM AD_COLUMN_ACCESS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_COLUMN_TRL'
            FROM AD_COLUMN_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_DESKTOP'
            FROM AD_DESKTOP
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_DESKTOP_TRL'
            FROM AD_DESKTOP_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_DESKTOPWORKBENCH'
            FROM AD_DESKTOPWORKBENCH
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ELEMENT'
            FROM AD_ELEMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ELEMENT_TRL'
            FROM AD_ELEMENT_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ENTITYTYPE'
            FROM AD_ENTITYTYPE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'A_DEPRECIATION'
            FROM A_DEPRECIATION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ERROR'
            FROM AD_ERROR
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_FIELD'
            FROM AD_FIELD
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_FIELDGROUP'
            FROM AD_FIELDGROUP
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_FIELDGROUP_TRL'
            FROM AD_FIELDGROUP_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_FIELD_TRL'
            FROM AD_FIELD_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_FIND'
            FROM AD_FIND
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_FORM'
            FROM AD_FORM
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_FORM_ACCESS'
            FROM AD_FORM_ACCESS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_FORM_TRL'
            FROM AD_FORM_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_IMAGE'
            FROM AD_IMAGE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_IMPFORMAT'
            FROM AD_IMPFORMAT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_IMPFORMAT_ROW'
            FROM AD_IMPFORMAT_ROW
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_INFOCOLUMN'
            FROM AD_INFOCOLUMN
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_INFOCOLUMN_TRL'
            FROM AD_INFOCOLUMN_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_INFOWINDOW'
            FROM AD_INFOWINDOW
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_INFOWINDOW_TRL'
            FROM AD_INFOWINDOW_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ISSUE'
            FROM AD_ISSUE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_LABELPRINTER'
            FROM AD_LABELPRINTER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_LABELPRINTERFUNCTION'
            FROM AD_LABELPRINTERFUNCTION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_LANGUAGE'
            FROM AD_LANGUAGE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_LDAPACCESS'
            FROM AD_LDAPACCESS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_LDAPPROCESSOR'
            FROM AD_LDAPPROCESSOR
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_LDAPPROCESSORLOG'
            FROM AD_LDAPPROCESSORLOG
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_MENU'
            FROM AD_MENU
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_MENU_TRL'
            FROM AD_MENU_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_MESSAGE'
            FROM AD_MESSAGE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_MESSAGE_TRL'
            FROM AD_MESSAGE_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_MODIFICATION'
            FROM AD_MODIFICATION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_NOTE'
            FROM AD_NOTE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ORG'
            FROM AD_ORG
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ORGINFO'
            FROM AD_ORGINFO
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ORGTYPE'
            FROM AD_ORGTYPE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PACKAGE_EXP'
            FROM AD_PACKAGE_EXP
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PACKAGE_EXP_COMMON'
            FROM AD_PACKAGE_EXP_COMMON
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PACKAGE_EXP_DETAIL'
            FROM AD_PACKAGE_EXP_DETAIL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PACKAGE_IMP'
            FROM AD_PACKAGE_IMP
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PACKAGE_IMP_BACKUP'
            FROM AD_PACKAGE_IMP_BACKUP
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PACKAGE_IMP_DETAIL'
            FROM AD_PACKAGE_IMP_DETAIL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PACKAGE_IMP_INST'
            FROM AD_PACKAGE_IMP_INST
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PACKAGE_IMP_PROC'
            FROM AD_PACKAGE_IMP_PROC
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PINSTANCE'
            FROM AD_PINSTANCE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PINSTANCE_PARA'
            FROM AD_PINSTANCE_PARA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PREFERENCE'
            FROM AD_PREFERENCE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PRINTCOLOR'
            FROM AD_PRINTCOLOR
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PRINTFONT'
            FROM AD_PRINTFONT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PRINTFORM'
            FROM AD_PRINTFORM
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PRINTFORMAT'
            FROM AD_PRINTFORMAT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PRINTFORMATITEM'
            FROM AD_PRINTFORMATITEM
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PRINTFORMATITEM_TRL'
            FROM AD_PRINTFORMATITEM_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PRINTGRAPH'
            FROM AD_PRINTGRAPH
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PRINTLABEL'
            FROM AD_PRINTLABEL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PRINTLABELLINE'
            FROM AD_PRINTLABELLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PRINTLABELLINE_TRL'
            FROM AD_PRINTLABELLINE_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PRINTPAPER'
            FROM AD_PRINTPAPER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PRINTTABLEFORMAT'
            FROM AD_PRINTTABLEFORMAT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PRIVATE_ACCESS'
            FROM AD_PRIVATE_ACCESS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PROCESS'
            FROM AD_PROCESS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PROCESS_ACCESS'
            FROM AD_PROCESS_ACCESS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PROCESS_PARA'
            FROM AD_PROCESS_PARA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PROCESS_PARA_TRL'
            FROM AD_PROCESS_PARA_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_PROCESS_TRL'
            FROM AD_PROCESS_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_RECORD_ACCESS'
            FROM AD_RECORD_ACCESS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_REFERENCE'
            FROM AD_REFERENCE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_REFERENCE_TRL'
            FROM AD_REFERENCE_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_REF_LIST'
            FROM AD_REF_LIST
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_REF_LIST_TRL'
            FROM AD_REF_LIST_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_REF_TABLE'
            FROM AD_REF_TABLE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_REGISTRATION'
            FROM AD_REGISTRATION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_REPLICATION'
            FROM AD_REPLICATION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_REPLICATION_LOG'
            FROM AD_REPLICATION_LOG
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_REPLICATION_RUN'
            FROM AD_REPLICATION_RUN
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_REPLICATIONSTRATEGY'
            FROM AD_REPLICATIONSTRATEGY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_REPLICATIONTABLE'
            FROM AD_REPLICATIONTABLE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_REPORTVIEW'
            FROM AD_REPORTVIEW
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_REPORTVIEW_COL'
            FROM AD_REPORTVIEW_COL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ROLE'
            FROM AD_ROLE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_ROLE_ORGACCESS'
            FROM AD_ROLE_ORGACCESS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_SCHEDULER'
            FROM AD_SCHEDULER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_SCHEDULERLOG'
            FROM AD_SCHEDULERLOG
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_SCHEDULER_PARA'
            FROM AD_SCHEDULER_PARA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_SCHEDULERRECIPIENT'
            FROM AD_SCHEDULERRECIPIENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_SEQUENCE'
            FROM AD_SEQUENCE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_SEQUENCE_AUDIT'
            FROM AD_SEQUENCE_AUDIT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_SEQUENCE_NO'
            FROM AD_SEQUENCE_NO
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_SESSION'
            FROM AD_SESSION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_SYSCONFIG'
            FROM AD_SYSCONFIG
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_SYSTEM'
            FROM AD_SYSTEM
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TAB'
            FROM AD_TAB
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TABLE'
            FROM AD_TABLE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TABLE_ACCESS'
            FROM AD_TABLE_ACCESS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TABLE_TRL'
            FROM AD_TABLE_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TAB_TRL'
            FROM AD_TAB_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TASK'
            FROM AD_TASK
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TASK_ACCESS'
            FROM AD_TASK_ACCESS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TASKINSTANCE'
            FROM AD_TASKINSTANCE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TASK_TRL'
            FROM AD_TASK_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TREE'
            FROM AD_TREE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TREEBAR'
            FROM AD_TREEBAR
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TREENODE'
            FROM AD_TREENODE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TREENODEBP'
            FROM AD_TREENODEBP
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TREENODECMC'
            FROM AD_TREENODECMC
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TREENODECMM'
            FROM AD_TREENODECMM
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TREENODECMS'
            FROM AD_TREENODECMS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TREENODECMT'
            FROM AD_TREENODECMT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TREENODEMM'
            FROM AD_TREENODEMM
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TREENODEPR'
            FROM AD_TREENODEPR
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TREENODEU1'
            FROM AD_TREENODEU1
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TREENODEU2'
            FROM AD_TREENODEU2
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TREENODEU3'
            FROM AD_TREENODEU3
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_TREENODEU4'
            FROM AD_TREENODEU4
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_USER'
            FROM AD_USER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_USERBPACCESS'
            FROM AD_USERBPACCESS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_USERDEF_FIELD'
            FROM AD_USERDEF_FIELD
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_USERDEF_TAB'
            FROM AD_USERDEF_TAB
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_USERDEF_WIN'
            FROM AD_USERDEF_WIN
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_USERMAIL'
            FROM AD_USERMAIL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_USER_ORGACCESS'
            FROM AD_USER_ORGACCESS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_USERQUERY'
            FROM AD_USERQUERY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_USER_ROLES'
            FROM AD_USER_ROLES
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_USER_SUBSTITUTE'
            FROM AD_USER_SUBSTITUTE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_VAL_RULE'
            FROM AD_VAL_RULE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WF_ACTIVITY'
            FROM AD_WF_ACTIVITY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WF_ACTIVITYRESULT'
            FROM AD_WF_ACTIVITYRESULT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WF_BLOCK'
            FROM AD_WF_BLOCK
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WF_EVENTAUDIT'
            FROM AD_WF_EVENTAUDIT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WF_NEXTCONDITION'
            FROM AD_WF_NEXTCONDITION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WF_NODE'
            FROM AD_WF_NODE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WF_NODENEXT'
            FROM AD_WF_NODENEXT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WF_NODE_PARA'
            FROM AD_WF_NODE_PARA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WF_NODE_TRL'
            FROM AD_WF_NODE_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WF_PROCESS'
            FROM AD_WF_PROCESS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WF_PROCESSDATA'
            FROM AD_WF_PROCESSDATA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WF_RESPONSIBLE'
            FROM AD_WF_RESPONSIBLE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WINDOW'
            FROM AD_WINDOW
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WINDOW_ACCESS'
            FROM AD_WINDOW_ACCESS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WINDOW_TRL'
            FROM AD_WINDOW_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WORKBENCH'
            FROM AD_WORKBENCH
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WORKBENCH_TRL'
            FROM AD_WORKBENCH_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WORKBENCHWINDOW'
            FROM AD_WORKBENCHWINDOW
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WORKFLOW'
            FROM AD_WORKFLOW
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WORKFLOW_ACCESS'
            FROM AD_WORKFLOW_ACCESS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WORKFLOWPROCESSOR'
            FROM AD_WORKFLOWPROCESSOR
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WORKFLOWPROCESSORLOG'
            FROM AD_WORKFLOWPROCESSORLOG
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'AD_WORKFLOW_TRL'
            FROM AD_WORKFLOW_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'A_REGISTRATION'
            FROM A_REGISTRATION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'A_REGISTRATIONATTRIBUTE'
            FROM A_REGISTRATIONATTRIBUTE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'A_REGISTRATIONPRODUCT'
            FROM A_REGISTRATIONPRODUCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'A_REGISTRATIONVALUE'
            FROM A_REGISTRATIONVALUE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'B_BID'
            FROM B_BID
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'B_BIDCOMMENT'
            FROM B_BIDCOMMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'B_BUYER'
            FROM B_BUYER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'B_BUYERFUNDS'
            FROM B_BUYERFUNDS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'B_OFFER'
            FROM B_OFFER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'B_SELLER'
            FROM B_SELLER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'B_SELLERFUNDS'
            FROM B_SELLERFUNDS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'B_TOPIC'
            FROM B_TOPIC
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'B_TOPICCATEGORY'
            FROM B_TOPICCATEGORY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'B_TOPICTYPE'
            FROM B_TOPICTYPE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_ACCTPROCESSOR'
            FROM C_ACCTPROCESSOR
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_ACCTPROCESSORLOG'
            FROM C_ACCTPROCESSORLOG
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_ACCTSCHEMA'
            FROM C_ACCTSCHEMA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_ACCTSCHEMA_DEFAULT'
            FROM C_ACCTSCHEMA_DEFAULT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_ACCTSCHEMA_ELEMENT'
            FROM C_ACCTSCHEMA_ELEMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_ACCTSCHEMA_GL'
            FROM C_ACCTSCHEMA_GL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_ACTIVITY'
            FROM C_ACTIVITY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_ALLOCATIONHDR'
            FROM C_ALLOCATIONHDR
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_ALLOCATIONLINE'
            FROM C_ALLOCATIONLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BANK'
            FROM C_BANK
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BANKACCOUNT'
            FROM C_BANKACCOUNT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BANKACCOUNT_ACCT'
            FROM C_BANKACCOUNT_ACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BANKACCOUNTDOC'
            FROM C_BANKACCOUNTDOC
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BANKSTATEMENT'
            FROM C_BANKSTATEMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BANKSTATEMENTLINE'
            FROM C_BANKSTATEMENTLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BANKSTATEMENTLOADER'
            FROM C_BANKSTATEMENTLOADER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BANKSTATEMENTMATCHER'
            FROM C_BANKSTATEMENTMATCHER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BPARTNER'
            FROM C_BPARTNER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BPARTNER_LOCATION'
            FROM C_BPARTNER_LOCATION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BPARTNER_PRODUCT'
            FROM C_BPARTNER_PRODUCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BP_BANKACCOUNT'
            FROM C_BP_BANKACCOUNT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BP_CUSTOMER_ACCT'
            FROM C_BP_CUSTOMER_ACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BP_EDI'
            FROM C_BP_EDI
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BP_EMPLOYEE_ACCT'
            FROM C_BP_EMPLOYEE_ACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BP_GROUP'
            FROM C_BP_GROUP
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BP_GROUP_ACCT'
            FROM C_BP_GROUP_ACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BP_RELATION'
            FROM C_BP_RELATION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BP_VENDOR_ACCT'
            FROM C_BP_VENDOR_ACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_BP_WITHHOLDING'
            FROM C_BP_WITHHOLDING
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_CALENDAR'
            FROM C_CALENDAR
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_CAMPAIGN'
            FROM C_CAMPAIGN
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_CASH'
            FROM C_CASH
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_CASHBOOK'
            FROM C_CASHBOOK
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_CASHBOOK_ACCT'
            FROM C_CASHBOOK_ACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_CASHLINE'
            FROM C_CASHLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_CHANNEL'
            FROM C_CHANNEL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_CHARGE'
            FROM C_CHARGE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_CHARGE_ACCT'
            FROM C_CHARGE_ACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_CITY'
            FROM C_CITY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_COMMISSION'
            FROM C_COMMISSION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_COMMISSIONAMT'
            FROM C_COMMISSIONAMT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_COMMISSIONDETAIL'
            FROM C_COMMISSIONDETAIL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_COMMISSIONLINE'
            FROM C_COMMISSIONLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_COMMISSIONRUN'
            FROM C_COMMISSIONRUN
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_CONVERSION_RATE'
            FROM C_CONVERSION_RATE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_CONVERSIONTYPE'
            FROM C_CONVERSIONTYPE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_COUNTRY'
            FROM C_COUNTRY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_COUNTRY_TRL'
            FROM C_COUNTRY_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_CURRENCY'
            FROM C_CURRENCY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_CURRENCY_ACCT'
            FROM C_CURRENCY_ACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_CURRENCY_TRL'
            FROM C_CURRENCY_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_CYCLE'
            FROM C_CYCLE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_CYCLEPHASE'
            FROM C_CYCLEPHASE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_CYCLESTEP'
            FROM C_CYCLESTEP
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_DOCTYPE'
            FROM C_DOCTYPE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_DOCTYPECOUNTER'
            FROM C_DOCTYPECOUNTER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_DOCTYPE_TRL'
            FROM C_DOCTYPE_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_DUNNING'
            FROM C_DUNNING
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_DUNNINGLEVEL'
            FROM C_DUNNINGLEVEL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_DUNNINGLEVEL_TRL'
            FROM C_DUNNINGLEVEL_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_DUNNINGRUN'
            FROM C_DUNNINGRUN
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_DUNNINGRUNENTRY'
            FROM C_DUNNINGRUNENTRY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_DUNNINGRUNLINE'
            FROM C_DUNNINGRUNLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_ELEMENT'
            FROM C_ELEMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_ELEMENTVALUE'
            FROM C_ELEMENTVALUE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_ELEMENTVALUE_TRL'
            FROM C_ELEMENTVALUE_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_GREETING'
            FROM C_GREETING
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_GREETING_TRL'
            FROM C_GREETING_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_INTERORG_ACCT'
            FROM C_INTERORG_ACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_INVOICE'
            FROM C_INVOICE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_INVOICEBATCH'
            FROM C_INVOICEBATCH
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_INVOICEBATCHLINE'
            FROM C_INVOICEBATCHLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_INVOICELINE'
            FROM C_INVOICELINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_INVOICEPAYSCHEDULE'
            FROM C_INVOICEPAYSCHEDULE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_INVOICESCHEDULE'
            FROM C_INVOICESCHEDULE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_INVOICETAX'
            FROM C_INVOICETAX
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_JOB'
            FROM C_JOB
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_JOBASSIGNMENT'
            FROM C_JOBASSIGNMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_JOBCATEGORY'
            FROM C_JOBCATEGORY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_JOBREMUNERATION'
            FROM C_JOBREMUNERATION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_LANDEDCOST'
            FROM C_LANDEDCOST
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_LANDEDCOSTALLOCATION'
            FROM C_LANDEDCOSTALLOCATION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_LOCATION'
            FROM C_LOCATION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_ACCESSCONTAINER'
            FROM CM_ACCESSCONTAINER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_ACCESSLISTBPGROUP'
            FROM CM_ACCESSLISTBPGROUP
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_ACCESSLISTROLE'
            FROM CM_ACCESSLISTROLE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_ACCESSMEDIA'
            FROM CM_ACCESSMEDIA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_ACCESSNEWSCHANNEL'
            FROM CM_ACCESSNEWSCHANNEL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_ACCESSPROFILE'
            FROM CM_ACCESSPROFILE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_ACCESSSTAGE'
            FROM CM_ACCESSSTAGE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_AD'
            FROM CM_AD
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_AD_CAT'
            FROM CM_AD_CAT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_BROADCASTSERVER'
            FROM CM_BROADCASTSERVER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_CHAT'
            FROM CM_CHAT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_CHATENTRY'
            FROM CM_CHATENTRY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_CHATTYPE'
            FROM CM_CHATTYPE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_CHATTYPEUPDATE'
            FROM CM_CHATTYPEUPDATE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_CHATUPDATE'
            FROM CM_CHATUPDATE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_CONTAINER'
            FROM CM_CONTAINER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_CONTAINER_ELEMENT'
            FROM CM_CONTAINER_ELEMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_CONTAINER_ELEMENT_TRL'
            FROM CM_CONTAINER_ELEMENT_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_CONTAINER_TRL'
            FROM CM_CONTAINER_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_CONTAINERTTABLE'
            FROM CM_CONTAINERTTABLE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_CONTAINER_URL'
            FROM CM_CONTAINER_URL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_CSTAGE'
            FROM CM_CSTAGE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_CSTAGE_ELEMENT'
            FROM CM_CSTAGE_ELEMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_CSTAGE_ELEMENT_TRL'
            FROM CM_CSTAGE_ELEMENT_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_CSTAGE_TRL'
            FROM CM_CSTAGE_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_CSTAGETTABLE'
            FROM CM_CSTAGETTABLE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_MEDIA'
            FROM CM_MEDIA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_MEDIADEPLOY'
            FROM CM_MEDIADEPLOY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_MEDIA_SERVER'
            FROM CM_MEDIA_SERVER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_NEWSCHANNEL'
            FROM CM_NEWSCHANNEL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_NEWSITEM'
            FROM CM_NEWSITEM
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_TEMPLATE'
            FROM CM_TEMPLATE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_TEMPLATE_AD_CAT'
            FROM CM_TEMPLATE_AD_CAT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_TEMPLATETABLE'
            FROM CM_TEMPLATETABLE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_WEBACCESSLOG'
            FROM CM_WEBACCESSLOG
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_WEBPROJECT'
            FROM CM_WEBPROJECT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_WEBPROJECT_DOMAIN'
            FROM CM_WEBPROJECT_DOMAIN
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'CM_WIKITOKEN'
            FROM CM_WIKITOKEN
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_NONBUSINESSDAY'
            FROM C_NONBUSINESSDAY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_ORDER'
            FROM C_ORDER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_ORDERLINE'
            FROM C_ORDERLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_ORDERTAX'
            FROM C_ORDERTAX
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_ORGASSIGNMENT'
            FROM C_ORGASSIGNMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PAYMENT'
            FROM C_PAYMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PAYMENTALLOCATE'
            FROM C_PAYMENTALLOCATE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PAYMENTBATCH'
            FROM C_PAYMENTBATCH
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PAYMENTPROCESSOR'
            FROM C_PAYMENTPROCESSOR
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PAYMENTTERM'
            FROM C_PAYMENTTERM
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PAYMENTTERM_TRL'
            FROM C_PAYMENTTERM_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PAYSCHEDULE'
            FROM C_PAYSCHEDULE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PAYSELECTION'
            FROM C_PAYSELECTION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PAYSELECTIONCHECK'
            FROM C_PAYSELECTIONCHECK
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PAYSELECTIONLINE'
            FROM C_PAYSELECTIONLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PERIOD'
            FROM C_PERIOD
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PERIODCONTROL'
            FROM C_PERIODCONTROL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PHASE'
            FROM C_PHASE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_POS'
            FROM C_POS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_POSKEY'
            FROM C_POSKEY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_POSKEYLAYOUT'
            FROM C_POSKEYLAYOUT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PROJECT'
            FROM C_PROJECT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PROJECT_ACCT'
            FROM C_PROJECT_ACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PROJECTISSUE'
            FROM C_PROJECTISSUE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PROJECTISSUEMA'
            FROM C_PROJECTISSUEMA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PROJECTLINE'
            FROM C_PROJECTLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PROJECTPHASE'
            FROM C_PROJECTPHASE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PROJECTTASK'
            FROM C_PROJECTTASK
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_PROJECTTYPE'
            FROM C_PROJECTTYPE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_RECURRING'
            FROM C_RECURRING
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_RECURRING_RUN'
            FROM C_RECURRING_RUN
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_REGION'
            FROM C_REGION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_REMUNERATION'
            FROM C_REMUNERATION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_REVENUERECOGNITION'
            FROM C_REVENUERECOGNITION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_REVENUERECOGNITION_PLAN'
            FROM C_REVENUERECOGNITION_PLAN
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_REVENUERECOGNITION_RUN'
            FROM C_REVENUERECOGNITION_RUN
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_RFQ'
            FROM C_RFQ
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_RFQLINE'
            FROM C_RFQLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_RFQLINEQTY'
            FROM C_RFQLINEQTY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_RFQRESPONSE'
            FROM C_RFQRESPONSE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_RFQRESPONSELINE'
            FROM C_RFQRESPONSELINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_RFQRESPONSELINEQTY'
            FROM C_RFQRESPONSELINEQTY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_RFQ_TOPIC'
            FROM C_RFQ_TOPIC
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_RFQ_TOPICSUBSCRIBER'
            FROM C_RFQ_TOPICSUBSCRIBER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_RFQ_TOPICSUBSCRIBERONLY'
            FROM C_RFQ_TOPICSUBSCRIBERONLY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_SALESREGION'
            FROM C_SALESREGION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_SERVICELEVEL'
            FROM C_SERVICELEVEL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_SERVICELEVELLINE'
            FROM C_SERVICELEVELLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_SUBACCT'
            FROM C_SUBACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_SUBSCRIPTION'
            FROM C_SUBSCRIPTION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_SUBSCRIPTION_DELIVERY'
            FROM C_SUBSCRIPTION_DELIVERY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_SUBSCRIPTIONTYPE'
            FROM C_SUBSCRIPTIONTYPE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_TASK'
            FROM C_TASK
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_TAX'
            FROM C_TAX
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_TAX_ACCT'
            FROM C_TAX_ACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_TAXCATEGORY'
            FROM C_TAXCATEGORY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_TAXCATEGORY_TRL'
            FROM C_TAXCATEGORY_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_TAXDECLARATION'
            FROM C_TAXDECLARATION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_TAXDECLARATIONACCT'
            FROM C_TAXDECLARATIONACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_TAXDECLARATIONLINE'
            FROM C_TAXDECLARATIONLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_TAXPOSTAL'
            FROM C_TAXPOSTAL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_TAX_TRL'
            FROM C_TAX_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_UOM'
            FROM C_UOM
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_UOM_CONVERSION'
            FROM C_UOM_CONVERSION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_UOM_TRL'
            FROM C_UOM_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_USERREMUNERATION'
            FROM C_USERREMUNERATION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_VALIDCOMBINATION'
            FROM C_VALIDCOMBINATION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_WITHHOLDING'
            FROM C_WITHHOLDING
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_WITHHOLDING_ACCT'
            FROM C_WITHHOLDING_ACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'C_YEAR'
            FROM C_YEAR
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'FACT_ACCT'
            FROM FACT_ACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'FACT_ACCT_BALANCE'
            FROM FACT_ACCT_BALANCE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'GL_BUDGET'
            FROM GL_BUDGET
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'GL_BUDGETCONTROL'
            FROM GL_BUDGETCONTROL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'GL_CATEGORY'
            FROM GL_CATEGORY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'GL_DISTRIBUTION'
            FROM GL_DISTRIBUTION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'GL_DISTRIBUTIONLINE'
            FROM GL_DISTRIBUTIONLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'GL_FUND'
            FROM GL_FUND
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'GL_FUNDRESTRICTION'
            FROM GL_FUNDRESTRICTION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'GL_JOURNAL'
            FROM GL_JOURNAL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'GL_JOURNALBATCH'
            FROM GL_JOURNALBATCH
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'GL_JOURNALLINE'
            FROM GL_JOURNALLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'I_BANKSTATEMENT'
            FROM I_BANKSTATEMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'I_BPARTNER'
            FROM I_BPARTNER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'I_CONVERSION_RATE'
            FROM I_CONVERSION_RATE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'I_ELEMENTVALUE'
            FROM I_ELEMENTVALUE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'I_GLJOURNAL'
            FROM I_GLJOURNAL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'I_INOUTLINECONFIRM'
            FROM I_INOUTLINECONFIRM
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'I_INVENTORY'
            FROM I_INVENTORY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'I_INVOICE'
            FROM I_INVOICE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'I_ORDER'
            FROM I_ORDER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'I_PAYMENT'
            FROM I_PAYMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'I_PRODUCT'
            FROM I_PRODUCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'I_REPORTLINE'
            FROM I_REPORTLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'K_CATEGORY'
            FROM K_CATEGORY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'K_CATEGORYVALUE'
            FROM K_CATEGORYVALUE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'K_COMMENT'
            FROM K_COMMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'K_ENTRY'
            FROM K_ENTRY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'K_ENTRYCATEGORY'
            FROM K_ENTRYCATEGORY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'K_ENTRYRELATED'
            FROM K_ENTRYRELATED
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'K_INDEX'
            FROM K_INDEX
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'K_INDEXLOG'
            FROM K_INDEXLOG
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'K_INDEXSTOP'
            FROM K_INDEXSTOP
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'K_SOURCE'
            FROM K_SOURCE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'K_SYNONYM'
            FROM K_SYNONYM
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'K_TOPIC'
            FROM K_TOPIC
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'K_TYPE'
            FROM K_TYPE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_ATTRIBUTE'
            FROM M_ATTRIBUTE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_ATTRIBUTEINSTANCE'
            FROM M_ATTRIBUTEINSTANCE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_ATTRIBUTESEARCH'
            FROM M_ATTRIBUTESEARCH
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_ATTRIBUTESET'
            FROM M_ATTRIBUTESET
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_ATTRIBUTESETEXCLUDE'
            FROM M_ATTRIBUTESETEXCLUDE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_ATTRIBUTESETINSTANCE'
            FROM M_ATTRIBUTESETINSTANCE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_ATTRIBUTEUSE'
            FROM M_ATTRIBUTEUSE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_ATTRIBUTEVALUE'
            FROM M_ATTRIBUTEVALUE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_BOM'
            FROM M_BOM
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_BOMALTERNATIVE'
            FROM M_BOMALTERNATIVE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_BOMPRODUCT'
            FROM M_BOMPRODUCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_CHANGENOTICE'
            FROM M_CHANGENOTICE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_CHANGEREQUEST'
            FROM M_CHANGEREQUEST
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_COST'
            FROM M_COST
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_COSTDETAIL'
            FROM M_COSTDETAIL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_COSTELEMENT'
            FROM M_COSTELEMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_COSTQUEUE'
            FROM M_COSTQUEUE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_COSTTYPE'
            FROM M_COSTTYPE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_DEMAND'
            FROM M_DEMAND
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_DEMANDDETAIL'
            FROM M_DEMANDDETAIL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_DEMANDLINE'
            FROM M_DEMANDLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_DISCOUNTSCHEMA'
            FROM M_DISCOUNTSCHEMA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_DISCOUNTSCHEMABREAK'
            FROM M_DISCOUNTSCHEMABREAK
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_DISCOUNTSCHEMALINE'
            FROM M_DISCOUNTSCHEMALINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_DISTRIBUTIONLIST'
            FROM M_DISTRIBUTIONLIST
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_DISTRIBUTIONLISTLINE'
            FROM M_DISTRIBUTIONLISTLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_DISTRIBUTIONRUN'
            FROM M_DISTRIBUTIONRUN
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_DISTRIBUTIONRUNLINE'
            FROM M_DISTRIBUTIONRUNLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_EDI'
            FROM M_EDI
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_EDI_INFO'
            FROM M_EDI_INFO
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_FORECAST'
            FROM M_FORECAST
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_FORECASTLINE'
            FROM M_FORECASTLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_FREIGHT'
            FROM M_FREIGHT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_FREIGHTCATEGORY'
            FROM M_FREIGHTCATEGORY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_INOUT'
            FROM M_INOUT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_INOUTCONFIRM'
            FROM M_INOUTCONFIRM
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_INOUTLINE'
            FROM M_INOUTLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_INOUTLINECONFIRM'
            FROM M_INOUTLINECONFIRM
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_INOUTLINEMA'
            FROM M_INOUTLINEMA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_INVENTORY'
            FROM M_INVENTORY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_INVENTORYLINE'
            FROM M_INVENTORYLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_INVENTORYLINEMA'
            FROM M_INVENTORYLINEMA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_LOCATOR'
            FROM M_LOCATOR
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_LOT'
            FROM M_LOT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_LOTCTL'
            FROM M_LOTCTL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_LOTCTLEXCLUDE'
            FROM M_LOTCTLEXCLUDE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_MATCHINV'
            FROM M_MATCHINV
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_MATCHPO'
            FROM M_MATCHPO
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_MOVEMENT'
            FROM M_MOVEMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_MOVEMENTCONFIRM'
            FROM M_MOVEMENTCONFIRM
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_MOVEMENTLINE'
            FROM M_MOVEMENTLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_MOVEMENTLINECONFIRM'
            FROM M_MOVEMENTLINECONFIRM
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_MOVEMENTLINEMA'
            FROM M_MOVEMENTLINEMA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_OPERATIONRESOURCE'
            FROM M_OPERATIONRESOURCE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PACKAGE'
            FROM M_PACKAGE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PACKAGELINE'
            FROM M_PACKAGELINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PERPETUALINV'
            FROM M_PERPETUALINV
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PRICELIST'
            FROM M_PRICELIST
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PRICELIST_VERSION'
            FROM M_PRICELIST_VERSION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PRODUCT'
            FROM M_PRODUCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PRODUCT_ACCT'
            FROM M_PRODUCT_ACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PRODUCT_BOM'
            FROM M_PRODUCT_BOM
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PRODUCT_CATEGORY'
            FROM M_PRODUCT_CATEGORY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PRODUCT_CATEGORY_ACCT'
            FROM M_PRODUCT_CATEGORY_ACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PRODUCT_COSTING'
            FROM M_PRODUCT_COSTING
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PRODUCTDOWNLOAD'
            FROM M_PRODUCTDOWNLOAD
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PRODUCTION'
            FROM M_PRODUCTION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PRODUCTIONLINE'
            FROM M_PRODUCTIONLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PRODUCTIONLINEMA'
            FROM M_PRODUCTIONLINEMA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PRODUCTIONPLAN'
            FROM M_PRODUCTIONPLAN
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PRODUCTOPERATION'
            FROM M_PRODUCTOPERATION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PRODUCT_PO'
            FROM M_PRODUCT_PO
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PRODUCTPRICE'
            FROM M_PRODUCTPRICE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_PRODUCT_TRL'
            FROM M_PRODUCT_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_RELATEDPRODUCT'
            FROM M_RELATEDPRODUCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_REPLENISH'
            FROM M_REPLENISH
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_REQUISITION'
            FROM M_REQUISITION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_REQUISITIONLINE'
            FROM M_REQUISITIONLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_RMA'
            FROM M_RMA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_RMALINE'
            FROM M_RMALINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_RMATYPE'
            FROM M_RMATYPE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_SERNOCTL'
            FROM M_SERNOCTL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_SERNOCTLEXCLUDE'
            FROM M_SERNOCTLEXCLUDE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_SHIPPER'
            FROM M_SHIPPER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_STORAGE'
            FROM M_STORAGE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_SUBSTITUTE'
            FROM M_SUBSTITUTE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_TRANSACTION'
            FROM M_TRANSACTION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_TRANSACTIONALLOCATION'
            FROM M_TRANSACTIONALLOCATION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_WAREHOUSE'
            FROM M_WAREHOUSE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'M_WAREHOUSE_ACCT'
            FROM M_WAREHOUSE_ACCT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_ACHIEVEMENT'
            FROM PA_ACHIEVEMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_BENCHMARK'
            FROM PA_BENCHMARK
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_BENCHMARKDATA'
            FROM PA_BENCHMARKDATA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_COLORSCHEMA'
            FROM PA_COLORSCHEMA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_DASHBOARDCONTENT'
            FROM PA_DASHBOARDCONTENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_GOAL'
            FROM PA_GOAL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_GOALRESTRICTION'
            FROM PA_GOALRESTRICTION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_HIERARCHY'
            FROM PA_HIERARCHY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_MEASURE'
            FROM PA_MEASURE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_MEASURECALC'
            FROM PA_MEASURECALC
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_RATIO'
            FROM PA_RATIO
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_RATIOELEMENT'
            FROM PA_RATIOELEMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_REPORT'
            FROM PA_REPORT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_REPORTCOLUMN'
            FROM PA_REPORTCOLUMN
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_REPORTCOLUMNSET'
            FROM PA_REPORTCOLUMNSET
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_REPORTLINE'
            FROM PA_REPORTLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_REPORTLINESET'
            FROM PA_REPORTLINESET
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_REPORTSOURCE'
            FROM PA_REPORTSOURCE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_SLA_CRITERIA'
            FROM PA_SLA_CRITERIA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_SLA_GOAL'
            FROM PA_SLA_GOAL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'PA_SLA_MEASURE'
            FROM PA_SLA_MEASURE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_CATEGORY'
            FROM R_CATEGORY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_CATEGORYUPDATES'
            FROM R_CATEGORYUPDATES
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_CONTACTINTEREST'
            FROM R_CONTACTINTEREST
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_GROUP'
            FROM R_GROUP
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_GROUPUPDATES'
            FROM R_GROUPUPDATES
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_INTERESTAREA'
            FROM R_INTERESTAREA
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_ISSUEKNOWN'
            FROM R_ISSUEKNOWN
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_ISSUEPROJECT'
            FROM R_ISSUEPROJECT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_ISSUERECOMMENDATION'
            FROM R_ISSUERECOMMENDATION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_ISSUESOURCE'
            FROM R_ISSUESOURCE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_ISSUESTATUS'
            FROM R_ISSUESTATUS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_ISSUESYSTEM'
            FROM R_ISSUESYSTEM
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_ISSUEUSER'
            FROM R_ISSUEUSER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_MAILTEXT'
            FROM R_MAILTEXT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_MAILTEXT_TRL'
            FROM R_MAILTEXT_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_REQUEST'
            FROM R_REQUEST
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_REQUESTACTION'
            FROM R_REQUESTACTION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_REQUESTPROCESSOR'
            FROM R_REQUESTPROCESSOR
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_REQUESTPROCESSORLOG'
            FROM R_REQUESTPROCESSORLOG
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_REQUESTPROCESSOR_ROUTE'
            FROM R_REQUESTPROCESSOR_ROUTE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_REQUESTTYPE'
            FROM R_REQUESTTYPE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_REQUESTTYPEUPDATES'
            FROM R_REQUESTTYPEUPDATES
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_REQUESTUPDATE'
            FROM R_REQUESTUPDATE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_REQUESTUPDATES'
            FROM R_REQUESTUPDATES
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_RESOLUTION'
            FROM R_RESOLUTION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_STANDARDRESPONSE'
            FROM R_STANDARDRESPONSE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_STATUS'
            FROM R_STATUS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'R_STATUSCATEGORY'
            FROM R_STATUSCATEGORY
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'S_EXPENSETYPE'
            FROM S_EXPENSETYPE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'S_RESOURCE'
            FROM S_RESOURCE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'S_RESOURCEASSIGNMENT'
            FROM S_RESOURCEASSIGNMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'S_RESOURCETYPE'
            FROM S_RESOURCETYPE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'S_RESOURCEUNAVAILABLE'
            FROM S_RESOURCEUNAVAILABLE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'S_TIMEEXPENSE'
            FROM S_TIMEEXPENSE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'S_TIMEEXPENSELINE'
            FROM S_TIMEEXPENSELINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'S_TIMETYPE'
            FROM S_TIMETYPE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'S_TRAINING'
            FROM S_TRAINING
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'S_TRAINING_CLASS'
            FROM S_TRAINING_CLASS
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'T_AGING'
            FROM T_AGING
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'T_DISTRIBUTIONRUNDETAIL'
            FROM T_DISTRIBUTIONRUNDETAIL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'TEST'
            FROM TEST
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'T_INVENTORYVALUE'
            FROM T_INVENTORYVALUE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'T_INVOICEGL'
            FROM T_INVOICEGL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'T_REPLENISH'
            FROM T_REPLENISH
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'T_TRANSACTION'
            FROM T_TRANSACTION
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'T_TRIALBALANCE'
            FROM T_TRIALBALANCE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'U_BLACKLISTCHEQUE'
            FROM U_BLACKLISTCHEQUE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'U_ROLEMENU'
            FROM U_ROLEMENU
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'U_WEBMENU'
            FROM U_WEBMENU
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'U_WEB_PROPERTIES'
            FROM U_WEB_PROPERTIES
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'W_ADVERTISEMENT'
            FROM W_ADVERTISEMENT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'W_BASKET'
            FROM W_BASKET
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'W_BASKETLINE'
            FROM W_BASKETLINE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'W_CLICK'
            FROM W_CLICK
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'W_CLICKCOUNT'
            FROM W_CLICKCOUNT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'W_COUNTER'
            FROM W_COUNTER
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'W_COUNTERCOUNT'
            FROM W_COUNTERCOUNT
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'W_MAILMSG'
            FROM W_MAILMSG
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'W_MAILMSG_TRL'
            FROM W_MAILMSG_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'W_STORE'
            FROM W_STORE
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0
          UNION
          SELECT COUNT (*), 'W_STORE_TRL'
            FROM W_STORE_TRL
           WHERE ad_client_id = 0
          HAVING COUNT (*) > 0)
ORDER BY tabla
