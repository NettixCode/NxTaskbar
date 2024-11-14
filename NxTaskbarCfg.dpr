program NxTaskbarCfg;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Winapi.Windows,
  Vcl.Forms,
  ColorUtils in 'Include\ColorUtils.pas' {ColorUtils},
  NxTaskbarCfgMain in 'Forms\NxTaskbarCfgMain.pas' {NxTaskbarCfgMainForm};

{$R *.res}

begin
//  TStyleManager.TrySetStyle('Carbon');
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := False;
  Application.ShowMainForm := True;
  Application.CreateForm(TNxTaskbarCfgMainForm, NxTaskbarCfgMainForm);
  ShowWindow(Application.Handle, SW_HIDE);
  Application.Run;
end.
