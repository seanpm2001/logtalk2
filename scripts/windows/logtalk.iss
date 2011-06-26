; Script generated by the Inno Setup Script Wizard.

#define MyAppName "Logtalk"
#define MyAppVerName "Logtalk 2.43.0"
#define MyAppPublisher "Logtalk.org"
#define MyAppURL "http://logtalk.org"
#define MyAppUrlName "Logtalk Web Site.url"
#define MyAppRegURL "http://logtalk.org/regform.html"
#define MyAppRegUrlName "Logtalk Registration.url"

#define MyBaseDir "C:\lgtsvn"

[Setup]
AppName={#MyAppName}
AppVerName={#MyAppVerName}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
ChangesEnvironment=yes
ChangesAssociations=yes
DefaultDirName={{pf}\Logtalk}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
LicenseFile={#MyBaseDir}\LICENSE.txt
InfoBeforeFile={#MyBaseDir}\README.txt
OutputBaseFilename=lgt2430
Compression=lzma
SolidCompression=yes
PrivilegesRequired=none

VersionInfoVersion=2.43.0
VersionInfoCopyright=� Paulo Moura, Copyright (c) 1998-2011

AllowRootDirectory=yes
UninstallFilesDir="{userdocs}\Logtalk uninstaller"

MinVersion=0,5.0

[Types]
Name: "full"; Description: "Full installation"
Name: "base"; Description: "Base system installation"
Name: "user"; Description: "User files installation"
Name: "prolog"; Description: "Prolog integration shortcuts"
Name: "custom"; Description: "Custom installation"; Flags: iscustom

[Components]
Name: "base"; Description: "Base system (compiler/runtime, Prolog integration files, manuals)"; Types: full base custom; Flags: disablenouninstallwarning
Name: "user"; Description: "User files (libraries, examples, and other support files)"; Types: full user custom; Flags: checkablealone disablenouninstallwarning
Name: "user\backup"; Description: "Backup current Logtalk user folder"; Types: full user custom; Flags: disablenouninstallwarning
Name: "prolog"; Description: "Prolog integration (back-end compiler support)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\bp"; Description: "B-Prolog integration (version 7.5 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\cxprolog"; Description: "CxProlog integration (version 0.97.5 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\eclipse"; Description: "ECLiPSe integration (version 6.0#141 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\gprolog"; Description: "GNU Prolog integration (version 1.4.0 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\sicstus"; Description: "SICStus Prolog integration (versions 3.12.x, 4.x)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\swicon"; Description: "SWI-Prolog (console) integration (version 5.8.0 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\swiwin"; Description: "SWI-Prolog (window) integration (version 5.8.0 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\xsb"; Description: "XSB integration (version 3.3 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\xsbmt"; Description: "XSB-MT integration (version 3.3 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning
Name: "prolog\yap"; Description: "YAP integration (version 6.0.2 or later)"; Types: full prolog custom; Flags: disablenouninstallwarning

[Tasks]
Name: registration; Description: "&Register {#MyAppName} (opens a web page; requires an Internet connection)"; Components: base
Name: shortcut; Description: "&Create a desktop shortcut to the Logtalk user folder"; Components: user

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
BeveledLabel=Logtalk 2.43.0 � Paulo Moura, Copyright (c) 1998-2011

[Dirs]
Name: {code:GetLgtUserDir}; Components: user; Flags: uninsneveruninstall
Name: "{userdocs}\Logtalk uninstaller"

[Files]
Source: "{#MyBaseDir}\*"; Excludes: ".*"; DestDir: "{app}"; Components: base; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#MyBaseDir}\contributions\*"; Excludes: ".*"; DestDir: "{code:GetLgtUserDir}\contributions"; Components: user; Flags: ignoreversion recursesubdirs createallsubdirs uninsneveruninstall
Source: "{#MyBaseDir}\examples\*"; Excludes: ".*"; DestDir: "{code:GetLgtUserDir}\examples"; Components: user; Flags: ignoreversion recursesubdirs createallsubdirs uninsneveruninstall
Source: "{#MyBaseDir}\libpaths\*"; Excludes: ".*"; DestDir: "{code:GetLgtUserDir}\libpaths"; Components: user; Flags: ignoreversion recursesubdirs createallsubdirs uninsneveruninstall
Source: "{#MyBaseDir}\library\*"; Excludes: ".*"; DestDir: "{code:GetLgtUserDir}\library"; Components: user; Flags: ignoreversion recursesubdirs createallsubdirs uninsneveruninstall
Source: "{#MyBaseDir}\xml\*"; Excludes: ".*"; DestDir: "{code:GetLgtUserDir}\xml"; Components: user; Flags: ignoreversion recursesubdirs createallsubdirs uninsneveruninstall

Source: "{#MyBaseDir}\settings.lgt"; DestDir: "{code:GetLgtUserDir}"; DestName: "settings.lgt"; Components: user; Flags: ignoreversion uninsneveruninstall
Source: "{#MyBaseDir}\VERSION.txt"; DestDir: "{code:GetLgtUserDir}"; DestName: "VERSION.txt"; Components: user; Flags: ignoreversion uninsneveruninstall

Source: "{#MyBaseDir}\scripts\*.bat"; DestDir: "{win}"; Components: base; Flags: ignoreversion; Check: IsAdminLoggedOn
Source: "{#MyBaseDir}\xml\*.bat"; DestDir: "{win}"; Components: base; Flags: ignoreversion; Check: IsAdminLoggedOn

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
Name: "{group}\Default settings"; Filename: "%LOGTALKUSER%\settings.lgt"; Components: base

Name: "{group}\Web Site"; Filename: "{#MyAppUrl}"; Components: base

Name: "{group}\Logtalk - B-Prolog"; Filename: "{code:GetBPExePath}"; Parameters: "-g ""consult('$LOGTALKHOME/integration/logtalk_bp.pl'), $bp_top_level"""; Comment: "Runs Logtalk with B-Prolog"; WorkingDir: "%CD%"; Components: prolog\bp; Flags: createonlyiffileexists

Name: "{group}\Logtalk - CxProlog"; Filename: "{code:GetCxExePath}"; Parameters: "--script ""%LOGTALKHOME%\\integration\\logtalk_cx.pl"""; Comment: "Runs Logtalk with CxProlog"; WorkingDir: "%CD%"; Components: prolog\cxprolog; Flags: createonlyiffileexists

Name: "{group}\Logtalk - ECLiPSe 6"; Filename: "{code:GetEclipse6ExePath}"; Parameters: "-b ""$LOGTALKHOME/integration/logtalk_eclipse6.pl"""; Comment: "Runs Logtalk with ECLiPSe 6"; WorkingDir: "%CD%"; Components: prolog\eclipse; Flags: createonlyiffileexists

Name: "{group}\Logtalk - GNU Prolog"; Filename: "{code:GetGPExePath}"; Parameters: "--init-goal ""['$LOGTALKHOME/integration/logtalk_gp.pl']"""; Comment: "Runs Logtalk with GNU Prolog"; WorkingDir: "%CD%"; Components: prolog\gprolog; Flags: createonlyiffileexists

Name: "{group}\Logtalk - SICStus Prolog 3.12"; Filename: "{code:GetSP3ExePath}"; Parameters: "-l ""%LOGTALKHOME%\integration\logtalk_sicstus3.pl"""; Comment: "Runs Logtalk with SICStus Prolog 3.12"; WorkingDir: "%CD%"; Components: prolog\sicstus; Flags: createonlyiffileexists

Name: "{group}\Logtalk - SICStus Prolog 4"; Filename: "{code:GetSP4ExePath}"; Parameters: "-l ""%LOGTALKHOME%\integration\logtalk_sicstus4.pl"""; Comment: "Runs Logtalk with SICStus Prolog 4"; WorkingDir: "%CD%"; Components: prolog\sicstus; Flags: createonlyiffileexists

Name: "{group}\Logtalk - SWI-Prolog (console)"; Filename: "{code:GetSWIConExePath}"; Parameters: "-f ""%LOGTALKHOME%\integration\logtalk_swi.pl"""; Comment: "Runs Logtalk with SWI-Prolog"; WorkingDir: "%CD%"; Components: prolog\swicon; Flags: createonlyiffileexists

Name: "{group}\Logtalk - SWI-Prolog (window)"; Filename: "{code:GetSWIWinExePath}"; Parameters: "-f ""%LOGTALKHOME%\integration\logtalk_swi.pl"""; Comment: "Runs Logtalk with SWI-Prolog"; WorkingDir: "%CD%"; Components: prolog\swiwin; Flags: createonlyiffileexists

Name: "{group}\Logtalk - XSB"; Filename: "{code:GetXSBExePath}"; Parameters: "-l -e ""['%LOGTALKHOME%\\integration\\logtalk_xsb.pl']."""; Comment: "Runs Logtalk with XSB"; WorkingDir: "%CD%"; Components: prolog\xsb; Flags: createonlyiffileexists

Name: "{group}\Logtalk - XSB-MT"; Filename: "{code:GetXSBMTExePath}"; Parameters: "-l -e ""['%LOGTALKHOME%\\integration\\logtalk_xsbmt.pl']."""; Comment: "Runs Logtalk with XSB-MT"; WorkingDir: "%CD%"; Components: prolog\xsbmt; Flags: createonlyiffileexists

Name: "{group}\Logtalk - YAP"; Filename: "{code:GetYAPExePath}"; Parameters: "-l ""$LOGTALKHOME/integration/logtalk_yap.pl"""; Comment: "Runs Logtalk with YAP"; WorkingDir: "%CD%"; Components: prolog\yap; Flags: createonlyiffileexists

Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"; Components: base

Name: "{code:GetLgtUserDir}\Bibliography"; Filename: "{app}\BIBLIOGRAPHY.bib"; Components: user
Name: "{code:GetLgtUserDir}\License"; Filename: "{app}\LICENSE.txt"; Components: user
Name: "{code:GetLgtUserDir}\Release Notes"; Filename: "{app}\RELEASE_NOTES.txt"; Components: user
Name: "{code:GetLgtUserDir}\Read Me"; Filename: "{app}\README.txt"; Components: user
Name: "{code:GetLgtUserDir}\Customization instructions"; Filename: "{app}\CUSTOMIZE.txt"; Components: user
Name: "{code:GetLgtUserDir}\configs"; Filename: "{app}\configs"; Components: user
Name: "{code:GetLgtUserDir}\manuals"; Filename: "{app}\manuals"; Components: user
Name: "{code:GetLgtUserDir}\wenv"; Filename: "{app}\wenv"; Components: user

Name: "{userdesktop}\Logtalk user files"; Filename: "{code:GetLgtUserDir}"; Components: user; Tasks: shortcut

[Registry]
; admin users
Root: HKLM; Subkey: "Software\Logtalk"; ValueType: dword; ValueName: "Version"; ValueData: "2430"; Components: base; Flags: deletevalue uninsdeletevalue; Check: IsAdminLoggedOn
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "LOGTALKHOME"; ValueData: "{app}"; Components: base; Flags: deletevalue uninsdeletevalue; Check: IsAdminLoggedOn
Root: HKCU; Subkey: "Environment"; ValueType: expandsz; ValueName: "LOGTALKUSER"; ValueData: "{code:GetLgtUserDir}"; Flags: deletevalue uninsdeletevalue; Check: IsAdminLoggedOn
Root: HKLM; Subkey: "SOFTWARE\Classes\MIME\Database\Content Type\text/x-logtalk"; Components: base; Flags: uninsdeletevalue; Check: IsAdminLoggedOn
Root: HKLM; Subkey: "SOFTWARE\Classes\MIME\Database\Content Type\text/x-logtalk"; ValueType: string; ValueName: "Extension"; ValueData: ".lgt"; Components: base; Flags: deletevalue uninsdeletevalue; Check: IsAdminLoggedOn
Root: HKCR; Subkey: ".lgt"; ValueType: string; ValueName: ""; ValueData: "LogtalkSourceFile"; Components: base; Flags: uninsdeletevalue; Check: IsAdminLoggedOn
Root: HKCR; Subkey: "LogtalkSourceFile"; ValueType: string; ValueName: ""; ValueData: "Logtalk source file"; Components: base; Flags: uninsdeletekey; Check: IsAdminLoggedOn
; non-admin users
Root: HKCU; Subkey: "Software\Logtalk"; ValueType: dword; ValueName: "Version"; ValueData: "2430"; Components: base; Flags: deletevalue uninsdeletevalue; Check: not IsAdminLoggedOn
Root: HKCU; Subkey: "Environment"; ValueType: expandsz; ValueName: "LOGTALKHOME"; ValueData: "{app}"; Components: base; Flags: deletevalue uninsdeletevalue; Check: not IsAdminLoggedOn
Root: HKCU; Subkey: "Environment"; ValueType: expandsz; ValueName: "LOGTALKUSER"; ValueData: "{code:GetLgtUserDir}"; Flags: deletevalue uninsdeletevalue; Check: not IsAdminLoggedOn
Root: HKCU; Subkey: "SOFTWARE\Classes\MIME\Database\Content Type\text/x-logtalk"; Components: base; Flags: uninsdeletevalue; Check: not IsAdminLoggedOn
Root: HKCU; Subkey: "SOFTWARE\Classes\MIME\Database\Content Type\text/x-logtalk"; ValueType: string; ValueName: "Extension"; ValueData: ".lgt"; Components: base; Flags: deletevalue uninsdeletevalue; Check: not IsAdminLoggedOn
Root: HKCU; Subkey: "SOFTWARE\Classes\.lgt"; ValueType: string; ValueName: ""; ValueData: "LogtalkSourceFile"; Components: base; Flags: uninsdeletevalue; Check: not IsAdminLoggedOn
Root: HKCU; Subkey: "SOFTWARE\Classes\LogtalkSourceFile"; ValueType: string; ValueName: ""; ValueData: "Logtalk source file"; Components: base; Flags: uninsdeletekey; Check: not IsAdminLoggedOn

[Run]
Filename: "{app}\RELEASE_NOTES.txt"; Description: "View the release notes"; Components: base; Flags: postinstall shellexec skipifsilent
Filename: "{app}\CUSTOMIZE.txt"; Description: "Read the customization instructions for completing your setup"; Components: base; Flags: postinstall shellexec skipifsilent

Filename: "{app}\{#MyAppRegUrlName}"; Components: base; Flags: shellexec nowait; Tasks: registration

[UninstallDelete]
Type: filesandordirs; Name: "{app}"; Components: base
Type: filesandordirs; Name: "{group}"; Components: base

[Code]
var
  LgtUserDirPage: TInputDirWizardPage;
  WarningPage, ErrorPage: TOutputMsgWizardPage;
  Explanation, Warning, Error, BackupFolder: String;

function GetLgtUserDir(Param: String): String;
begin
  Result := LgtUserDirPage.Values[0]
end;

function GetCurrentDate(Param: String): String;
begin
  Result := GetDateTimeString('dddddd tt', '-', '-')
end;

function ShouldSkipPage(PageID: Integer): Boolean;
var
  LOGTALKHOME: String;
begin
  if IsAdminLoggedOn then
    if RegQueryStringValue(HKLM, 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment', 'LOGTALKHOME', LOGTALKHOME) then
      WizardForm.DirEdit.Text := LOGTALKHOME
    else
      WizardForm.DirEdit.Text := ExpandConstant('{pf}') + '\Logtalk'
  else if RegQueryStringValue(HKCU, 'Environment', 'LOGTALKHOME', LOGTALKHOME) then
    WizardForm.DirEdit.Text := LOGTALKHOME
  else
    WizardForm.DirEdit.Text := ExpandConstant('{localappdata}') + '\Logtalk';
  Result := false
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  NewFolder: String;
begin
  NewFolder := LgtUserDirPage.Values[0];
  if (CurStep = ssInstall) and DirExists(NewFolder) and (pos('backup', WizardSelectedComponents(False)) > 0) then begin
    BackupFolder := NewFolder + '-backup-' + GetDateTimeString('yyyy-mm-dd-hhnnss', '-', ':');
    RenameFile(NewFolder, BackupFolder)
  end
  else if (CurStep = ssPostInstall) and FileExists(BackupFolder + '\settings.lgt') then begin
    RenameFile(NewFolder + '\settings.lgt', NewFolder + '\settings-pristine.lgt');
    FileCopy(BackupFolder + '\settings.lgt', NewFolder + '\settings.lgt', False)
  end
end;

function BPExePath: String;
var
  BPDIR: String;
begin
  if RegQueryStringValue(HKLM, 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment\', 'BPDIR', BPDIR) then
    Result := BPDIR + '\bp.bat'
  else
    Result := 'prolog_compiler_not_installed'
end;

function GetBPExePath(Param: String): String;
var
  Warning: String;
begin
  Result := BPExePath;
  if Result = 'prolog_compiler_not_installed' then
  begin
    Warning := 'Failed to detect B-Prolog installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	  MsgBox(Warning, mbError, MB_OK);
  end
end;

function CxExePath: String;
var
  CxDir: String;
begin
  if RegQueryStringValue(HKLM, 'SOFTWARE\CxProlog\', 'CXPROLOG_DIR', CxDir) then
    Result := CxDir + '\cxprolog.exe'
  else
    Result := 'prolog_compiler_not_installed'
end;

function GetCxExePath(Param: String): String;
var
  Warning: String;
begin
  Result := CxExePath;
  if Result = 'prolog_compiler_not_installed' then
  begin
    Warning := 'Failed to detect CxProlog installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK);
  end
end;

function Eclipse6ExePath: String;
var
  ECLIPSEDIR: String;
begin
  if IsWin64 then
    if RegQueryStringValue(HKLM64, 'Software\IC-Parc\Eclipse\6.1\', 'ECLIPSEDIR', ECLIPSEDIR) then
        Result := ECLIPSEDIR + '\lib\x86_64_nt\eclipse.exe'
    else if RegQueryStringValue(HKLM32, 'Software\IC-Parc\Eclipse\6.1\', 'ECLIPSEDIR', ECLIPSEDIR) then
        Result := ECLIPSEDIR + '\lib\i386_nt\eclipse.exe'
    else if RegQueryStringValue(HKLM32, 'Software\IC-Parc\Eclipse\6.0\', 'ECLIPSEDIR', ECLIPSEDIR) then
      Result := ECLIPSEDIR + '\lib\i386_nt\eclipse.exe'
    else
      Result := 'prolog_compiler_not_installed'
  else if RegQueryStringValue(HKLM, 'Software\IC-Parc\Eclipse\6.1\', 'ECLIPSEDIR', ECLIPSEDIR) then
         Result := ECLIPSEDIR + '\lib\i386_nt\eclipse.exe'
       else if RegQueryStringValue(HKLM, 'Software\IC-Parc\Eclipse\6.0\', 'ECLIPSEDIR', ECLIPSEDIR) then
         Result := ECLIPSEDIR + '\lib\i386_nt\eclipse.exe'
       else
         Result := 'prolog_compiler_not_installed'
end;

function GetEclipse6ExePath(Param: String): String;
var
  Warning: String;
begin
  Result := Eclipse6ExePath;
  if Result = 'prolog_compiler_not_installed' then
  begin
    Warning := 'Failed to detect ECLiPSe Prolog 6 installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
    MsgBox(Warning, mbError, MB_OK);
  end
end;

function GPExePath: String;
var
  RootPath: String;
begin
  if RegQueryStringValue(HKCU, 'Software\GnuProlog\', 'RootPath', RootPath) then
    Result := RootPath + '\bin\gprolog.exe'
  else
    Result := 'prolog_compiler_not_installed'
end;

function GetGPExePath(Param: String): String;
var
  Warning: String;
begin
  Result := GPExePath;
  if Result = 'prolog_compiler_not_installed' then
  begin
    Warning := 'Failed to detect GNU Prolog installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
    MsgBox(Warning, mbError, MB_OK);
  end
end;

function SP3ExePath: String;
var
  SP_PATH: String;
begin
  if RegQueryStringValue(HKLM32, 'Software\SICS\SICStus3.12_win32\', 'SP_PATH', SP_PATH) then
    Result := SP_PATH + '\bin\spwin.exe'
  else
    Result := 'prolog_compiler_not_installed'
end;

function GetSP3ExePath(Param: String): String;
var
  Warning: String;
begin
  Result := SP3ExePath;
  if Result = 'prolog_compiler_not_installed' then
  begin
    Warning := 'Failed to detect SICStus Prolog 3 installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK);
  end
end;

function SP4ExePath: String;
var
  SP_PATH: String;
begin
  if RegQueryStringValue(HKLM32, 'Software\SICS\SICStus4.2_x86-win32-nt-4\', 'SP_PATH', SP_PATH) then
    Result := SP_PATH + '\bin\spwin.exe'
  else if RegQueryStringValue(HKLM32, 'Software\SICS\SICStus4.1_x86-win32-nt-4\', 'SP_PATH', SP_PATH) then
    Result := SP_PATH + '\bin\spwin.exe'
  else if RegQueryStringValue(HKLM32, 'Software\SICS\SICStus4.0_win32\', 'SP_PATH', SP_PATH) then
    Result := SP_PATH + '\bin\spwin.exe'
  else
    Result := 'prolog_compiler_not_installed'
end;

function GetSP4ExePath(Param: String): String;
var
  Warning: String;
begin
  Result := SP4ExePath;
  if Result = 'prolog_compiler_not_installed' then
  begin
    Warning := 'Failed to detect SICStus Prolog 4 installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK);
  end
end;

function SWIConExePath: String;
var
  Home: String;
begin
  if RegQueryStringValue(HKLM, 'Software\SWI\Prolog64\', 'home', Home) then
    if FileExists(Home + '\bin\plcon.exe') then
      Result := Home + '\bin\plcon.exe'
    else if FileExists(Home + '\bin\swipl.exe') then
      Result := Home + '\bin\swipl.exe'
    else
      Result := 'prolog_compiler_not_installed'
  else
      Result := 'prolog_compiler_not_installed';
  if (Result = 'prolog_compiler_not_installed') and RegQueryStringValue(HKLM, 'Software\SWI\Prolog\', 'home', Home) then
    if FileExists(Home + '\bin\plcon.exe') then
      Result := Home + '\bin\plcon.exe'
    else if FileExists(Home + '\bin\swipl.exe') then
      Result := Home + '\bin\swipl.exe'
    else
      Result := 'prolog_compiler_not_installed'
end;

function GetSWIConExePath(Param: String): String;
var
  Warning: String;
begin
  Result := SWIConExePath;
  if Result = 'prolog_compiler_not_installed' then
  begin
    Warning := 'Failed to detect SWI-Prolog installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK)
  end
end;

function SWIWinExePath: String;
var
  Home: String;
begin
  if RegQueryStringValue(HKLM, 'Software\SWI\Prolog64\', 'home', Home) then
    if FileExists(Home + '\bin\plwin.exe') then
      Result := Home + '\bin\plwin.exe'
    else if FileExists(Home + '\bin\swipl-win.exe') then
      Result := Home + '\bin\swipl-win.exe'
    else
      Result := 'prolog_compiler_not_installed'
  else
      Result := 'prolog_compiler_not_installed';
  if (Result = 'prolog_compiler_not_installed') and RegQueryStringValue(HKLM, 'Software\SWI\Prolog\', 'home', Home) then
    if FileExists(Home + '\bin\plwin.exe') then
      Result := Home + '\bin\plwin.exe'
    else if FileExists(Home + '\bin\swipl-win.exe') then
      Result := Home + '\bin\swipl-win.exe'
    else
      Result := 'prolog_compiler_not_installed'
end;

function GetSWIWinExePath(Param: String): String;
var
  Warning: String;
begin
  Result := SWIWinExePath;
  if Result = 'prolog_compiler_not_installed' then
  begin
    Warning := 'Failed to detect SWI-Prolog installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK)
  end
end;

function XSBExePath: String;
var
  XSB_DIR: String;
begin
  if RegQueryStringValue(HKLM, 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment\', 'XSB_DIR', XSB_DIR) then
    Result := XSB_DIR + '\config\i686-pc-cygwin\bin\xsb.exe'
  else
    Result := 'prolog_compiler_not_installed'
end;

function GetXSBExePath(Param: String): String;
var
  Warning: String;
begin
  Result := XSBExePath;
  if Result = 'prolog_compiler_not_installed' then
  begin
    Warning := 'Failed to detect XSB installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK);
  end
end;

function XSBMTExePath: String;
var
  XSB_DIR: String;
begin
  if RegQueryStringValue(HKLM, 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment\', 'XSB_DIR', XSB_DIR) then
    Result := XSB_DIR + '\config\i686-pc-cygwin-mt\bin\xsb.exe'
  else
    Result := 'prolog_compiler_not_installed'
end;

function GetXSBMTExePath(Param: String): String;
var
  Warning: String;
begin
  Result := XSBMTExePath;
  if Result = 'prolog_compiler_not_installed' then
  begin
    Warning := 'Failed to detect XSB-MT installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK);
  end
end;

function YAPExePath: String;
var
  Home: String;
begin
  if RegQueryStringValue(HKLM, 'Software\YAP\Prolog\', 'home', Home) then
    Result := Home + '\bin\yap.exe'
  else
    Result := 'prolog_compiler_not_installed'
end;

function GetYAPExePath(Param: String): String;
var
  Warning: String;
begin
  Result := YAPExePath;
  if Result = 'prolog_compiler_not_installed' then
  begin
    Warning := 'Failed to detect YAP installation.' + Chr(13) + 'Logtalk integration shortcut not created.';
	MsgBox(Warning, mbError, MB_OK);
  end
end;

function NoBackEndPrologCompilerInstalled: Boolean;
begin
    Result :=
      (BPExePath = 'prolog_compiler_not_installed') and
      (CxExePath = 'prolog_compiler_not_installed') and
      (Eclipse6ExePath = 'prolog_compiler_not_installed') and
      (GPExePath = 'prolog_compiler_not_installed') and
      (SP3ExePath = 'prolog_compiler_not_installed') and
      (SP4ExePath = 'prolog_compiler_not_installed') and
      (SWIConExePath = 'prolog_compiler_not_installed') and
      (SWIWinExePath = 'prolog_compiler_not_installed') and
      (XSBExePath = 'prolog_compiler_not_installed') and
      (XSBMTExePath = 'prolog_compiler_not_installed') and
      (YAPExePath = 'prolog_compiler_not_installed')
end;

procedure InitializeWizard;
var
  Version, InstalledVersion: Cardinal;
  LOGTALKHOME, LOGTALKUSER: String;
begin
  Explanation := 'Select the folder in which Setup should install Logtalk user files, then click Next.'
                 + Chr(13) + Chr(13)
                 + 'These files allows each user to independently customize Logtalk and to freely modify the provided libraries, programming examples, and other supporting files.'
                 + Chr(13) + Chr(13)
                 + 'A copy of these files must exist in the user home folder in order to use the Logtalk-Prolog integration scripts available from the Start Menu program group "Logtalk".'
                 + Chr(13) + Chr(13)
                 + 'Addtional end-users may use this installer to make a copy of these files on their home folders after a full installation of Logtalk.';
  LgtUserDirPage := CreateInputDirPage(wpSelectDir,
    'Select folder for Logtalk user files', 'Where should Logtalk user files be installed?',
    Explanation,
    False, 'New Folder');
  LgtUserDirPage.Add('');
  if RegQueryStringValue(HKCU, 'Environment', 'LOGTALKUSER', LOGTALKUSER) then
    LgtUserDirPage.Values[0] := LOGTALKUSER
  else 
    LgtUserDirPage.Values[0] := ExpandConstant('{userdocs}') + '\Logtalk';
  if not IsAdminLoggedOn and RegQueryDWordValue(HKLM, 'Software\Logtalk', 'Version', Version) then
  begin
    Warning := 'You are running this installer from a non-administrative account.'
               + Chr(13) + Chr(13)
               + 'The base Logtalk system is already installed by an administrator. You may simply setup Logtalk for you as an end-user by choosing to install only the user-level files. In alternative, you may perform a full installation.'
               + Chr(13) + Chr(13)
               + 'If Logtalk is already set for you, this installer will make a backup copy of your current files (if you choose the same installation folder) and will restore all user files to their default, pristine state.';
    WarningPage := CreateOutputMsgPage(wpWelcome, 'Information', 'Please read the following important information before continuing.', Warning);
  end;
  if RegQueryDWordValue(HKCU, 'Software\Logtalk', 'Version', Version) then
    InstalledVersion := Version
  else if RegQueryDWordValue(HKLM, 'Software\Logtalk', 'Version', Version) then
    InstalledVersion := Version
  else if RegQueryStringValue(HKCU, 'Environment', 'LOGTALKHOME', LOGTALKHOME) and DirExists(LOGTALKHOME) then
    InstalledVersion := 0
  else if RegQueryStringValue(HKLM, 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment', 'LOGTALKHOME', LOGTALKHOME) and DirExists(LOGTALKHOME) then
    InstalledVersion := 0
  else
    InstalledVersion := -1;
  if (InstalledVersion >= 0) and (InstalledVersion < 2430) then
  begin
    Warning := 'Your Logtalk user directory is outdated!'
               + Chr(13) + Chr(13)
               + 'You must updade your Logtalk user folder by performing a full installation.'
               + Chr(13) + Chr(13)
               + 'All aditional Logtalk users on your computer must also use this installer to update their Logtalk user folders.';
    WarningPage := CreateOutputMsgPage(wpWelcome, 'Warning', 'Logtalk user folder update required.', Warning)
  end;
  if NoBackEndPrologCompilerInstalled then
  begin
    Error := 'No compatible Prolog compiler found!'
             + Chr(13) + Chr(13)
             + 'Logtalk requires a compatible Prolog compiler to be installed in order to run. Logtalk uses a Prolog compiler as a back-end compiler.'
             + Chr(13) + Chr(13)
             + 'You must rerun the Logtalk installer after installing a compatible Prolog compiler.';
    ErrorPage := CreateOutputMsgPage(wpSelectDir, 'Warning', 'No compatible Prolog compiler found!', Error)
  end
end;
