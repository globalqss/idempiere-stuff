HERE="$(dirname $(readlink -f $0))"
cd /tmp
export BASE=~/hgAdempiere/localosgi
export OUT_DIR=/tmp/API
export FILE_PACKAGES=/tmp/packages.txt

export IDEMPIERE_VERSION=2.1_20141110

export CLASSPATH=
for JARFILE in `find $BASE -name "*.jar"`
do
    if [ x$CLASSPATH = x ]
    then
        CLASSPATH="$JARFILE"
    else
        CLASSPATH="$CLASSPATH:$JARFILE"
    fi
done
echo "CLASSPATH=$CLASSPATH"
echo

> $FILE_PACKAGES.tmp
export SRCPATH=
for DIR in \
org.adempiere.base \
org.adempiere.base.callout \
org.adempiere.base.process \
org.adempiere.eclipse.equinox.http.servlet \
org.adempiere.eclipse.equinox.http.servletbridge \
org.adempiere.eclipse.equinox.servletbridge \
org.adempiere.install \
org.adempiere.payment.processor \
org.adempiere.pipo \
org.adempiere.pipo.handlers \
org.adempiere.plugin.utils \
org.adempiere.replication \
org.adempiere.replication.server \
org.adempiere.report.jasper \
org.adempiere.report.jasper.webapp \
org.adempiere.server \
org.adempiere.ui \
org.adempiere.ui.zk \
org.adempiere.webstore \
org.adempiere.webstore.servlet \
org.apache.ecs \
org.compiere.db.oracle.provider \
org.compiere.db.postgresql.provider \
org.idempiere.felix.webconsole \
org.idempiere.hazelcast.service \
org.idempiere.webservices \
org.zkoss.zk.library
do
    SRCDIR=$BASE/$DIR/src
    if [ x$SRCPATH = x ]
    then
        SRCPATH="$SRCDIR"
    else
        SRCPATH="$SRCPATH:$SRCDIR"
    fi
    find $SRCDIR -name "*.java" | sed -e "s:$SRCDIR/::" | sed -e 's:\(.*\)/.*\.java:\1:' |sort -u >> $FILE_PACKAGES.tmp
done
echo "SRCPATH=$SRCPATH"
echo
sort -u $FILE_PACKAGES.tmp | sed -e 's:/:.:g' > $FILE_PACKAGES
rm $FILE_PACKAGES.tmp
echo "PACKAGES:"
cat $FILE_PACKAGES
echo

rm -rf $OUT_DIR

echo javadoc -sourcepath $SRCPATH -d $OUT_DIR -use -author -breakiterator -version -link https://docs.oracle.com/javase/6/docs/api/ -splitindex -windowtitle "iDempiere $IDEMPIERE_VERSION API Documentation" -doctitle "iDempiere<sup>TM</sup> API Documentation" -header "<b>iDempiere $IDEMPIERE_VERSION</b>" -bottom "iDempiere" -overview $HERE/doc/overview.html -J-Xmx180m @$FILE_PACKAGES
javadoc -sourcepath $SRCPATH -d $OUT_DIR -use -author -breakiterator -version -link https://docs.oracle.com/javase/6/docs/api/ -splitindex -windowtitle "iDempiere $IDEMPIERE_VERSION API Documentation" -doctitle "iDempiere<sup>TM</sup> API Documentation" -header "<b>iDempiere $IDEMPIERE_VERSION</b>" -bottom "iDempiere" -overview $HERE/doc/overview.html -J-Xmx1024m @$FILE_PACKAGES
echo

# umount /mnt


exit
event.test
fitnesse
migration
org.adempiere.extend
org.adempiere.pipo.legacy
org.adempiere.report.jasper.swing
org.adempiere.ui.swing
org.adempiere.ui.swing.pluginlist
org.idempiere.fitnesse.fixture
org.idempiere.fitnesse.server
org.idempiere.fitrecorder
org.adempiere.ui.zk.example
org.idempiere.ui.zk.selenium
selenese
ztl
