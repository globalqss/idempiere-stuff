#
# This is a sample of a verifier used by Carlos Ruiz to check migration scripts in pull requests within iDempiere
#
# Usage: compare_scripts [unique_filename_portion_of_the_script]
# To verify the scripts migration/i8.2z/postgresql/202102011400_IDEMPIERE-4688.sql and migration/i8.2z/oracle/202102011400_IDEMPIERE-4688.sql
#  compare_scripts.sh 202102011400_IDEMPIERE-4688.sql
#     or
#  compare_scripts.sh 202102011400
#
# in my laptop the source code is found in:
# ~/gitIdempiere/localdev   <- for master
# ~/gitIdempiere/local82    <- for release-8.2
#   you need to adapt the BASE variable below to your own folders
#
# when there are differences it opens meld program to show the comparison
#

BASE=~/gitIdempiere/localdev/migration
FOLDER=i8.2z
if [ "x$2" = "x82" ]
then
    BASE=~/gitIdempiere/local82/migration
    FOLDER=i7.1
fi
SCRIPT=$1

OR=`find $BASE -name "$1*" | fgrep /oracle/`
PG=`find $BASE -name "$1*" | fgrep /postgresql/`

TMPOR=/tmp/`basename $OR`.oracle
TMPPG=/tmp/`basename $PG`.postgresql

sed -e '
/SET SQLBLANKLINES ON/d
/SET DEFINE OFF/d
3{/^[[:space:]]*$/d}
' $OR > $TMPOR

sed -e '
s/TO_TIMESTAMP/TO_DATE/g
s/TIMESTAMP DEFAULT statement_timestamp()/DATE DEFAULT SYSDATE/g
s/statement_timestamp()/getDate()/g
s/now()/sysdate/g
s/,"action",/,Action,/g
s/,"limit",/,Limit,/g
s/NUMERIC(/NUMBER(/g
s/ NUMERIC / NUMBER /g
s/EntityType VARCHAR(/EntityType VARCHAR2(/
s/AD_Language VARCHAR(/AD_Language VARCHAR2(/
s/VARCHAR(/VARCHAR2(/g
s/TIMESTAMP NOT NULL/DATE NOT NULL/g
s/TIMESTAMP DEFAULT NULL/DATE DEFAULT NULL/g
s/ADD COLUMN/ADD/g
' $PG |
sed -e "s/DEFAULT '0'/DEFAULT 0/g" > $TMPPG
# s/statement_timestamp()/SysDate/g

### POSTGRESQL VERIFICATION
echo "***** Verify folder *****"
tput setaf 1
ls $PG | fgrep -v "/migration/$FOLDER/postgresql/"
tput sgr0
echo "***** Big IDs *****"
tput setaf 1
grep -n "\b1[0-9][0-9][0-9][0-9][0-9][0-9]\b" $PG | grep -v ".sql:--"  | grep -v ".sql:SELECT register" | grep -v ".sql:INSERT INTO AD_Sequence"
tput sgr0
echo "***** C_AcctProcessor *****"
tput setaf 1
fgrep -n C_AcctProcessor $PG
tput sgr0
echo "***** AD_Preference *****"
tput setaf 1
fgrep -n AD_Preference $PG
tput sgr0
echo "***** AD_SysConfig *****"
tput setaf 1
fgrep -n AD_SysConfig $PG
tput sgr0
echo "***** Possible wrong entitytype *****"
tput setaf 1
fgrep -n "'U'" $PG
tput sgr0
echo "***** create sequence *****"
tput setaf 1
fgrep -n -i "create sequence" $PG
tput sgr0
echo "***** Check register file *****"
CNT=`fgrep "register_migration_script" $PG | wc -l`
if [ $CNT -ne 1 ]
then
    tput setaf 1
    echo "¡¡¡ No register migration script !!!"
    tput sgr0
else
    tput setaf 1
    fgrep -n "register_migration_script" $PG | fgrep -v "'`basename $PG`'"
    tput sgr0
fi
### END POSTGRESQL VERIFICATION

### ORACLE VERIFICATION
echo "***** NVARCHAR2 *****"
tput setaf 1
fgrep -n -i NVARCHAR2 $OR
tput sgr0
echo "***** NCHAR *****"
tput setaf 1
fgrep -n -i NCHAR $OR
tput sgr0
echo "***** CHAR(>3) *****"
tput setaf 1
grep -n -i "\bCHAR *(" $OR | grep -iv "\bCHAR(1)" | grep -iv "\bCHAR(2)" | grep -iv "\bCHAR(3)"
tput sgr0
echo "***** VARCHAR2(<=3) *****${RED}"
tput setaf 1
grep -n -i "\bVARCHAR2 *([123]\b" $OR
tput sgr0
echo "***** VARCHAR2...BYTE *****${RED}"
tput setaf 1
grep -n -i "\bVARCHAR2 *( *[1-9][0-9]* *)" $OR
tput sgr0
echo "***** Line starting with @ *****${RED}"
tput setaf 1
grep -n "^@" $OR
tput sgr0
echo "***** Too long lines *****${RED}"
tput setaf 1
MAXLENGTH=$(wc -L < $OR)
if [ $MAXLENGTH -gt 2498 ]
then
    echo "Lines with length > 2499 - this will cause SP2-0027"
    egrep -n "^.{$(wc -L < $OR)}$" $OR
fi
tput sgr0
### END ORACLE VERIFICATION

### Clear CHAR from oracle script to make it similar to postgres
sed -i -e 's/VARCHAR2(\([0-9][0-9]*\) CHAR)/VARCHAR2(\1)/' $TMPOR

echo "***** BOMB *****"
tput setaf 1
grep -n -l $'\xEF\xBB\xBF' $PG
grep -n -l $'\xEF\xBB\xBF' $OR
tput sgr0

SC=$(basename $OR)
echo "***** Checking date format of script name $SC *****"
YE=$(expr "$SC" : '\(....\)')
MO=$(expr "$SC" : '....\(..\)')
DA=$(expr "$SC" : '......\(..\)')
HO=$(expr "$SC" : '........\(..\)')
MI=$(expr "$SC" : '..........\(..\)')
CNT=$(expr "$YE$MO$DA$HO$MI" : '20[012][0-9][01][0-9][0-3][0-9][0-2][0-9][0-5][0-9]')
if [ $CNT -ne 12 ]
then
    tput setaf 1
    echo "Invalid date format in $SC"
    tput sgr0
else
    tput setaf 1
    date -d "$YE-$MO-$DA $HO:$MI" >/dev/null
    tput sgr0
fi

echo "***** COMPARISON *****"
if diff $TMPOR $TMPPG > /dev/null
then
    echo "IDENTICAL OUTPUT"
else
    tput setaf 1
    echo "differences, opening meld ..."
    tput sgr0
    meld $TMPOR $TMPPG &
fi
