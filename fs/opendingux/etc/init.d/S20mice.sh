#!/bin/sh

if [ ! -c /dev/input/mice ]
then
	mkdir -p /dev/input
	ln -sf /dev/mice /dev/input/mice
fi
