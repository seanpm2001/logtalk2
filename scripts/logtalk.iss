; Script generated by the Inno Setup Script Wizard.

#define MyAppName "Logtalk"
#define MyAppVerName "Logtalk 2.28.2"
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
OutputBaseFilename=lgt2282
Compression=lzma
SolidCompression=yes

VersionInfoVersion=2.28.2
VersionInfoCopyright=� Paulo Moura, 1998-2006

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
Name: "prolog\bp"; Description: "B-Prolog integration (version 6.9 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\ciao"; Description: "Ciao Prolog integration (version 1.10#5 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\eclipse"; Description: "ECLiPSe integration (versions 5.8 or 5.9)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\gprolog"; Description: "GNU Prolog integration (version 1.2.16 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\plc"; Description: "K-Prolog integration (version 5.1.4 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\sicstus"; Description: "SICStus Prolog integration (versions 3.12.x, 4.0)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\swi"; Description: "SWI-Prolog integration (version 5.6.16 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\xsb"; Description: "XSB integration (version 3.0 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\yap"; Description: "YAP integration (version 5.1.1 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning

[Tasks]
Name: registration; Description: "&Register {#MyAppName} (opens a web page; requires an Internet connection)"; Components: base user
Name: shortcut; Description: "&Create a desktop shortcut to the Logtalk user folder"; Components: user

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
BeveledLabel=Logtalk 2.28.2 � Paulo Moura, 1998-2006

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

Source: "C:\logtalk\configs\xsb.config"; DestDir: "{code:GetLgtUserDir}\configs"; DestName: "xsb.pl"; Components: user; Flags: ignoreversion uninsneveruninstall
Source: "C:\logtalk\libpaths\libpaths.pl"; DestDir: "{code:GetLgtUserDir}\libpaths"; DestName: "libpaths_no_env_var.pl"; Components: user; Flags: ignoreversion uninsneveruninstall

Source: "C:\logtalk\scripts\*.bat"; DestDir: "{win}"; Components: base; Flags: ignoreversion
Source: "C:\logtalk\xml\*.bat"; DestDir: "{win}"; Components: base; Flags: ignoreversion

[INI]
Filename: "{app}\{#MyAppUrlName}"; Section: "InternetShortcut"; Key: "URL"; String: "{#MyAppURL}"; Components: base
Filename: "{app}\{#MyAppRegUrlName}"; Section: "InternetShortcut"; Key: "URL"; String: "{#MyAppRegURL}"; Components: base

[Icons]
Name: "{group}\{#MyAppName} Bibliography"; Filename: "{app}\BIBLIOGRAPHY.bib"; Components: base
Name: "{group}\{#MyAppName} Documentation"; Filename: "{app}\manuals\index.html"; Components: base
Name: "{group}\{#MyAppName} License"; Filename: "{app}\LICENSE.txt"; Components: base
Name: "{group}\{#MyAppName} Release Notes"; Filename: "{app}\RELEASE_NOTES.txt"; Components: base
Name: "{group}\{#MyAppName} Read Me"; Filename: "{app}\README.txt"; Components: base
Name: "{group}\{#MyAppName} Customization instructions"; Filename: "{app}\CUSTOMIZE.txt"; Components: base

Name: "{group}\{#MyAppName} Web Site"; Filename: "{app}\{#MyAppUrlName}"; Components: base
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"; Components: base

Name: "{code:GetLgtUserDir}\manuals"; Filename: "{app}\manuals"; Components: user
Name: "{code:GetLgtUserDir}\wenv"; Filename: "{app}\wenv"; Components: user

Name: "{userdesktop}\Logtalk user files"; Filename: "{code:GetLgtUserDir}"; Components: user; Tasks: shortcut

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "LOGTALKHOME"; ValueData: "{app}"; Components: base; Flags: deletevalue uninsdeletevalue
Root: HKCU; Subkey: "Environment"; ValueType: expandsz; ValueName: "LOGTALKUSER"; ValueData: "{code:GetLgtUserDir}"; Flags: deletevalue uninsdeletevalue

[Run]
Filename: "{cmd}"; Parameters: "/C set LOGTALKHOME={app} & cscript ""{app}\scripts\make_bplgt.js"""; Description: "B-Prolog integration"; Components: prolog\bp
Filename: "{cmd}"; Parameters: "/C set LOGTALKHOME={app} & cscript ""{app}\scripts\make_ciaolgt.js"""; Description: "Ciao Prolog integration"; Components: prolog\ciao
Filename: "{cmd}"; Parameters: "/C set LOGTALKHOME={app} & cscript ""{app}\scripts\make_eclipselgt.js"""; Description: "ECLiPSe integration"; Components: prolog\eclipse
Filename: "{cmd}"; Parameters: "/C set LOGTALKHOME={app} & cscript ""{app}\scripts\make_gplgt.js"""; Description: "GNU Prolog integration"; Components: prolog\gprolog
Filename: "{cmd}"; Parameters: "/C set LOGTALKHOME={app} & cscript ""{app}\scripts\make_plclgt.js"""; Description: "K-Prolog integration"; Components: prolog\plc
Filename: "{cmd}"; Parameters: "/C set LOGTALKHOME={app} & cscript ""{app}\scripts\make_sicstuslgt.js"""; Description: "SICStus Prolog integration"; Components: prolog\sicstus
Filename: "{cmd}"; Parameters: "/C set LOGTALKHOME={app} & cscript ""{app}\scripts\make_swilgt.js"""; Description: "SWI-Prolog integration"; Components: prolog\swi
Filename: "{cmd}"; Parameters: "/C set LOGTALKHOME={app} & cscript ""{app}\scripts\make_xsblgt.js"""; Description: "XSB integration"; Components: prolog\xsb
Filename: "{cmd}"; Parameters: "/C set LOGTALKHOME={app} & cscript ""{app}\scripts\make_yaplgt.js"""; Description: "YAP integration"; Components: prolog\yap

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
  Explanation, Warning, Scripts: String;

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
    RenameFile(LgtUserDirPage.Values[0], LgtUserDirPage.Values[0] + ' backup ' + GetDateTimeString('dddddd tt', '-', '-'));
  if (CurStep = ssInstall) and (pos('prolog', WizardSelectedComponents(False)) > 0) then
  begin
    Scripts := 'The installer needs to run a set of JScripts scripts within command shells' + Chr(13) +
               'in order to integrate Logtalk with your installed Prolog compilers.' + Chr(13) + Chr(13) +
               'These scripts require WSH 5.6 (or later version) to be installed.' + Chr(13) + Chr(13) +
               'Make sure that any security software you may have installed do not block' + Chr(13) +
               'the execution of the scripts.';
    MsgBox(Scripts, mbInformation, MB_OK)
  end
end;

