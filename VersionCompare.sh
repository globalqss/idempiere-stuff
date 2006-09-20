:
#
# ADempiere contribution
# Author: Carlos Antonio Ruiz Gomez - globalqss
# Compare sources of different versions of ADempiere
#
# Tested on Linux Fedora Core 4
#
# Previous steps:
# # If sources are in windows machine you must have a share
# smbmount //laptop/f$ /mnt -o username=Carlos
#
# cd /tmp
# # Create two symbolic links pointing to root directory of every version to compare
# ln -s /mnt/srcADempiere/adempiere-contributions/stuff/VersionCompare.sh .
# # this scripts compare files on compiere-all subdirectories !!!
# # so we need to make this trick to show kompierelibero as compiere-all
# mkdir K253b
# ln -s /mnt/srcAdempiere/adempiere-contributions/253b/kompierelibero K253b/compiere-all
# ln -s /mnt/srcADempiere/adempiere-core C253b
#
# Run as:
# cd /tmp
# ./VersionCompare.sh C253b K253b
# # it generates the file /tmp/DiffADempiere....htm
#

V1=$1
V2=$2
TMP=/tmp/DiffADempiere${V1}${V2}.htm
> $TMP
INITDIR=/tmp

echo "<html><head><title>DiffADempiere${V1}${V2}</title>
</head>
<body>
<h1>Differences between ADempiere version ${V1} and ${V2} </h1>
<p />
Compare files with SQL aps bat bsh java jnlp js jsp sh sql xml xsl extensions
<p />
" >> $TMP

echo "<h2>Files in ${V1} and not in ${V2} </h2>" >> $TMP
echo "<pre>" >> $TMP
cd $INITDIR/${V1}
for i in `find -L compiere-all -type f \( -name "*.SQL" -o -name "*.aps" -o -name "*.bat" -o -name "*.bsh" -o -name "*.java" -o -name "*.jnlp" -o -name "*.js" -o -name "*.jsp" -o -name "*.sh" -o -name "*.sql" -o -name "*.xml" -o -name "*.xsl" \) | sort`
do
    cmpf=$INITDIR/${V2}/`dirname $i`/`basename $i`
    if [ ! -s $cmpf ]
    then
        echo $i
    fi
done >> $TMP
echo "</pre>" >> $TMP

echo "<h2>Files in ${V2} and not in ${V1} </h2>" >> $TMP
echo "<pre>" >> $TMP
cd $INITDIR/${V2}
for i in `find -L compiere-all -type f \( -name "*.SQL" -o -name "*.aps" -o -name "*.bat" -o -name "*.bsh" -o -name "*.java" -o -name "*.jnlp" -o -name "*.js" -o -name "*.jsp" -o -name "*.sh" -o -name "*.sql" -o -name "*.xml" -o -name "*.xsl" \) | sort`
do
    cmpf=$INITDIR/${V1}/`dirname $i`/`basename $i`
    if [ ! -s $cmpf ]
    then
        echo $i
    fi
done >> $TMP
echo "</pre>" >> $TMP

echo "<h2>Differences between files in ${V1} and ${V2} </h2>" >> $TMP
cd $INITDIR/${V1}
for i in `find -L compiere-all -type f \( -name "*.SQL" -o -name "*.aps" -o -name "*.bat" -o -name "*.bsh" -o -name "*.java" -o -name "*.jnlp" -o -name "*.js" -o -name "*.jsp" -o -name "*.sh" -o -name "*.sql" -o -name "*.xml" -o -name "*.xsl" \) | sort`
do
    cmpf=$INITDIR/${V2}/`dirname $i`/`basename $i`
    if [ -s $cmpf ]
    then
	# Cut CVS header from source files
        fgrep -v "@version
$Header:" $i | dos2unix > /tmp/F${V1}
        fgrep -v "@version
$Header:" $cmpf | dos2unix > /tmp/F${V2}
	# Look if there are differences
        diff -q -b /tmp/F${V2} /tmp/F${V1} >> /dev/null 2>&1
        if [ $? -ne 0 ]
        then
            echo "<h3>$i</h3>"
	    echo "<pre>"
            diff -b /tmp/F${V2} /tmp/F${V1}
	    echo "</pre>"
        fi
    fi
done >> $TMP
echo "</body></html>" >> $TMP
rm /tmp/F${V1} /tmp/F${V2}
