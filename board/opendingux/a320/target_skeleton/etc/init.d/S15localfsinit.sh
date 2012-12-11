#!/bin/sh

if [ -z "$1" ] || [ "x$1" = "xstart" ]; then

    mkdir -p /boot/apps
    mkdir -p /boot/local
    for i in bin etc home/apps lib sbin share; do
        mkdir -p /usr/local/$i
    done

    mount /boot/apps /usr/local/home/apps -o bind

    if [ ! -f /etc/local/timezone ]; then
        echo 'CET-1CEST,M3.5.0,M10.5.0' > /etc/local/timezone
    fi

fi

