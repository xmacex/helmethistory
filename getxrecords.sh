#!/bin/bash
# Eats the saved file (from .... patroninfo/*/readinghistory), and fetches the
# propietary XRECORD files from legacy webinterface. Takes the filename as
# argument.

if [ ! "$1" ] ;then
	echo "No argument given, exiting..."
	exit 1;
fi

htmlFile="$1"

for url in $(grep 'td.*class="patFuncTitle"' "$htmlFile" |sed 's/^.*href="// ;s/?lang.*$//') ;do
	bibid=$(echo $url |sed 's/^.*C__R//') ;
	curl -o ${bibid}.xrecord "http://luettelo.helmet.fi/xrecord=${bibid}" ;
done
