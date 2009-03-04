#!/bin/sh

## ================================================================
## Logtalk - Open source object-oriented logic programming language
## Release 2.35.2
## 
## Copyright (c) 1998-2009 Paulo Moura.        All Rights Reserved.
## Logtalk is free software.  You can redistribute it and/or modify
## it under the terms of the "Artistic License 2.0" as published by 
## The Perl Foundation. Consult the "LICENSE.txt" file for details.
## ================================================================

if [ -z "$1" ]; then
	if [ -f "/etc/debian_version" ]; then
		prefix=/usr
	else
		case $( uname -s ) in
			Darwin	) prefix=/opt/local;;
			*		) prefix=/usr/local;;
		esac
	fi
	mkdir -p $prefix
else
	prefix="$1"
fi

if ! [ -d "$prefix" ]; then
	echo "Directory prefix does not exist!"
	echo
	exit 1
fi

echo
echo "Installing Logtalk on $prefix/share ..."
echo

mkdir -p $prefix/share

rm -rf $prefix/share/lgt2352
rm -f $prefix/share/logtalk

mkdir $prefix/share/lgt2352

cd ..
cp -R * $prefix/share/lgt2352

cd $prefix/share/lgt2352
chmod a+x scripts/cleandist.sh
scripts/cleandist.sh

cd ..
ln -sf lgt2352 logtalk

mkdir -p $prefix/bin
cd $prefix/bin

ln -sf ../share/logtalk/scripts/cplgtdirs.sh cplgtdirs
ln -sf ../share/logtalk/xml/lgt2pdf.sh lgt2pdf
ln -sf ../share/logtalk/xml/lgt2html.sh lgt2html
ln -sf ../share/logtalk/xml/lgt2xml.sh lgt2xml
ln -sf ../share/logtalk/xml/lgt2txt.sh lgt2txt

echo "Links to the \"cplgtdirs\", \"lgt2pdf\", \"lgt2html\", \"lgt2xml\", and"
echo "\"lgt2txt\" scripts have been created on \"$prefix/bin\";"
echo "you may need to add this directory to your execution path."
echo

ln -sf ../share/logtalk/integration/bplgt.sh bplgt
ln -sf ../share/logtalk/integration/ciaolgt.sh ciaolgt
ln -sf ../share/logtalk/integration/cxlgt.sh cxlgt
ln -sf ../share/logtalk/integration/eclipselgt.sh eclipselgt
ln -sf ../share/logtalk/integration/gplgt.sh gplgt
ln -sf ../share/logtalk/integration/plclgt.sh plclgt
ln -sf ../share/logtalk/integration/qplgt.sh qplgt
ln -sf ../share/logtalk/integration/quintuslgt.sh quintuslgt
ln -sf ../share/logtalk/integration/sicstuslgt.sh sicstuslgt
ln -sf ../share/logtalk/integration/swilgt.sh swilgt
ln -sf ../share/logtalk/integration/xsblgt.sh xsblgt
ln -sf ../share/logtalk/integration/xsbmtlgt.sh xsbmtlgt
ln -sf ../share/logtalk/integration/xsbmt64lgt.sh xsbmt64lgt
ln -sf ../share/logtalk/integration/yaplgt.sh yaplgt

echo "The following integration scripts are installed for running Logtalk"
echo "with selected back-end Prolog compilers:"
echo
echo "* B-Prolog (version 7.1 or later):         bplgt      (first run must use sudo)"
echo "* Ciao (version 1.10):                     ciaolgt    (first run must use sudo; requires patching Logtalk)"
echo "* CxProlog (version 0.97.2 or later):      cxlgt"
echo "* ECLiPSe (versions 5.10, 6.0):            eclipselgt"
echo "* GNU Prolog (version 1.3.1 or later):     gplgt"
echo "* K-Prolog (version 5.1.2a or later):      plclgt"
echo "* Qu-Prolog (version 8.1 or later):        qplgt"
echo "* Quintus Prolog (version 3.5):            quintuslgt (requires patching Logtalk)"
echo "* SICStus Prolog (versions 3.12.x, 4.0.x): sicstuslgt"
echo "* SWI-Prolog (version 5.6.44 or later):    swilgt"
echo "* XSB (version 3.1 or later):              xsblgt     (first run must use sudo)"
echo "* XSB MT (CVS version):                    xsbmtlgt   (first run must use sudo)"
echo "* XSB MT 64 bits (CVS version):            xsbmt64lgt (first run must use sudo)"
echo "* YAP (version 5.1.3 or later):            yaplgt"
echo
echo "The Prolog integration scripts can be found on \"$prefix/bin\"."
echo "Make sure that the Prolog compilers are properly installed and available"
echo "on your execution path."
echo
echo "Integration with Ciao Prolog and Quintus Prolog require manual patches that"
echo "render Logtalk incompatible with all the other compilers."
echo
echo "Users should ensure that the environment variable LOGTALKHOME is set to"
echo "\"$prefix/share/logtalk\" and then run the \"cplgtdirs\" shell script once"
echo "before running the integration scripts."
echo
echo "If you get an unexpected failure when using one of the Prolog integration"
echo "scripts, consult the \"$prefix/share/logtalk/configs/NOTES.txt\" file"
echo "for compatibility notes."
echo
echo "Logtalk basic installation completed."
echo
