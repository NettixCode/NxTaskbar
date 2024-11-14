program NxTaskbarSm;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  TlHelp32,
  System.SysUtils,
  Winapi.Windows,
  Vcl.Dialogs,
  StartMenu1 in 'Forms\StartMenu1.pas' {StartMenu1Form},
  WinDialogs in 'Include\WinDialogs.pas',
  StartMenu2 in 'Forms\StartMenu2.pas' {StartMenu2Form};

function ProcessRunning(const ExeName: String): Integer;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle:= CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize:= SizeOf(FProcessEntry32);
  ContinueLoop:= Process32First(FSnapshotHandle, FProcessEntry32);
  Result:= 0;
  while Integer(ContinueLoop) <> 0 do begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeName))) then Inc(Result);
    ContinueLoop:= Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

//procedure ReplaceStartBtn;
//begin
//  SB := FindWindowEx(FindWindow ('Shell_TrayWnd', nil), 0, 'Start', nil);
//  ShowWindow(SB,SW_HIDE);
//  ShowWindow(FindWindowEx(FindWindow ('Shell_TrayWnd', nil), 0, 'TrayButton', nil),SW_HIDE);
//  EnableWindow(SB,False);
//  EnableWindow(FindWindowEx(FindWindow ('Shell_TrayWnd', nil), 0, 'TrayButton', nil),False);
//  GetWindowRect(SB,TSB);
//  SetWindowPos(SB,HWND_BOTTOM,0,0,0,30,SW_ERASE);
//  SetWindowPos(FindWindowEx(FindWindow ('Shell_TrayWnd', nil), 0, 'TrayButton', nil),HWND_BOTTOM,0,0,0,30,SW_ERASE);
//
//  TB := FindWindowEx (FindWindow ('Shell_TrayWnd', nil), 0, 'ReBarWindow32', nil);
//  GetWindowRect(TB,TTB);
//
//  if TSB.Width > 0 then begin
//    SetWindowPos(TB,WS_EX_LEFT or WS_EX_LTRREADING,0,0,TTB.Width + TSB.Width,30,SW_ERASE);
//    SetWindowPos(FindWindowEx (FindWindow ('ReBarWindow32', nil), 0, 'MSTaskSwWClass', nil),
//    WS_EX_LEFT or WS_EX_LTRREADING,0,0,TTB.Width + TSB.Width,30,SW_ERASE);
//    SetWindowPos(FindWindowEx (FindWindow ('MSTaskSwWClass', nil), 0, 'MSTaskListWClass', nil),
//    WS_EX_LEFT or WS_EX_LTRREADING,0,0,TTB.Width + TSB.Width,30,SW_ERASE);
//  end else begin
//    SetWindowPos(TB,WS_EX_LEFT or WS_EX_LTRREADING,0,0,TTB.Width,30,SW_ERASE);
//    SetWindowPos(FindWindowEx (FindWindow ('ReBarWindow32', nil), 0, 'MSTaskSwWClass', nil),
//    WS_EX_LEFT or WS_EX_LTRREADING,0,0,TTB.Width,30,SW_ERASE);
//    SetWindowPos(FindWindowEx (FindWindow ('MSTaskSwWClass', nil), 0, 'MSTaskListWClass', nil),
//    WS_EX_LEFT or WS_EX_LTRREADING,0,0,TTB.Width,30,SW_ERASE);
//  end;
//end;


{$R *.res}

begin
  if ProcessRunning(ExtractFileName(Application.ExeName)) > 1 then begin
//    ShowMessage('application already running');
    Application.Terminate;
  end else begin
    Application.Initialize;
    Application.MainFormOnTaskbar := False;
    if ParamStr(1) = '1' then begin
      Application.CreateForm(TStartMenu1Form, StartMenu1Form);
  end else
    if ParamStr(1) = '2' then begin
      Application.CreateForm(TStartMenu2Form, StartMenu2Form);
    end else
    if ParamStr(1) = '3' then begin
      Application.CreateForm(TStartMenu3Form, StartMenu3Form);
    end;
  //    ReplaceStartBtn;
    ShowWindow(Application.Handle,SW_HIDE);
    Application.Run;
  end;
end.
