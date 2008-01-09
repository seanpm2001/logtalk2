; Script generated by the Inno Setup Script Wizard.

#define MyAppName "Logtalk"
#define MyAppVerName "Logtalk 2.31.2"
#define MyAppPublisher "Logtalk.org"
#define MyAppURL "http://logtalk.org"
#define MyAppUrlName "Logtalk Web Site.url"
#define MyAppRegURL "http://logtalk.org/regform.html"
#define MyAppRegUrlName "Logtalk Registration.url"

#define LOGTALKHOME "{reg:HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment,LOGTALKHOME|{pf}\Logtalk}"
#define LOGTALKUSER "{reg:HKCU\Environment,LOGTALKUSER|{userdocs}\Logtalk}"

[Setup]
AppName={#MyAppName}
AppVerName={#MyAppVerName}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
ChangesEnvironment=yes
DefaultDirName={#LOGTALKHOME}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=C:\logtalk\LICENSE.txt
InfoBeforeFile=C:\logtalk\README.txt
OutputBaseFilename=lgt2312
Compression=lzma
SolidCompression=yes
PrivilegesRequired=none

VersionInfoVersion=2.31.2
VersionInfoCopyright=� Paulo Moura, 1998-2008

AllowRootDirectory=yes
UninstallFilesDir="{userdocs}\Logtalk uninstaller"

MinVersion=0,5.0

[Types]
Name: "full"; Description: "Full installation (recommended)"
Name: "base"; Description: "Base system installation"
Name: "user"; Description: "User data files installation (must be run by all end-users)"
Name: "prolog"; Description: "Prolog integration (see documentation for compatibility details)"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "base"; Description: "Base system"; Types: full base custom; Flags: disablenouninstallwarning
Name: "user"; Description: "User data files"; Types: full user custom; Flags: checkablealone disablenouninstallwarning
Name: "user\backup"; Description: "Backup current user data files"; Types: full user custom; Flags: disablenouninstallwarning
Name: "prolog"; Description: "Prolog integration"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\bp"; Description: "B-Prolog integration (version 7.0 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\ciao"; Description: "Ciao Prolog integration (version 1.10#5 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\cxprolog"; Description: "CxProlog integration (version 0.96.1 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\eclipse"; Description: "ECLiPSe integration (version 5.10#26 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\gprolog"; Description: "GNU Prolog integration (version 1.2.16 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\plc"; Description: "K-Prolog integration (version 6.0.1 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\sicstus"; Description: "SICStus Prolog integration (versions 3.12.x, 4.0.x)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\swi"; Description: "SWI-Prolog integration (version 5.6.16 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\xsb"; Description: "XSB integration (version 3.1 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\yap"; Description: "YAP integration (version 5.1.2 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning

[Tasks]
Name: registration; Description: "&Register {#MyAppName} (opens a web page; requires an Internet connection)"; Components: base user
Name: shortcut; Description: "&Create a desktop shortcut to the Logtalk user folder"; Components: user

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
BeveledLabel=Logtalk 2.31.2 � Paulo Moura, 1998-2008

[Dirs]
Name: {code:GetLgtUserDir}; Components: user; Flags: uninsneveruninstall
Name: "{userdocs}\Logtalk uninstaller"

[Files]
Source: "C:\logtalk\*"; Excludes: ".*,CVS"; DestDir: "{app}"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "C:\logtalk\configs\*"; Excludes: ".*,CVS"; DestDir: "{code:GetLgtUserDir}\configs"; Components: user; Flags: ignoreversion recursesubdirs createallsubdirs uninsneveruninstall
Source: "C:\logtalk\contributions\*"; Excludes: ".*,CVS"; DestDir: "{code:GetLgtUserDir}\contributions"; Components: user; Flags: ignoreversion recursesubdirs createallsubdirs uninsneveruninstall
Source: "C:\logtalk\examples\*"; Excludes: ".*,CVS"; DestDir: "{code:GetLgtUserDir}\examples"; Components: user; Flags: ignoreversion recursesubdirs createallsubdirs uninsneveruninstall
Source: "C:\logtalk\libpaths\*"; Excludes: ".*,CVS"; DestDir: "{code:GetLgtUserDir}\libpaths"; Components: user; Flags: ignoreversion recursesubdirs createallsubdirs uninsneveruninstall
Source: "C:\logtalk\library\*"; Excludes: ".*,CVS"; DestDir: "{code:GetLgtUserDir}\library"; Components: user; Flags: ignoreversion recursesubdirs createallsubdirs uninsneveruninstall
Source: "C:\logtalk\xml\*"; Excludes: ".*,CVS"; DestDir: "{code:GetLgtUserDir}\xml"; Components: user; Flags: ignoreversion recursesubdirs createallsubdirs uninsneveruninstall

Source: "C:\logtalk\configs\amzi.config"; DestDir: "{code:GetLgtUserDir}\configs"; DestName: "amzi.pro"; Components: user; Flags: ignoreversion uninsneveruninstall
Source: "C:\logtalk\libpaths\libpaths.pl"; DestDir: "{code:GetLgtUserDir}\libpaths"; DestName: "libpaths_no_env_var.pl"; Components: user; Flags: ignoreversion uninsneveruninstall

Source: "C:\logtalk\scripts\*.bat"; DestDir: "{win}"; Components: base; Flags: ignoreversion
Source: "C:\logtalk\xml\*.bat"; DestDir: "{win}"; Components: base; Flags: ignoreversion

[INI]
Filename: "{app}\{#MyAppUrlName}"; Section: "InternetShortcut"; Key: "URL"; String: "{#MyAppURL}"; Components: base
Filename: "{app}\{#MyAppRegUrlName}"; Section: "InternetShortcut"; Key: "URL"; String: "{#MyAppRegURL}"; Components: base

[Icons]
Name: "{group}\Bibliography"; Filename: "{app}\BIBLIOGRAPHY.bib"; Components: base
Name: "{group}\Documentation"; Filename: "{app}\manuals\index.html"; Components: base
Name: "{group}\License"; Filename: "{app}\LICENSE.txt"; Components: base
Name: "{group}\Release Notes"; Filename: "{app}\RELEASE_NOTES.txt"; Components: base
Name: "{group}\Read Me"; Filename: "{app}\README.txt"; Components: base
Name: "{group}\Customization instructions"; Filename: "{app}\CUSTOMIZE.txt"; Components: base

Name: "{group}\Web Site"; Filename: "{#MyAppUrl}"; Components: base

Name: "{group}\Logtalk - B-Prolog"; Filename: "{code:GetBPExePath}"; Parameters: "-g ""consult('$LOGTALKHOME/integration/logtalk_bp.pl'), $bp_top_level"""; Comment: "Runs Logtalk with B-Prolog"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\bp; Flags: createonlyiffileexists

Name: "{group}\Logtalk - Ciao Prolog"; Filename: "{code:GetCiaoExePath}"; Parameters: "-l ""$LOGTALKHOME/integration/logtalk_ciao.pl"""; Comment: "Runs Logtalk with Ciao Prolog"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\ciao; Flags: createonlyiffileexists

Name: "{group}\Logtalk - CxProlog"; Filename: "{code:GetCxExePath}"; Parameters: "--goal ""silent_consult('%LOGTALKHOME%/integration/logtalk_cx.pl')"""; Comment: "Runs Logtalk with CxProlog"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\cxprolog; Flags: createonlyiffileexists

Name: "{group}\Logtalk - ECLiPSe"; Filename: "{code:GetEclipseExePath}"; Parameters: "-b ""%LOGTALKHOME%\integration\logtalk_eclipse.pl"""; Comment: "Runs Logtalk with ECLiPSe"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\eclipse; Flags: createonlyiffileexists

Name: "{group}\Logtalk - GNU Prolog"; Filename: "{code:GetGPExePath}"; Parameters: "--init-goal ""['$LOGTALKUSER/configs/gnu.config', '$LOGTALKHOME/integration/logtalk_gp.pl', '$LOGTALKUSER/libpaths/libpaths.pl']"""; Comment: "Runs Logtalk with GNU Prolog"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\gprolog; Flags: createonlyiffileexists

Name: "{group}\Logtalk - K-Prolog"; Filename: "{code:GetKPExePath}"; Parameters: "-h 4096k -l 2048k -g 4096k -e ""(consult('$LOGTALKHOME/integration/logtalk_plc.pl'), '$root')."""; Comment: "Runs Logtalk with K-Prolog"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\gprolog; Flags: createonlyiffileexists

Name: "{group}\Logtalk - SICStus Prolog 3"; Filename: "{code:GetSP3ExePath}"; Parameters: "-l ""%LOGTALKHOME%\integration\logtalk_sicstus3.pl"""; Comment: "Runs Logtalk with SSICStus Prolog 3"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\sicstus; Flags: createonlyiffileexists

Name: "{group}\Logtalk - SICStus Prolog 4"; Filename: "{code:GetSP4ExePath}"; Parameters: "-l ""%LOGTALKHOME%\integration\logtalk_sicstus4.pl"""; Comment: "Runs Logtalk with SICStus Prolog 4"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\sicstus; Flags: createonlyiffileexists

Name: "{group}\Logtalk - SWI-Prolog"; Filename: "{code:GetSWIExePath}"; Parameters: "-f ""%LOGTALKHOME%\integration\logtalk_swi.pl"""; Comment: "Runs Logtalk with SWI-Prolog"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\swi; Flags: createonlyiffileexists

Name: "{group}\Logtalk - XSB"; Filename: "C:\XSB\config\x86-pc-windows\bin\xsb.exe"; Parameters: "-l -e ""['%LOGTALKUSER%\\configs\\xsb.config', '%LOGTALKHOME%\\compiler\\logtalk.pl', '%LOGTALKUSER%\\libpaths\\libpaths.pl']."""; Comment: "Runs Logtalk with XSB"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\xsb; Flags: createonlyiffileexists

Name: "{group}\Logtalk - XSB-MT"; Filename: "C:\XSB\config\i686-pc-cygwin-mt\bin\xsb.exe"; Parameters: "--shared_predicates -l -e ""['%LOGTALKUSER%\\configs\\xsb.config', '%LOGTALKHOME%\\compiler\\logtalk.pl', '%LOGTALKUSER%\\libpaths\\libpaths.pl']."""; Comment: "Runs Logtalk with XSB-MT"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\xsb; Flags: createonlyiffileexists

Name: "{group}\Logtalk - YAP"; Filename: "C:\Yap\bin\yap.exe"; Parameters: "-l ""$LOGTALKHOME/integration/logtalk_yap.pl"""; Comment: "Runs Logtalk with YAP"; WorkingDir: "{code:GetLgtUserDir}"; Components: prolog\yap; Flags: createonlyiffileexists

Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"; Components: base

Name: "{code:GetLgtUserDir}\manuals"; Filename: "{app}\manuals"; Components: user
Name: "{code:GetLgtUserDir}\wenv"; Filename: "{app}\wenv"; Components: user

Name: "{userdesktop}\Logtalk user files"; Filename: "{code:GetLgtUserDir}"; Components: user; Tasks: shortcut

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "LOGTALKHOME"; ValueData: "{app}"; Components: base; Flags: deletevalue uninsdeletevalue
Root: HKCU; Subkey: "Environment"; ValueType: expandsz; ValueName: "LOGTALKUSER"; ValueData: "{code:GetLgtUserDir}"; Flags: deletevalue uninsdeletevalue

[Run]
Filename: "{app}\RELEASE_NOTES.txt"; Description: "View the release notes"; Components: base user; Flags: postinstall shellexec skipifsilent
Filename: "{app}\CUSTOMIZE.txt"; Description: "Read the customization instructions for completing your setup"; Components: base user; Flags: postinstall shellexec skipifsilent

Filename: "{app}\{#MyAppRegUrlName}"; Flags: shellexec nowait; Tasks: registration

[UninstallDelete]
Type: filesandordirs; Name: "{app}"; Components: base
Type: filesandordirs; Name: "{group}"; Components: base

[Code]
var
  LgtUserDirPage: TInputDirWizardPage;
  WarningPage: TOutputMsgWizardPage;
  Explanation, Warning: String;

procedure InitializeWizard;
begin
  Explanation := 'Select the folder in which Setup should install Logtalk user data files, then click Next.'
                 + Chr(13) + Chr(13)
                 + 'These files allows each user to independently customize Logtalk and to freely modify the provided programming examples.'
                 + Chr(13) + Chr(13)
                 + 'A copy of these files must exist in the user home folder in order to use the Logtalk-Prolog integration scripts available from the Start Menu.'
                 + Chr(13) + Chr(13)
                 + 'Addtional end-users may use this installer to make a copy of these files on their home folders after a full installation of Logtalk.';
  LgtUserDirPage := CreateInputDirPage(wpSelectDir,
    'Select folder for Logtalk user data files', 'Where should Logtalk user data files be installed?',
    Explanation,
    False, 'New Folder');
  LgtUserDirPage.Add('');
  LgtUserDirPage.Values[0] := ExpandConstant('{#LOGTALKUSER}');
  if not IsAdminLoggedOn then
  begin
    Warning := 'Full installation of Logtalk requires an administrative user.'
               + Chr(13) + Chr(13)
               + 'If the base Logtalk system is already installed, you may proceed in order to setup Logtalk for you as an end-user.'
               + Chr(13) + Chr(13)
               + 'If Logtalk is already set for you, this installer will make a backup copy of your current files (if you choose the same installation folder) and will restore all user data files to their default, pristine state.';
    WarningPage := CreateOutputMsgPage(wpWelcome,
  'Information', 'Please read the following important information before continuing.', Warning);
  end
end;

function GetLgtUserDir(Param: String): String;
begin
  Result := LgtUserDirPage.Values[0]
end;

function GetCurrentDate(Param: String): String;
begin
  Result := GetDateTimeString('dddddd tt', '-', '-')
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  if (PageID = wpSelectDir) and not IsAdminLoggedOn then
    Result := True
  else if (PageID = wpSelectComponents) and not IsAdminLoggedOn then
  begin
    WizardForm.TypesCombo.ItemIndex := 2;
    WizardForm.TypesCombo.OnChange(nil);
    Result := True
  end
  else if (PageID = wpReady) and not IsAdminLoggedOn then
    Result := True
  else
    Result := False;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if (CurStep = ssInstall) and DirExists(LgtUserDirPage.Values[0]) and (pos('backup', WizardSelectedComponents(False)) > 0) then
    RenameFile(LgtUserDirPage.Values[0], LgtUserDirPage.Values[0] + ' backup ' + GetDateTimeString('dddddd tt', '-', '-'))
end;

function GetBPExePath(Param: String): String;
var
  BPDIR: String;
begin
  if RegQueryStringValue(HKLM, 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment\', 'BPDIR', BPDIR) then
    Result := BPDIR + '\bp.bat'
  else
	Result := 'lgt_exe_does_not_exist'
end;

function GetCiaoExePath(Param: String): String;
var
  CiaoDir: String;
begin
  if RegQueryStringValue(HKLM, 'Software\Ciao Prolog\', 'ciao_dir', CiaoDir) then
    Result := CiaoDir + '\shell\ciaosh.cpx'
  else
	Result := 'lgt_exe_does_not_exist'
end;

function GetCxExePath(Param: String): String;
var
  CxDir: String;
begin
  if RegQueryStringValue(HKLM, 'Software\CxProlog\', 'CXPROLOGDIR', CxDir) then
    Result := CxDir + '\cxprolog.exe'
  else
	Result := 'lgt_exe_does_not_exist'
end;

function GetEclipseExePath(Param: String): String;
var
  ECLIPSEDIR: String;
begin
  if RegQueryStringValue(HKLM, 'Software\IC-Parc\Eclipse\5.11\', 'ECLIPSEDIR', ECLIPSEDIR) then
    Result := ECLIPSEDIR + '\lib\i386_nt\eclipse.exe'
  else if RegQueryStringValue(HKLM, 'Software\IC-Parc\Eclipse\5.10\', 'ECLIPSEDIR', ECLIPSEDIR) then
    Result := ECLIPSEDIR + '\lib\i386_nt\eclipse.exe'
  else
	Result := 'lgt_exe_does_not_exist'
end;

function GetGPExePath(Param: String): String;
var
  RootPath: String;
begin
  if RegQueryStringValue(HKCU, 'Software\GnuProlog\', 'RootPath', RootPath) then
    Result := RootPath + '\bin\gprolog.exe'
  else
	Result := 'lgt_exe_does_not_exist'
end;

function GetKPExePath(Param: String): String;
begin
    Result := GetEnv('PLC') + '\plc.exe'
end;

function GetSP3ExePath(Param: String): String;
var
  SP_PATH: String;
begin
  if RegQueryStringValue(HKLM, 'Software\SICS\SICStus3.12_win32\', 'SP_PATH', SP_PATH) then
    Result := SP_PATH + '\bin\spwin.exe'
  else
	Result := 'lgt_exe_does_not_exist'
end;

function GetSP4ExePath(Param: String): String;
var
  SP_PATH: String;
begin
  if RegQueryStringValue(HKLM, 'Software\SICS\SICStus4.0_win32\', 'SP_PATH', SP_PATH) then
    Result := SP_PATH + '\bin\spwin.exe'
  else
	Result := 'lgt_exe_does_not_exist'
end;

function GetSWIExePath(Param: String): String;
var
  Home: String;
begin
  if RegQueryStringValue(HKLM, 'Software\SWI\Prolog\', 'home', Home) then
    Result := Home + '\bin\plwin.exe'
  else
	Result := 'lgt_exe_does_not_exist'
end;
