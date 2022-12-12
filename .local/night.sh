#!/bin/sh
if [ "$1" == "on" ]; then
	redshift -ol 42:13
else
	redshift -x
fi
