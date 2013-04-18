#!/bin/bash
# A little script to summarize the subject headings the user has checked out.
# Expects that the .xrecord -files have been fetched with getxrecords.sh,
# and creates a file

if [ ! "$1" ] ;then
	echo "Give filename to create please"
	exit 1
fi

outFile="$1"

for xrec in *.xrecord ;do
	xpath -q -e '/IIIRECORD/VARFLD[MARCINFO/MARCTAG="650" and MARCSUBFLD/SUBFIELDINDICATOR="a"]/MARCSUBFLD/SUBFIELDDATA/text()' $xrec >>$outFile
done
