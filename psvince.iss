; Author: Vincenzo Giordano
; email: isxkb@vincenzo.net
;
; This script shows how to call psvince.dll and detect if a module
; is loaded in memory or not so you can detect if a program is running

[Setup]
AppName=PSVince
AppVerName=PSVince 1.0
DisableProgramGroupPage=true
DisableStartupPrompt=true
OutputDir=.
OutputBaseFilename=testpsvince
Uninstallable=false
DisableDirPage=true
DefaultDirName={pf}\PSVince

[Files]
Source: Release\psvince.dll; Flags: dontcopy

[Code]
function IsModuleLoaded2(modulename: AnsiString): Boolean;
external 'IsModuleLoaded2@files:psvince.dll stdcall';

function InitializeSetup(): Boolean;
begin
  Result := Not IsModuleLoaded2('screamer.exe');
end;
