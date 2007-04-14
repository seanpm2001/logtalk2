Name: logtalk
Summary: Logtalk - Open source object-oriented extension to Prolog
Version: 2.29.6
Release: 1
License: Artistic License 2.0
Group: Development/Languages
Packager: Paulo Moura <pmoura@logtalk.org>
Source: http://logtalk.org/files/lgt2296.tgz
BuildArchitectures: noarch
URL: http://logtalk.org/
Prefix: /usr/local
AutoReqProv: no
%description
Logtalk is an open source object-oriented extension to the Prolog programming language. Integrating logic programming with object-oriented and event-driven programming, it is compatible with most Prolog compilers. It supports both prototypes and classes. In addition, it supports component-based programming through category-based composition.
%prep
%setup -n lgt2296
%build
%install
rm -rf /usr/local/lgt2296
rm -f /usr/local/logtalk
mkdir /usr/local/lgt2296
cp -R * /usr/local/lgt2296
cd /usr/local
chmod -R go-w,a+r lgt2296
chmod a+x lgt2296
chmod a+x lgt2296/scripts/*.sh
chmod a-x lgt2296/scripts/*.js
chmod a+x lgt2296/scripts/linux/*.sh
chmod a+x lgt2296/scripts/macosx/postflight
chmod a+x lgt2296/xml/*.sh
chmod a-x lgt2296/xml/*.js
ln -sf lgt2296 logtalk
cd bin
ln -sf ../logtalk/scripts/cplgtdirs.sh cplgtdirs
ln -sf ../logtalk/xml/lgt2pdf.sh lgt2pdf
ln -sf ../logtalk/xml/lgt2html.sh lgt2html
ln -sf ../logtalk/xml/lgt2xml.sh lgt2xml
%clean
%files
%defattr(-,root,users)
%doc /usr/local/lgt2296/BIBLIOGRAPHY.bib
%doc /usr/local/lgt2296/CUSTOMIZE.txt
%doc /usr/local/lgt2296/INSTALL.txt
%doc /usr/local/lgt2296/LICENSE.txt
%doc /usr/local/lgt2296/QUICK_START.txt
%doc /usr/local/lgt2296/README.txt
%doc /usr/local/lgt2296/RELEASE_NOTES.txt
%doc /usr/local/lgt2296/UPGRADING.txt
/usr/local/lgt2296/compiler
/usr/local/lgt2296/configs
/usr/local/lgt2296/contributions
/usr/local/lgt2296/examples
/usr/local/lgt2296/libpaths
/usr/local/lgt2296/library
%docdir /usr/local/lgt2296/manuals
/usr/local/lgt2296/manuals
/usr/local/lgt2296/scripts
/usr/local/lgt2296/wenv
/usr/local/lgt2296/xml
/usr/local/logtalk
/usr/local/bin/cplgtdirs
/usr/local/bin/lgt2pdf
/usr/local/bin/lgt2html
/usr/local/bin/lgt2xml
%post
mkdir -p /etc/profile.d
echo "# Logtalk environment setup" > /etc/profile.d/logtalk.sh
echo "" >> /etc/profile.d/logtalk.sh
echo "# Logtalk installation directory:" >> /etc/profile.d/logtalk.sh
echo "export LOGTALKHOME=$RPM_INSTALL_PREFIX/logtalk" >> /etc/profile.d/logtalk.sh
echo "" >> /etc/profile.d/logtalk.sh
echo "# Default location for Logtalk end-user files:" >> /etc/profile.d/logtalk.sh
echo "export LOGTALKUSER=\$HOME/logtalk" >> /etc/profile.d/logtalk.sh
chmod a+x /etc/profile.d/logtalk.sh
echo "# Logtalk environment setup" > /etc/profile.d/logtalk.csh
echo "" >> /etc/profile.d/logtalk.csh
echo "# Logtalk installation directory:" >> /etc/profile.d/logtalk.csh
echo "setenv LOGTALKHOME $RPM_INSTALL_PREFIX/logtalk" >> /etc/profile.d/logtalk.csh
echo "" >> /etc/profile.d/logtalk.csh
echo "# Default location for Logtalk end-user files:" >> /etc/profile.d/logtalk.csh
echo "setenv LOGTALKUSER \$HOME/logtalk" >> /etc/profile.d/logtalk.csh
chmod a+x /etc/profile.d/logtalk.csh
eval export LOGTALKHOME=$RPM_INSTALL_PREFIX/logtalk; cd $LOGTALKHOME/scripts; ./makeall_lgt.sh $RPM_INSTALL_PREFIX
echo ""
echo "Defined the following environment variables for all users:"
echo ""
echo "  Logtalk installation directory: LOGTALKHOME = $RPM_INSTALL_PREFIX/logtalk"
echo "  Default Logtalk user files directory: LOGTALKUSER = \$HOME/logtalk"
echo ""
echo "You may need to logout and login again or start a new shell in order to"
echo "use the new environment variables."
echo ""
echo "You may change the default value of the LOGTALKUSER environment variable"
echo "in your shell configuration files if you already use, or want to use, a "
echo "different location for the Logtalk user files directory."
echo ""
%postun
rm -f /etc/profile.d/logtalk.sh 2> /dev/null
rm -f /etc/profile.d/logtalk.csh 2> /dev/null
