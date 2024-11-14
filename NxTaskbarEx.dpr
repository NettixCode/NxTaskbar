program NxTaskbarEx;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  Windows,
  NxTaskbarExMain in 'Forms\NxTaskbarExMain.pas' {NxTaskbarExMainForm};

{$R *.res}

procedure DisableProcessWindowsGhosting;
var
  DisableProcessWindowsGhostingProc: procedure;
begin
  DisableProcessWindowsGhostingProc := GetProcAddress(GetModuleHandle('user32.dll'), 'DisableProcessWindowsGhosting');
  if Assigned(DisableProcessWindowsGhostingProc) then
    DisableProcessWindowsGhostingProc;
end;

begin
  DisableProcessWindowsGhosting;
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  Application.ShowMainForm := False;
  Application.CreateForm(TNxTaskbarExMainForm, NxTaskbarExMainForm);
  Application.Run;
end.
