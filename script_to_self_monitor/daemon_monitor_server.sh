#!/bin/bash

#
# daemon_monitor_server.sh
# Script that monitor idempiere server and restart when it detects failure on webui
#
# Author: Carlos Ruiz
# Date: 2017-02-28
#
# Installation:
# - copy script on /root
# - give execute permissions
#     chmod 700 /root/daemon_monitor_server.sh
# - install automatic execution on reboot with crontab -e
#     @reboot bash /root/daemon_monitor_server.sh >> /var/log/daemon_monitor_server.log 2>&1
# - start manually with 
#     nohup bash /root/daemon_monitor_server.sh >> /var/log/daemon_monitor_server.log 2>&1 &
# - stop manually with
#     pkill -f daemon_monitor_server
#
# DEPENDENCIES:
# - To send emails requires sendmail installed on system, and EMAIL_NOTIFY and/or EMAIL_NOTIFYCC variable set
#     apt-get install sendmail-bin
# - Requires curl
#     apt-get install curl
#
# When doing deployments or window maintenance on server stop the daemon from checking creating the file:
#     touch /tmp/deploying_now
# After ALLOWED_CONSECUTIVE_RESTARTS the daemon creates a file /tmp/consecutive_reached, in this case you
# must solve the problem manually and then delete the file /tmp/consecutive_reached to restart the checks
#
# Below variables can be overwritten in daemon_monitor_server.conf on same folder where the script is installed
# like:  /root/daemon_monitor_server.conf

# Email variables
# EMAIL_NOTIFY and EMAIL_NOTIFYCC can be a list of emails separated by spaces
EMAIL_NOTIFY=
EMAIL_NOTIFYCC=
EMAIL_FROM=root@`hostname`
SENDMAILBIN=/usr/sbin/sendmail

# URL to check
URL=https://localhost:8443/webui/index.zul
# Token string to check on loaded page
STRING="Sorry, JavaScript must be enabled."
# Check every SECONDS_CYCLE seconds
SECONDS_CYCLE=60
# After a fail to get the token, wait GRACE_SECONDS seconds to retry GRACE_RETRIES times
GRACE_SECONDS=15
GRACE_RETRIES=3
# Minutes of grace after a reboot before trying a restart
GRACE_MINUTES_REBOOT=5
# Max of consecutive restarts before giving up
ALLOWED_CONSECUTIVE_RESTARTS=3
# Debug command, if set to false then no output is logged
DEBUG='eval echo $(date "+%Y-%m-%d %H:%M:%S - ")'
# Name of the system being monitored
SYSTEMNAME=iDempiere
# Name of the service in /etc/init.d
SERVICENAME=idempiere
# Binary of the service command to restart
SERVICEBIN=/bin/systemctl
# IDEMPIERE home folder
IDEMPIERE_HOME=/opt/idempiere-server
# Log last lines
LOGLASTLINES=30
# Timeout for jcmd
JCMD_TIMEOUT=15

if [ -s "`dirname $0`/daemon_monitor_server.conf" ]
then
    . "`dirname $0`/daemon_monitor_server.conf"
fi

if [ -n "$SENDMAILBIN" -a -n "$EMAIL_FROM" -a \( -n "$EMAIL_NOTIFY" -o -n "$EMAIL_NOTIFYCC" \) ]
then
    CMDMAIL="$SENDMAILBIN -t -F $EMAIL_FROM -f $EMAIL_FROM"
else
    CMDMAIL="cat"
fi

while true
do
    UPTIMEMIN=$(awk '{print int($0/60);}' /proc/uptime)
    if [ -z "$UPTIMEMIN" ] || [ "$UPTIMEMIN" -gt "$GRACE_MINUTES_REBOOT" ]
    then
        break
    fi
    $DEBUG "grace time after reboot ... uptime $UPTIMEMIN minutes"
    sleep $SECONDS_CYCLE
done

CONSECUTIVE=0
RETRIES=0
while true
do
    if [ -f /tmp/deploying_now ]
    then
        $DEBUG "detected deployment ... waiting next cycle $SECONDS_CYCLE ..."
        sleep $SECONDS_CYCLE
	continue
    fi
    if [ -f /tmp/consecutive_reached ]
    then
        $DEBUG "consecutive restart reached ... waiting next cycle $SECONDS_CYCLE ..."
        sleep $SECONDS_CYCLE
	continue
    fi
    CNT=`curl -H "X-PING: true" -m $GRACE_SECONDS -k -s "$URL" | fgrep "$STRING" | wc -l`
    if [ $CNT != 1 ]
    then
	if [ $CONSECUTIVE -eq $ALLOWED_CONSECUTIVE_RESTARTS ]
	then
            $DEBUG "CONSECUTIVE = ALLOWED_CONSECUTIVE_RESTARTS $ALLOWED_CONSECUTIVE_RESTARTS ... stopping restarting process"
            (
		echo "Subject: $SYSTEMNAME `hostname` self-monitor MAX consecutive restarts reached - manual action required `date +'%Y-%m-%d %H:%M:%S'`"
		if [ -n "$EMAIL_NOTIFY" ]
		then
	            echo "To:  $EMAIL_NOTIFY"
		fi
		if [ -n "$EMAIL_NOTIFYCC" ]
		then
	            echo "Cc:  $EMAIL_NOTIFYCC"
		fi
	    ) 2>&1 | $CMDMAIL
	    touch /tmp/consecutive_reached
            CONSECUTIVE=0
	    continue
	fi
        RETRIES=`expr $RETRIES + 1`
        $DEBUG RETRIES=$RETRIES
	if [ $RETRIES -eq $GRACE_RETRIES ]
	then
            $DEBUG "RETRIES = GRACE_RETRIES ... restarting `date +'%Y-%m-%d %H:%M:%S'`"
            (
		echo "Subject: $SYSTEMNAME `hostname` self-monitor detected failure - restarting `date +'%Y-%m-%d %H:%M:%S'`"
		if [ -n "$EMAIL_NOTIFY" ]
		then
	            echo "To:  $EMAIL_NOTIFY"
		fi
		if [ -n "$EMAIL_NOTIFYCC" ]
		then
	            echo "Cc:  $EMAIL_NOTIFYCC"
		fi
		LASTLOGFILE=$( ls -t $IDEMPIERE_HOME/log/idempiere_*.log | head -1 )
	        echo "========== Last log lines $( basename $LASTLOGFILE ) =========="
	        tail -$LOGLASTLINES $LASTLOGFILE
	        echo "===================================="
	        PID=$(pgrep -f "java.*$IDEMPIERE_HOME")
		if [ -n "$PID" ]
		then
		    echo "Calling GC"
		    timeout $JCMD_TIMEOUT jcmd $PID GC.run
		    TS=$(date +'%Y%m%d%H%M%S')
		    DMPFILE="$IDEMPIERE_HOME"/log/heapdump$TS.bin
		    echo "Taking heap dump at $DMPFILE"
		    timeout $JCMD_TIMEOUT jcmd $PID GC.heap_dump "$DMPFILE"
		    HISTOFILE="$IDEMPIERE_HOME"/log/histogram$TS.txt
		    echo "Taking class histogram at $HISTOFILE"
		    timeout $JCMD_TIMEOUT jcmd $PID GC.class_histogram > "$HISTOFILE"
		    THREADFILE="$IDEMPIERE_HOME"/log/threads$TS.txt
		    echo "Taking thread print at $THREADFILE"
		    timeout $JCMD_TIMEOUT jcmd $PID Thread.print > "$THREADFILE"
		fi
	        echo "Executing time $SERVICEBIN restart $SERVICENAME:"
	        time $SERVICEBIN restart $SERVICENAME
	    ) 2>&1 | $CMDMAIL
	    RETRIES=0
            CONSECUTIVE=`expr $CONSECUTIVE + 1`
            $DEBUG CONSECUTIVE=$CONSECUTIVE
	else
	    $DEBUG "waiting grace period $GRACE_SECONDS ..."
	    sleep $GRACE_SECONDS
	    continue
	fi
    else
        CONSECUTIVE=0
	RETRIES=0
    fi
    $DEBUG "waiting next cycle $SECONDS_CYCLE ..."
    sleep $SECONDS_CYCLE
done
