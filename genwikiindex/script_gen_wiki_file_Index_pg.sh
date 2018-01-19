psql -d idempiere51 -U adempiere -f QSS_GET_TABLES_FROM_WINDOW_pg.sql > /dev/null

opentable="N"

( echo "copy (" ; cat Query_pg.sql; echo ") to stdout with csv;" ) |
psql -d idempiere51 -U adempiere -q -t -A -F"," | sed -e 's/"//g' |
while IFS=, read node_id parent_id level seqno issummary name type action technical id beta rest
do
    name=`echo $name | tr '|' ','`
    sec=""
    if [ $level -lt 4 ]
    then
        if [ $issummary = "Y" ]
	then
	    sec=`head -c $level < /dev/zero | tr '\0' '='`
	fi
    fi
    if [ $issummary = "Y" ]
    then
	if [ $opentable = "Y" ]
	then
            # Table is Open -> Close Table
	    echo "|}"
	    opentable="N"
	fi
	if [ $level -eq 1 ]
	then
            # Insert Empty Line
	    echo
	    echo
	fi
        # Title
	echo $sec$name$sec
	echo
    else
        # Table Format
	if [ $opentable = "N" ]
	then
            # Flag activated to indicate Table is Open
	    echo "{|"
	    echo "|-"
	    opentable="Y"
	fi
	ndots=`expr \( $level \) \* \( $level - 2 \)`
	dot=`head -c $ndots < /dev/zero | tr '\0' '.'`
        echo '|-valign="top"'
	echo -n '|width="280"|'
	# old adempiere wiki way
	  # echo -n '[[ManPage'
	  # echo -n $type
	  # echo -n '_'
	  # namet=`echo $name | tr '&, /' '\0\0\0\0'`
	  # echo -n $namet
	# new idempiere wiki way
	  namet=`echo $name | tr ' ' '_' | tr '/' '-'`
	  echo -n '[['
	  echo -n $namet
	  echo -n '_('
	  echo -n $action
	  echo -n '_ID-'
	  echo -n $id
	  echo -n ')'
	echo -n '|'
	echo -n '<span style="color: white;">'
	echo -n $dot
	echo -n '</span>'
	echo -n $name
	echo ']]'
	echo -n '|width="80"|<span style="font-variant:small-caps">'
	echo -n $action
	echo '</span>'
	echo -n '|width="450"|<small>'
	echo -n $technical
	echo '</small>'
	echo '|-valign="top"'
	echo '|-'
	echo
    fi
done
echo "|}"
