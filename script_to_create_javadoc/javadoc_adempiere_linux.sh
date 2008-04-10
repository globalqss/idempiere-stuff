cd /tmp
# mount -t cifs //192.168.0.100/srcAdempiere /mnt -o "username=Carlos"
export BASE=/mnt/tags/adempiere340
export OUT_DIR=/tmp/API
export FILE_PACKAGES=/tmp/packages.txt

export ADEMPIERE_VERSION=3.4.0s

export CLASSPATH=
for JARFILE in `find $BASE -name "*.jar" | fgrep -v .svn`
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
for SRCDIR in \
    $BASE/base/src \
    $BASE/client/src \
    $BASE/sqlj/src \
    $BASE/print/src \
    $BASE/looks/src \
    $BASE/install/src \
    $BASE/extend/src \
    $BASE/serverRoot/src/main/ejb \
    $BASE/serverRoot/src/main/server \
    $BASE/serverRoot/src/main/servlet \
    $BASE/interfaces/src \
    $BASE/serverApps/src/main/servlet \
    $BASE/posterita/src/main \
    $BASE/extension/posterita/webui/WEB-INF/src \
    $BASE/tools/src \
    $BASE/migration/src \
    $BASE/JasperReports/src \
    $BASE/JasperReportsWebApp/src \
    $BASE/webCM/src/main/servlet
do
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

echo javadoc -sourcepath $SRCPATH -d $OUT_DIR -use -author -breakiterator -version -link http://java.sun.com/j2se/1.5.0/docs/api -link http://java.sun.com/j2ee/1.4/docs/api -splitindex -windowtitle "Adempiere $ADEMPIERE_VERSION API Documentation" -doctitle "Adempiere<sup>TM</sup> API Documentation" -header "<b>Adempiere $ADEMPIERE_VERSION</b>" -bottom "AdemPiere" -overview doc\overview.html -J-Xmx180m @$FILE_PACKAGES
javadoc -sourcepath $SRCPATH -d $OUT_DIR -use -author -breakiterator -version -link http://java.sun.com/j2se/1.5.0/docs/api -link http://java.sun.com/j2ee/1.4/docs/api -splitindex -windowtitle "Adempiere $ADEMPIERE_VERSION API Documentation" -doctitle "Adempiere<sup>TM</sup> API Documentation" -header "<b>Adempiere $ADEMPIERE_VERSION</b>" -bottom "AdemPiere" -overview doc\overview.html -J-Xmx1024m @$FILE_PACKAGES
echo

# umount /mnt