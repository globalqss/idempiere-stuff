#!/bin/bash
USAGE="Usage: $0 [update|reinstall|recreate|update_or_reinstall]
Parameter:
- none -> without parameters just restart the server
- update -> execute update.sh to get the newest from p2 repository
- reinstall -> reinstall from installer
- recreate -> reinstall and recreate the database
- update_or_reinstall -> execute update.sh to get the newest from p2 repository, if update.sh fails then reinstall"
ACTION="$1"
if [ "$#" -gt 1 ] || { [ "$#" -eq 1 ] && [ "$ACTION" != "update" ] && [ "$ACTION" != "reinstall" ] && [ "$ACTION" != "recreate" ] && [ "$ACTION" != "update_or_reinstall" ] ; }
then
    echo "$USAGE"
    exit 1
fi

echo "** Stopping server - $(date +'%Y-%m-%d %H:%M:%S')"
touch /tmp/deploying_now
~/zabbix_cmd.sh login ; ~/zabbix_cmd.sh disable
sudo /usr/sbin/service idempiere stop

CNT=$(pgrep dempiere-server | wc -l)
if [ "$CNT" -gt 1 ]
then
    echo "iDempiere didn't stop - please review"
    rm -f /tmp/deploying_now /tmp/consecutive_reached
    bash ~/zabbix_cmd.sh enable ; bash ~/zabbix_cmd.sh logout
    exit 1
fi

if [ "$ACTION" = "update" ] || [ "$ACTION" = "update_or_reinstall" ]
then
    echo "** Updating iDempiere from p2 repository - $(date +'%Y-%m-%d %H:%M:%S')"
    cd /opt/idempiere-server || exit 1
    bash update.sh https://jenkins.idempiere.org/job/iDempiere/ws/org.idempiere.p2/target/repository/
    cd /opt/idempiere-server/utils || exit 1
    if [ ! -s RUN_SyncDB.sh ]
    then
	if [ "$ACTION" = "update_or_reinstall" ]
	then
	    ACTION="reinstall"
	else
	    echo "update.sh failed - RUN_SyncDB.sh doesn't exist - please verify"
	    rm -f /tmp/deploying_now
	    touch /tmp/consecutive_reached
	    bash ~/zabbix_cmd.sh enable ; bash ~/zabbix_cmd.sh logout
	    exit 1
	fi
    fi

    # install webstore
    sudo /usr/sbin/service idempiere start
    sleep 20
    ( echo uninstall org.adempiere.webstore; sleep 3 ) | telnet localhost 12612
    ( echo install https://jenkins.idempiere.org/job/idempiere-webstore/ws/org.adempiere.webstore/target/org.adempiere.webstore-9.0.0-SNAPSHOT.jar; sleep 3 ) | telnet localhost 12612
    ( echo setbsl 5 org.adempiere.webstore; sleep 3 ) | telnet localhost 12612
    sudo /usr/sbin/service idempiere stop

fi

if [ "$ACTION" = "reinstall" ] || [ "$ACTION" = "recreate" ]
then
    echo "** Reinstalling iDempiere from installer - $(date +'%Y-%m-%d %H:%M:%S')"
    cd || exit 1
    echo "** Downloading installer - $(date +'%Y-%m-%d %H:%M:%S')"
    wget --no-verbose -O idempiereServer.gtk.linux.x86_64.zip https://jenkins.idempiere.org/job/iDempiere/ws/org.idempiere.p2/target/products/org.adempiere.server.product/idempiereServer.gtk.linux.x86_64.zip
    echo "** Backing up previous server - $(date +'%Y-%m-%d %H:%M:%S')"
    # assume idempiere must own /opt
    # assume idempiere setup must have been executed at least one time.
    cd /opt || exit 1
    mkdir -p idempiere-server.old
    find idempiere-server.old -mindepth 1 -delete
    mv idempiere-server/{,.[!.],..?}* idempiere-server.old
    echo "** Unzipping new server - $(date +'%Y-%m-%d %H:%M:%S')"
    unzip -q ~/idempiereServer.gtk.linux.x86_64.zip
    mv idempiere.gtk.linux.x86_64/idempiere-server/* idempiere-server
    rmdir idempiere.gtk.linux.x86_64/idempiere-server
    rmdir idempiere.gtk.linux.x86_64
    cp -p -r idempiere-server.old/idempiereEnv.properties idempiere-server/idempiereEnv.properties
    cp -p -r idempiere-server.old/.idpass idempiere-server/.idpass
    cp -p -r idempiere-server.old/jettyhome/etc/keystore idempiere-server/jettyhome/etc/keystore
    mkdir -p idempiere-server/log
    ln idempiere-server.old/log/* idempiere-server/log
    cd idempiere-server || exit 1
    echo "** Setting up server - $(date +'%Y-%m-%d %H:%M:%S')"
    bash silent-setup-alt.sh

    # reinstall VaadinMobile
    # DESTINATION=/opt/idempiere-server
    # VMOPTS="-Dorg.eclipse.ecf.provider.filetransfer.excludeContributors=org.eclipse.ecf.provider.filetransfer.httpclient4 -Djava.net.preferIPv4Stack=true"
    # REPO=https://jenkins.idempiere.org/job/vaadinmobile/ws/buckminster.output/com.trekglobal.vaadin.update_1.0.0-eclipse.feature/site.p2/
    # PRODUCT=com.trekglobal.vaadinmobile
    # cd $DESTINATION
    # java $VMOPTS -jar plugins/org.eclipse.equinox.launcher_1.*.jar -install director \
      # -configuration director/configuration -application org.eclipse.equinox.p2.director \
      # -consoleLog -profileProperties org.eclipse.update.install.features=true \
      # -destination $DESTINATION \
      # -repository $REPO \
      # -u $PRODUCT
    # java $VMOPTS -jar plugins/org.eclipse.equinox.launcher_1.*.jar -install director \
      # -configuration director/configuration -application org.eclipse.equinox.p2.director \
      # -consoleLog -profileProperties org.eclipse.update.install.features=true \
      # -destination $DESTINATION \
      # -repository $REPO \
      # -i $PRODUCT

    # install webstore
    sudo /usr/sbin/service idempiere start
    sleep 20
    ( echo uninstall org.adempiere.webstore; sleep 3 ) | telnet localhost 12612
    ( echo install https://jenkins.idempiere.org/job/idempiere-webstore/ws/org.adempiere.webstore/target/org.adempiere.webstore-9.0.0-SNAPSHOT.jar; sleep 3 ) | telnet localhost 12612
    ( echo setbsl 5 org.adempiere.webstore; sleep 3 ) | telnet localhost 12612
    sudo /usr/sbin/service idempiere stop

fi

if [ "$ACTION" = "recreate" ]
then
    echo "** Importing seed database - $(date +'%Y-%m-%d %H:%M:%S')"
    cd /opt/idempiere-server/utils || exit 1
    (yes | bash RUN_ImportIdempiere.sh )
    echo "
CREATE EXTENSION \"uuid-ossp\";
UPDATE AD_SysConfig SET Value='Y' WHERE Name='USE_EMAIL_FOR_LOGIN';
UPDATE AD_SysConfig SET Value='Y' WHERE Name='ZK_GRID_EDIT_MODELESS';
UPDATE AD_SysConfig SET Value='Y' WHERE Name='ZK_GRID_VIEW_USE_DEFER_RENDERING';
INSERT INTO ad_sysconfig (ad_sysconfig_id, ad_client_id, ad_org_id, created, updated, createdby, updatedby, isactive, name, value, description, entitytype, configurationlevel, ad_sysconfig_uu) VALUES(nextidfunc(50009,'N'), 0, 0, statement_timestamp(), statement_timestamp(), 100, 100, 'Y', 'ZK_BROWSER_TITLE', '*TEST* iDempiere', NULL, 'U', 'S', generate_uuid());
INSERT INTO ad_userpreference (ad_client_id, ad_org_id, ad_user_id, ad_userpreference_id, ad_userpreference_uu, autocommit, autonew, created, createdby, isactive, updated, updatedby, automaticdecimalplacesforamoun, toggleondoubleclick, isdetailedzoomacross, isusesimilarto, viewfindresult) VALUES(0, 0, 100, nextidfunc(200230,'N'), generate_uuid(), 'Y', 'Y', statement_timestamp(), 100, 'Y', statement_timestamp(), 100, 0, 'N', 'Y', 'Y', '0');
INSERT INTO ad_userpreference (ad_client_id, ad_org_id, ad_user_id, ad_userpreference_id, ad_userpreference_uu, autocommit, autonew, created, createdby, isactive, updated, updatedby, automaticdecimalplacesforamoun, toggleondoubleclick, isdetailedzoomacross, isusesimilarto, viewfindresult) VALUES(11, 0, 100, nextidfunc(200230,'N'), generate_uuid(), 'Y', 'Y', statement_timestamp(), 100, 'Y', statement_timestamp(), 100, 0, 'N', 'Y', 'Y', '0');
UPDATE AD_UserPreference SET IsDetailedZoomAcross='Y', IsUseSimilarTo='Y';
UPDATE ad_column SET isautocomplete='Y' WHERE ad_reference_id IN (17,18,19,30) AND isactive='Y' AND isautocomplete='N';  /* Test IDEMPIERE-1540 */
" | psql -d idempiere -U adempiere
fi

if [ "$#" -eq 1 ]
then
    echo "** Applying new scripts - $(date +'%Y-%m-%d %H:%M:%S')"
    cd /opt/idempiere-server/utils || exit 1
    bash RUN_SyncDB.sh
    cd /opt/idempiere-server || exit 1
    echo "** Signing database - $(date +'%Y-%m-%d %H:%M:%S')"
    timeout -k 30s 15s sh sign-database-build-alt.sh 2>&1 | grep -F SignDatabaseBuildApplication.start:
fi

if [ "$ACTION" = "recreate" ]
then
    echo "** Importing languages - $(date +'%Y-%m-%d %H:%M:%S')"
    sudo /usr/sbin/service idempiere start
    bash ~/languages/addLanguages.sh
    sudo /usr/sbin/service idempiere stop
fi

echo "** Starting server - $(date +'%Y-%m-%d %H:%M:%S')"
sudo /usr/sbin/service idempiere start
rm -f /tmp/deploying_now /tmp/consecutive_reached
bash ~/zabbix_cmd.sh enable ; bash ~/zabbix_cmd.sh logout
