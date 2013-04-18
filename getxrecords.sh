#!/bin/sh

for url in $(grep 'td.*class="patFuncTitle"' HelMet\ libraries\ _Kaikki.html |sed 's/^.*href="// ;s/?lang.*$//') ;do
	bibid=$(echo $url |sed 's/^.*C__R//') ;
	curl -o ${bibid}.xrecord "http://luettelo.helmet.fi/xrecord=${bibid}" ;
done
