:
# parameters likely to change
ROOTDIR=C:/srcAdempiere
MODULE=branches/stable
STARTREVISION=4946

# parameters unlikely to change
REPOSITORY=https://adempiere.svn.sourceforge.net/svnroot/adempiere
FINALREVISION=HEAD
BINDIR=$ROOTDIR/$MODULE/bin
OUTDIR=C:/Documentos/Qss/Proyectos/QSS/java/patches$$
TMPFILE=/tmp/lisjavafiles$$
TMPFILE2=/tmp/lisjavafiles2_$$

mkdir -p $OUTDIR
> $TMPFILE

svn log --verbose --revision $STARTREVISION:$FINALREVISION $REPOSITORY/$MODULE |
grep "   [ADM] /$MODULE/.*\.java" |
while read ACTION FILE
do
    if [ x$ACTION = xM -o x$ACTION = xA ]
    then
        echo $ROOTDIR$FILE >> $TMPFILE
	sort -u -o $TMPFILE $TMPFILE
    elif [ x$ACTION = xD ]
    then
        fgrep -v -x $ROOTDIR$FILE $TMPFILE > $TMPFILE2
	mv $TMPFILE2 $TMPFILE
    else
        echo "Unknown ACTION on svn log : $ACTION $FILE"
    fi
done

CLASSES=""
for JARLIB in `ls $ROOTDIR/$MODULE/tools/lib/*.jar $ROOTDIR/$MODULE/JasperReportsTools/lib/*.jar`
do
    CLASSES="$CLASSES;$JARLIB"
done

export CLASSPATH="$BINDIR$CLASSES"
dos2unix $TMPFILE
javac -d $OUTDIR `cat $TMPFILE`

jar cvf patches.jar -C $OUTDIR .

rm $TMPFILE
rm -rf $OUTDIR