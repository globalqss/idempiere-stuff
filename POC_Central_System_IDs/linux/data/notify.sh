#!/bin/sh

# Notify reservations of centralized ID for project
#
# Author: Carlos Ruiz (globalqss) 2007/12/05

# Must be called with parameteres
# PROJECT (to allow custom project ID management)
# MAILLIST (the recipient to send e-mail notification

if [ $# -ne 2 ]
then
    echo "Usage: $0 PROJECT MAILLIST"
fi
PROJECT=$1
MAILLIST=$2

DIRDATA=`dirname $0`

# Get Current ID from Table
FILENOTIFY=${DIRDATA}/${PROJECT}/${PROJECT}.notify

if [ ! -s $FILENOTIFY ]
then
    exit 0
fi

ITER=0
while true
do
   CNTLOCKS=`ls $PROJECT/*.lock 2> /dev/null | wc -l`
   if [ $CNTLOCKS -eq 0 ]
   then
       break
   else
       ITER=`expr $ITER + 1`
       if [ $ITER -gt 10 ]
       then
           echo "ERROR: There are lock files for more than 10 minutes"
           exit 1
       fi
       # wait one minute
       sleep 60
   fi
done
mv ${FILENOTIFY} ${FILENOTIFY}.sending

DATETIME=`date '+%Y/%m/%d %H:%M:%S'`
mail -s "Centralized ID Reservation for project $PROJECT - $DATETIME" $MAILLIST < ${FILENOTIFY}.sending
echo "Notification mail sent"

rm ${FILENOTIFY}.sending

exit 0