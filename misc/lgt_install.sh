#!/bin/sh

## =================================================================
## Logtalk - Object oriented extension to Prolog
## Release 2.23.1
##
## Copyright (c) 1998-2005 Paulo Moura.  All Rights Reserved.
## =================================================================

echo
echo "Installing Logtalk..."

if [ -z "$1" ]; then
	prefix=/usr/local
else
	prefix="$1"
fi

rm -rf $prefix/lgt2231
rm -f $prefix/logtalk

mkdir $prefix/lgt2231

cd ..
cp -R * $prefix/lgt2231

cd $prefix
chmod -R go-w,a+r lgt2231
chmod a+x lgt2231
chmod a+x lgt2231/misc/*.sh
chmod a+x lgt2231/xml/*.sh
ln -sf lgt2231 logtalk

mkdir -p bin
cd bin
ln -sf ../lgt2231/misc/cplgtdirs.sh cplgtdirs
ln -sf ../lgt2231/xml/lgt2pdf.sh lgt2pdf
ln -sf ../lgt2231/xml/lgt2html.sh lgt2html

echo "Logtalk installation completed."
echo
echo "Users should define the environment variable LOGTALKHOME pointing"
echo "to $prefix/logtalk and then run the shell script cplgtdirs"
echo "in order to copy the Logtalk user-modifiable files to their home"
echo "directories."
echo
echo "Links to the cplgtdirs, lgt2pdf, and lgt2html scripts have been"
echo "created on $prefix/bin; you may need to add this directory to"
echo "your execution path."
echo
