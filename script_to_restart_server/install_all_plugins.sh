WD="`dirname $0`"
cd $WD
for i in *.jar; do expr $i : "\(.*\)_.*"; done | sort -u | while read PLUGIN
do
    FILE=`ls ${PLUGIN}_[0-9]*.jar | tail -1`
    echo "install file://$PWD/$FILE"
    if [ "$PLUGIN" = "de.bxservice.omnisearchdp" ]
    then
	echo "refresh org.adempiere.ui.zk" # host for fragment
    fi
    echo "setbsl 5 $PLUGIN"
    echo "sta ${PLUGIN}"
done > /tmp/install$$
echo "disconnect
y
" >> /tmp/install$$
( cat /tmp/install$$; sleep 5 ) | telnet localhost 12612
