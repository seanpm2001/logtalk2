#!/bin/bash

## =================================================================
## Logtalk - Object oriented extension to Prolog
## Release 2.19.2
##
## Copyright (c) 1998-2004 Paulo Moura.  All Rights Reserved.
## =================================================================

a4_xsl="$LOGTALKHOME/xml/lgtpdfa4.xsl"
us_xsl="$LOGTALKHOME/xml/lgtpdfus.xsl"

format=a4
# format=us

processor=fop
# processor=xep

directory="."

usage_help()
{
	echo 
	echo This script converts all Logtalk XML documenting files in the 
	echo current directory to PDF files
	echo
	echo "Usage: $0 -f format -o directory -p processor"
	echo
	echo "Optional arguments:"
	echo "  -f paper format (either a4 or us; default is $format)"
	echo "  -o output directory for the PDF files (default is $directory)"
	echo "  -p XSL-FO processor (either fop or xep; default is $processor)"
	echo "  -h help"
	echo
	exit 1
}

if ! [ $LOGTALKHOME ]
then
	echo "The environment variable LOGTALKHOME must be defined first!"
	exit 1
else

	while getopts "f:o:p:h" Option
	do
		case $Option in
			f) format="$OPTARG";;
			o) directory="$OPTARG";;
			p) processor="$OPTARG";;
			h) usage_help;;
			*) usage_help;;
		esac
	done

	if [ "$format" = "a4" ]
	then
		xsl=$a4_xsl
	elif [ "$format" = "us" ]
	then
		xsl=$us_xsl
	else
		echo unsupported paper format: $format
		usage_help
		exit 1
	fi

	if [[ "$processor" != "fop" && "$processor" != "xep" ]]
	then
		echo unsupported XSLT processor: $processor
		usage_help
		exit 1
	fi

	cp $LOGTALKHOME/xml/logtalk.dtd .
	cp $LOGTALKHOME/xml/logtalk.xsd .

	echo
	echo converting XML files to PDF...

	for file in *.xml; do
		echo converting $file
		name="`expr "$file" : '\(.*\)\.[^./]*$' \| "$file"`"
		eval $processor -q -xml $file -xsl $xsl -pdf $directory/$name.pdf
	done

	echo
	echo conversion done
	echo

	rm logtalk.dtd
	rm logtalk.xsd

	exit 0

fi
