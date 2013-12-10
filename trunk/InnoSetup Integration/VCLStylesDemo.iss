; -- Example1.iss --
; Demonstrates copying 3 files and creating an icon.

; SEE THE DOCUMENTATION FOR DETAILS ON CREATING .ISS SCRIPT FILES!

[Setup]
AppName=VCL Styles Example
AppVerName=VCL Styles Example v1.0
AppVersion=1.0.0.0
AppCopyright=The Road To Delphi
DefaultDirName={pf}\The Road To Delphi\VCL Styles Inno
DefaultGroupName=The Road To Delphi
Compression=lzma
;Compression=none
SolidCompression=true
WizardImageFile=images\WizModernImage-IS_Green.bmp
WizardSmallImageFile=images\WizModernSmallImage-IS_Green.bmp
OutputDir=.\Output
OutputBaseFilename=Setup
VersionInfoVersion=1.0.0.0
VersionInfoCompany=The Road To Delphi
VersionInfoDescription=VCL Styles Setup
VersionInfoTextVersion=1, 0, 0, 0
;#define VCLStylesPath "{localappdata}\VCLStylesPath"
InternalCompressLevel=max

[Files]
Source: Win32\Release\VclStylesinno.dll; DestDir: {app}; Flags: dontcopy
Source: ..\Styles\Amakrits.vsf; DestDir: {app}; Flags: dontcopy

[Icons]
Name: {group}\Uninstall =ISSkin; Filename: {app}\unins000.exe

[Code]
// Import the LoadVCLStyle function from VclStylesInno.DLL
procedure LoadVCLStyle(VClStyleFile: String); external 'LoadVCLStyleW@files:VclStylesInno.dll stdcall';
// Import the UnLoadVCLStyles function from VclStylesInno.DLL
procedure UnLoadVCLStyles; external 'UnLoadVCLStyles@files:VclStylesInno.dll stdcall';

function InitializeSetup(): Boolean;
begin
	ExtractTemporaryFile('Amakrits.vsf');
	LoadVCLStyle(ExpandConstant('{tmp}\Amakrits.vsf'));
	Result := True;
end;

procedure DeinitializeSetup();
begin
	UnLoadVCLStyles;
end;
