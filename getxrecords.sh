#!/bin/bash
# Eats the saved file (from .... patroninfo/*/readinghistory), and fetches the
# propietary XRECORD files from legacy webinterface. Takes the filename as
# argument.

if [ ! "$1" ] ;then
	echo "No argument given, exiting..."
	exit 1;
fi

htmlFile="$1"
urlList=$(grep 'td.*class="patFuncTitle"' "$htmlFile" |sed 's/^.*href="// ;s/?lang.*$//')

for url in $urlList ;do
	bibid=$(echo $url |sed 's/^.*C__R//')
	bibxrecordurl="http://luettelo.helmet.fi/xrecord=${bibid}"
	echo "Fetching record $bibid"
	curl -o ${bibid}.xrecord $bibxrecordurl
done
