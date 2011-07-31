#!/bin/sh
#
# Simple script to load/store ALSA parameters (volume...)
#

STATEFILE=/etc/local/asound.state

case "$1" in
	start)
		echo "Loading sound volume..."
		if [ -f $STATEFILE ]; then
			/usr/sbin/alsactl -f $STATEFILE restore
		fi
		;;
	stop)
		echo "Storing sound volume..."
		/usr/sbin/alsactl -f $STATEFILE store
		;;
	*)
		echo "Usage: $0 {start|stop}"
		exit 1
esac

exit $?

