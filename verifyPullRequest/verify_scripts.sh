#
# This is a sample of a verifier used by Carlos Ruiz to check migration scripts in pull requests within iDempiere
#
# Usage: verify_scripts.sh
# It must be executed in the top folder of your iDempiere repository
# it applies the script compare_scripts.sh over all uncommitted migration scripts and iterates if there are several
#   

FIRST=Y
( git status -s | grep 'migration/.*/postgresql/.*\.sql$' | sed -e "s:^.. .*/postgresql/::" ;
  git status -s | grep 'migration/.*/oracle/.*\.sql$' | sed -e "s:^.. .*/oracle/::" ) | sort -u | while read FILE
do
    if [ x$FIRST = xY ]
    then
        FIRST=N
    else
        echo -n "OK ? "
        read nada < /dev/tty
    fi
    echo "
Verifying $FILE ..."
    compare_scripts.sh $FILE
done
    echo "
Verification finished"
