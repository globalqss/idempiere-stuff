#!/bin/bash
#
# iDempiere contribution
# Author: Carlos Antonio Ruiz Gomez - globalqss
# Incremental clone for slow bandwidth
# Based on idea from Coenraad Loubser, Capetown, South Africa ( http://wiki.idempiere.org/en/Hg_clone_idempiere_over_broken_line )
#

cut_increment_by_half() {
    INCREMENT=`expr $INCREMENT / 2`
    if [ $INCREMENT -eq 0 ]
    then
        INCREMENT=1
    fi
}

if [ $# -ne 1 ]
then
    echo "Usage: $0 repository_url"
    echo "Example:"
    echo "   $0 https://bitbucket.org/idempiere/idempiere"
    exit 1
fi
echo "Cloning rev 1 from $1 ... "
hg -q clone -r 1 $1
cd `basename $1`
INCREMENT=100
PREVREV=0
while true
do
    ACTUALREV=`hg identify -n`
    REV=$(( $ACTUALREV + $INCREMENT ))
    echo -n "Pulling $REV ... "
    ERROR=`hg -q pull -r $REV -u 2>&1`
    result=$?
    echo "result=$result"
    if [ $result -eq 255 ]
    then
        MATCH=`expr "$ERROR" : ".*unknown revision*"`
        if [ $MATCH -ne 0 ]
	then
	    if [ $INCREMENT -ne 1 ]
	    then
		cut_increment_by_half
	        echo "error: $ERROR ... retrying with increment $INCREMENT"
		continue
	    fi
	    echo "error: $ERROR ... exit"
            break
	fi
	cut_increment_by_half
	echo "error: $ERROR ... retrying with increment $INCREMENT ... CTRL-C to break"
	continue
    fi
    if [ $PREVREV -eq $REV ]
    then
	cut_increment_by_half
	echo "error: not advancing ... changin increment to $INCREMENT"
    fi
    PREVREV=$REV
done
