---
title: Controlling Django Apps with an Init Script
author: Charles Hooper
comments: true
layout: post
permalink: /blog/controlling-django-apps-with-an-init-script/
has_been_twittered:
  - yes
categories:
  - Development
  - System Administration
tags:
  - daemon
  - django
  - fastcgi
  - init
---
# 

If you’re reading this, you probably already know that an init script is a specific style of script that allows you to control daemon processes. In particular, they are used to start processes at boot and terminate them at shutdown. What follows is an example script I use to control one of my Django FastCGI projects. This particular example was written for Ubuntu and Debian but could probably be modified for RedHat/CentOS or other distros.

Please refer to your Distro’s documentation on how to install and activate init scripts (hint: See /etc/init.d/ and the man page for update-rc.d if on Debian or Ubuntu.)

{% codeblock django-fcgi-init.sh https://gist.github.com/anonymous/997829#file-django-fcgi-init-sh %}

#!/bin/sh

PATH=/sbin:/bin:/usr/sbin:/usr/bin

FCGIHOST="127.0.0.1"
FCGIPORT="5000"
RUNAS="projectuser:projectgroup"
UMASK="200"
DAEMON="/path/to/django/manage.py"
NAME="MyProject"
DESC="My Django Project"
RUNDIR=/var/run/$NAME
PIDFILE=/var/run/$NAME/$NAME.pid
ENV="env -i LANG=C PATH=/usr/local/bin:/usr/bin:/bin"
SSD="/sbin/start-stop-daemon"

DAEMON_OPTS="runfcgi host=$FCGIHOST port=$FCGIPORT pidfile=$PIDFILE
daemonize=true"

test -x $DAEMON || exit 0

set -e

. /lib/lsb/init-functions

# Set up /var/run directory to write out pidfile
mkdir -p "$RUNDIR"
chown "$RUNAS" "$RUNDIR"
chmod 775 "$RUNDIR"

case "$1" in
 start)
 log_daemon_msg "Starting $DESC" $NAME
 if ! start-stop-daemon --start --quiet --oknodo \
 --pidfile $PIDFILE --umask "$UMASK" --chuid "$RUNAS" \
 --exec $DAEMON -- $DAEMON_OPTS
 then
 log_end_msg 1
 else
 chmod 400 $PIDFILE
 log_end_msg 0
 fi
 ;;
 stop)
 log_daemon_msg "Stopping $DESC" $NAME
 if [ -f $PIDFILE ]; then
 kill `cat -- $PIDFILE`
 rm -f -- $PIDFILE
 log_end_msg 0
 fi
 ;;
 restart|force-reload)
 $0 stop
 $0 start
 ;;
 status)
 status_of_proc -p "$PIDFILE" "$DAEMON" "$NAME" && exit 0 || exit $?
 ;;
 *)
 echo "Usage: $0 {start|stop|restart|force-reload|status}" >&2
 exit 1
 ;;
esac

exit 0

{% endcodeblock %}



