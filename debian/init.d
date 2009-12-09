#! /bin/sh
#
# skeleton	Apache activemq initscript
#		This file should be used to construct scripts to be
#		placed in /etc/init.d.
#
# Author:	Miquel van Smoorenburg <miquels@cistron.nl>.
#		Ian Murdock <imurdock@gnu.ai.mit.edu>.
#
#		Please remove the "Author" lines above and replace them
#		with your own name if you copy and modify this script.
#
# Version:	@(#)skeleton  2.85-23  28-Jul-2004  miquels@cistron.nl
#

set -e

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
DESC="Apache activemq daemon"
NAME=apache-activemq
ACTIVEMQADMIN=/usr/share/apache-activemq/bin/activemq-admin
CMD="nohup $ACTIVEMQADMIN"

# Gracefully exit if the package has been removed.
test -x $ACTIVEMQADMIN || exit 0

case "$1" in
    start)
        echo "Starting ActiveMQ "
        /bin/su - $AMQ_USER -c "$CMD $1 >/dev/null 2>&1 &"
        ;;
    stop)
        echo "Shutting down ActiveMQ"
        /bin/su - $AMQ_USER -c "$CMD $1 >/dev/null 2>&1 &"
        ;;
    restart)
        $0 stop
        $0 start
        ;;
    status)
        echo not yet implemented
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac 

exit 0
