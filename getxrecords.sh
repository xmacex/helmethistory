#!/bin/sh
# Eats the saved (from .... patroninfo/*/readinghistory), and fetches the
# propietary XRECORD files from legacy webinterface

for url in $(grep 'td.*class="patFuncTitle"' HelMet\ libraries\ _Kaikki.html |sed 's/^.*href="// ;s/?lang.*$//') ;do
	bibid=$(echo $url |sed 's/^.*C__R//') ;
	curl -o ${bibid}.xrecord "http://luettelo.helmet.fi/xrecord=${bibid}" ;
done
