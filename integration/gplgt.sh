#/bin/bash

## ================================================================
## Logtalk - Open source object-oriented logic programming language
## Release 2.32.1
##
## Copyright (c) 1998-2008 Paulo Moura. All Rights Reserved.

Logtalk is free software. You can redistribute it and/or modify
it under the terms of the Artistic License 2.0 as published by 
the The Perl Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
Artistic License 2.0 for more details. A copy of the license is 
provided in the "LICENSE.txt" file.
## ================================================================

## As silly as it seems, there is no reliable solution to put the following
## checks in their own file that would be source'd within each individual  
## integration script!!!

if ! [ "$LOGTALKHOME" ]; then
	echo "The environment variable LOGTALKHOME should be defined first, pointing"
	echo "to your Logtalk installation directory!"
	echo "Trying the default locations for the Logtalk installation..."
	if [ -d "/usr/local/share/logtalk" ]; then
		LOGTALKHOME=/usr/local/share/logtalk
		echo "... using Logtalk installation found at /usr/local/share/logtalk"
	elif [ -d "/usr/share/logtalk" ]; then
		LOGTALKHOME=/usr/share/logtalk
		echo "... using Logtalk installation found at /usr/share/logtalk"
	elif [ -d "/opt/local/share/logtalk" ]; then
		LOGTALKHOME=/opt/local/share/logtalk
		echo "... using Logtalk installation found at /opt/local/share/logtalk"
	elif [ -d "/opt/share/logtalk" ]; then
		LOGTALKHOME=/opt/share/logtalk
		echo "... using Logtalk installation found at /opt/share/logtalk"
	else
		echo "... unable to locate Logtalk installation directory!"
		echo
		exit 1
	fi
	echo
elif ! [ -d "$LOGTALKHOME" ]; then
	echo "The environment variable LOGTALKHOME points to a non-existing directory!"
	echo "Its current value is: $LOGTALKHOME"
	echo "The variable must be set to your Logtalk installation directory!"
	echo
	exit 1
fi
export LOGTALKHOME

if ! [ "$LOGTALKUSER" ]; then
	echo "The environment variable LOGTALKUSER should be defined first, pointing"
	echo "to your Logtalk user directory!"
	echo "Trying the default location for the Logtalk user directory..."
	echo
	export LOGTALKUSER=$HOME/logtalk
fi

if [ -d "$LOGTALKUSER" ]; then
	if ! [ -a "$LOGTALKUSER/VERSION.txt" ]; then
		echo "Logtalk user directory at $LOGTALKUSER is outdated!"
		echo "Creating an up-to-date Logtalk user directory..."
		cplgtdirs
	else
		current=`cat $LOGTALKUSER/VERSION.txt | sed 's/\.//g'`
		if [ $current -lt 2320 ]; then
			echo "Logtalk user directory at $LOGTALKUSER is outdated!"
			echo "Creating an up-to-date Logtalk user directory..."
			cplgtdirs
		fi
	fi
else
	echo "Cannot find \$LOGTALKUSER directory! Creating a new Logtalk user directory"
	echo "by running the \"cplgtdirs\" shell script:"
	cplgtdirs
fi
echo

exec gprolog --init-goal "['$LOGTALKUSER/configs/gnu.config','$LOGTALKHOME/integration/logtalk_gp.pl','$LOGTALKUSER/libpaths/libpaths.pl']" "$@"
