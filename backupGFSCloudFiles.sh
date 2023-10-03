#!/bin/bash

#
# backupGFSCloudFiles.sh
# Script that creates backups in Grandfather-Father-Son schema
#
# Author: Carlos Ruiz
#
# Installation:
# - copy script on /root
# - give execute permissions
#     chmod 700 /root/backupGFSCloudFiles.sh
# - install automatic execution at 3AM with crontab -e
#     0 3 * * *     /root/backupGFSCloudFiles.sh
# - start manually with 
#     bash /root/backupGFSCloudFiles.sh
#
# DEPENDENCIES:
# - needs aws command preconfigured to upload the files to amazon
# - the file is compressed using tar bzip
#
# Below variables can be overwritten in backupGFSCloudFiles.conf on same folder where the script is installed
# like:  /root/backupGFSCloudFiles.conf

SYSNAME=iDempiere
BUCKET=iDempiere-backups
# Extra files when needed
EXTRAFILES="/root/*.sh /root/*.conf /etc/nginx/sites-available/* /home/idempiere/*.sh /home/idempiere/*/*.sh"
# Extra folders when needed
EXTRAFOLDERS="/opt/idempiere-attachments /opt/idempiere-archives /opt/idempiere/images"
# Extra folders to include on every saturday and first of month
EXTRA_FOLDERS_SATURDAY=/opt/idempiere-server

if [ -s "`dirname $0`/backupGFSCloudFiles.conf" ]
then
    . "`dirname $0`/backupGFSCloudFiles.conf"
fi

# Daily backup of idempiere database
su - idempiere -c "cd /opt/idempiere-server/utils && ./RUN_DBExport.sh"
LASTBCK=`ls -t /opt/idempiere-server/data/ExpDat* | head -1`
chmod 600 $LASTBCK
chmod 600 /opt/idempiere-server/data/ExpDat.dmp

# Daily backup of idempiere database
FILEIDEMP=`ls -t /opt/idempiere-server/data/ExpDat* | head -1`

# Calculate Archive Name based on GFS algorithm
daymonth=`date +%_d`
monthpadded=`date +%_m`
month=`date +%m`
monthname=`date +%B`
year=`date +%Y`
weekmonth=`expr $daymonth / 7 + 1`
dayweek=`date +%u`
dayweekname=`date +%A`
ARCHIVENAME="Backup_$SYSNAME"
if [ $daymonth -eq 1 -a $monthpadded -eq 1 ]
then
    ARCHIVENAME="${ARCHIVENAME}_year_${year}"
elif [ $daymonth -eq 1 ]
then
    ARCHIVENAME="${ARCHIVENAME}_month_${month}_${monthname}"
elif [ $dayweek -eq 6 ]
then
    ARCHIVENAME="${ARCHIVENAME}_week_${weekmonth}"
else
    ARCHIVENAME="${ARCHIVENAME}_day_${dayweek}_${dayweekname}"
fi
ARCHIVENAME="$ARCHIVENAME.tbz"
if [ $dayweek -eq 6 -o $daymonth -eq 1 ]  # just week/month backup
then
    FOLDERS_SATURDAY=$EXTRA_FOLDERS_SATURDAY
fi

rm -f $ARCHIVENAME
echo "`date +'%Y-%m-%d %H:%M:%S'` - starting tar to $ARCHIVENAME" >> backupGFSCloudFiles.out
tar cjf $ARCHIVENAME $FILEIDEMP $EXTRA_FOLDERS $FOLDERS_SATURDAY $EXTRA_FILES

chmod 600 $ARCHIVENAME
rm -f $FILEIDEMP

if [ "x$BUCKET" != "x" ]
then
    aws s3 cp $ARCHIVENAME s3://$BUCKET/
fi

chown idempiere $ARCHIVENAME
