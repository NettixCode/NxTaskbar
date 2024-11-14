library NxTaskbarLib;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  FastMM4,
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Windows,
  Forms,
  Dialogs,
  SysUtils,
  Messages,
  ShellAPI,
  Classes,
  TlHelp32,
  Graphics,
  UIConsts,
  Taskbar in 'Include\Taskbar.pas' {Taskbars},
  Handle in 'Forms\Handle.pas' {HandleForm},
  StartOrb in 'Forms\StartOrb.pas' {StartOrbForm},
  PowerOption in 'Forms\PowerOption.pas' {PowerOptionForm},
  TaskbarLayout in 'Forms\TaskbarLayout.pas' {TaskbarLayoutForm};

const
  WH_MOUSE_LL      =   14;
  WH_KEYBOARD_LL   =   13;
  LLKHF_ALTDOWN    =   $00000020;
  LLKHF_INJECTED   =   $00000010;

  CM_COLORUPDATE = WM_USER + 1984; // Custom Message...
  WCA_ACCENT_POLICY = 19;
  ACCENT_DISABLED = 0;
  ACCENT_ENABLE_GRADIENT = 1;
  ACCENT_ENABLE_TRANSPARENTGRADIENT = 2;
  ACCENT_ENABLE_BLURBEHIND = 3;
  ACCENT_ENABLE_ACRYLICBLURBEHIND = 4;

type
  MouseLLHookStruct = record
    pt          : TPoint;
    mouseData   : cardinal;
    flags       : cardinal;
    time        : cardinal;
    dwExtraInfo : cardinal;
  end;

type
  tagKBDLLHOOKSTRUCT = record
    vkCode      : DWORD;
    scanCode    : DWORD;
    flags       : DWORD;
    time        : DWORD;
    dwExtraInfo : DWORD;
  end;
  KBDLLHOOKSTRUCT   = tagKBDLLHOOKSTRUCT;
  LPKBDLLHOOKSTRUCT = ^KBDLLHOOKSTRUCT;
  PKBDLLHOOKSTRUCT  = ^KBDLLHOOKSTRUCT;

  AccentPolicy = packed record
    AccentState: Integer;
    AccentFlags: Integer;
    GradientColor: Integer;
    AnimationId: Integer;
  end;

  WindowCompositionAttributeData = packed record
    Attribute: Cardinal;
    Data: Pointer;
    SizeOfData: Integer;
  end;

//  TWinCompAttrData = packed record
//    attribute: THandle;
//    pData: Pointer;
//    dataSize: ULONG;
//  end;

  function SetWindowCompositionAttribute(hWnd: HWND; var data: WindowCompositionAttributeData): Integer; stdcall;
    external User32 name 'SetWindowCompositionAttribute';

var
  Taskbars          : TTaskbars;
  mHook             : cardinal;
  IsCustomStartOrb,
  IsCustomStartMenu,
  IsDisableWinKey,
  IsTBTransparent   : Boolean;
  hhkLowLevelKybd   : HHOOK;
  LwinHooked        : Boolean = False;
  OrbClick          : Boolean = False;
  CStartMenuSh      : Boolean = False;
//  SetWindowCompositionAttributes: function (Wnd: HWND; const AttrData: TWinCompAttrData): BOOL; stdcall = Nil;

{$R *.res}


//procedure TaskbarChangeColor(col : Tcolor); Stdcall;
//var
//  accent: AccentPolicy;
//  dwm10: THandle;
//  dataBlur : TWinCompAttrData;
//  data: WindowCompositionAttributeData;
//  I : Integer;
//begin
//  for I := 0 to Taskbars.Count - 1 do begin
////    if Blur then begin
////        dwm10 := LoadLibrary('user32.dll');
////        try
////          @SetWindowCompositionAttributes := GetProcAddress(dwm10, 'SetWindowCompositionAttribute');
////          if @SetWindowCompositionAttributes <> nil then
////          begin
////            accent.AccentState := ACCENT_ENABLE_BLURBEHIND ;
////            accent.AccentFlags := $20 or $40 or $80 or $100;
////            dataBlur.Attribute := WCA_ACCENT_POLICY;
////            dataBlur.dataSize := SizeOf(accent);
////            dataBlur.pData := @accent;
////            SetWindowCompositionAttributes(Taskbars.Items[I].Handle, dataBlur);
////          end
////          else
////          begin
////            ShowMessage('Not found Windows 10 blur API');
////          end;
////        finally
////          FreeLibrary(dwm10);
////        end;
////      accent.AccentState := ACCENT_ENABLE_BLURBEHIND
////      accent.AccentFlags := $20 or $40 or $80 or $100;
////      data.Attribute := WCA_ACCENT_POLICY;
////      data.SizeOfData := SizeOf(accent);
////      data.Data := @accent;
////      SetWindowCompositionAttribute(Taskbars.Items[I].Handle, data);
////    end else begin
////      else
//      accent.AccentState := ACCENT_ENABLE_TRANSPARENTGRADIENT;
//      accent.GradientColor := col;
//      accent.AccentFlags := $20 or $40 or $80 or $100;
//      data.Attribute := WCA_ACCENT_POLICY;
//      data.SizeOfData := SizeOf(accent);
//      data.Data := @accent;
//      SetWindowCompositionAttribute(Taskbars.Items[I].Handle, data);
////    end;
//  end;
//end;

function processExists(exeFileName: string): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;
  try
    while Integer(ContinueLoop) <> 0 do
    begin
      if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
        UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
        UpperCase(ExeFileName))) then
      begin
        Result := True;
      end;
      ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
    end;
  finally
    CloseHandle(FSnapshotHandle);
  end;
end;

function KillTask(ExeFileName: string): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  try
    while Integer(ContinueLoop) <> 0 do
    begin
      if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
        UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
        UpperCase(ExeFileName))) then
        Result := Integer(TerminateProcess(
                          OpenProcess(PROCESS_TERMINATE,
                                      BOOL(0),
                                      FProcessEntry32.th32ProcessID),
                                      0));
       ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
    end;
  finally
    CloseHandle(FSnapshotHandle);
  end;
end;

procedure UpdateTBColorization(Colorz : TColor;Alpha,Mode : integer);stdcall;
var
  I : Integer;
begin
  for I := 0 to Taskbars.Count - 1 do begin
    if FindWindow('NxTaskbarLayout','NxTBLayout') <> 0 then begin
//      Taskbars.RestoreOpacity(Taskbars.Items[i].Handle);
      TaskbarLayoutForm.UpdateColorization(Colorz,Alpha,Mode);
      Taskbars.Refresh;
    end;
  end;
end;

procedure SetVarStartOrb(vars : Boolean); stdcall;
begin
  IsCustomStartOrb := vars;
end;

procedure SetVarStartMenu(vars : Boolean); stdcall;
begin
  IsCustomStartMenu := vars;
end;

procedure SetVarDisableWinKey(vars : Boolean); stdcall;
begin
  IsDisableWinKey := vars;
end;

procedure SetVarTBTransparent(vars : Boolean); stdcall;
begin
  IsTBTransparent := vars;
end;

procedure CreateHandleForm;
begin
  if FindWindow('THandleForm',nil) = 0 then begin
    HandleForm := THandleForm.Create(nil);
    HandleForm.Show;
    HandleForm.Visible := False;
  end;
end;

procedure CloseHandleForm; stdcall;
begin
  if FindWindow('THandleForm',nil) <> 0 then
    HandleForm.Destroy;
end;

procedure ShowStartButton(Command : Integer); stdcall;
var
  S : HWND;
  I : Integer;
begin
  for I := 0 to Taskbars.Count - 1 do begin
  ShowWindow(0, SW_HIDE);
  S := Taskbars.Items[I].StartButton.Handle;
  if S <> 0 then
    ShowWindow(S,Command);
  end;
end;

procedure EnableStartButton(Option : Boolean); stdcall;
var
  S : HWND;
  I : Integer;
begin
  for I := 0 to Taskbars.Count - 1 do begin
  ShowWindow(0, SW_HIDE);
  S := Taskbars.Items[I].StartButton.Handle;
  if S <> 0 then
    EnableWindow(S,Option);
  end;
end;

procedure ChangeNxStartOrb(path : string); stdcall;
begin
  StartOrbForm.StartOrbs.Picture.LoadFromFile(path);
end;

procedure ShowNxStartOrb; stdcall;
var
  I : Integer;
begin
  for I := 0 to Taskbars.Count - 1 do begin
//  if FindWindow('TStartOrbForm',nil) = 0 then begin
    if FindWindowEx(Taskbars.Items[I].Handle,0,'NxStart','Start') = 0 then begin
      StartOrbForm := TStartOrbForm.Create(nil);
      StartOrbForm.Show;
    end;
  end;
end;

procedure CloseNxStartOrb; stdcall;
var
  I : Integer;
begin
  for I := 0 to Taskbars.Count - 1 do begin
    if FindWindowEx(Taskbars.Items[I].Handle,0,'NxStart','Start') <> 0 then begin
      StartOrbForm.Destroy;
    end;
  end;
end;

procedure ShowNxStartMenu; stdcall;
begin
//  if FindWindow('TStartMenuForm',nil) = 0 then begin
//    StartMenuForm := TStartMenuForm.Create(nil);
//    StartMenuForm.Show;
//  end;
  if not processExists('NxTaskbarSm.exe') then
    ShellExecute(0,
    'open',
    PChar(ExtractFilePath(Application.ExeName) + 'NxTaskbarSm.exe'),
    '2',
    nil,
    SW_SHOWNORMAL);
end;

procedure CloseNxStartMenu; stdcall;
begin
  if processExists('NxTaskbarSm.exe') then
    KillTask('NxTaskbarSm.exe');
//  if FindWindow('TStartMenuForm',nil) <> 0 then
//    StartMenuForm.Close;
end;

procedure ShowNxPowerOption; stdcall;
begin
  if FindWindow('TPowerOptionForm',nil) = 0 then  begin
    PowerOptionForm := TPowerOptionForm.Create(nil);
    PowerOptionForm.Show;
    PO_CustomStartMenuActive := isDisableWinKey;
  end;
end;

procedure CloseNxPowerOption; stdcall;
begin
  if FindWindow('TPowerOptionForm',nil) <> 0 then begin
    PowerOptionForm.Destroy;
  end;
end;

procedure CenterTaskbarAppsButton(Centers,Relatives : Boolean);stdcall;
begin
  Taskbars.CenterAppsButtons(centers,Relatives);
end;

procedure SetTBTrans(Active : Boolean);stdcall;
begin
  if Active then begin
    if not IsTBTransparent then
      Taskbars.Transparent(Active);
  end else begin
    if IsTBTransparent then
    Taskbars.RestoreOpacity(HandleForm.Handle);
  end;
end;

procedure TBSmallIcon(Active : Boolean);stdcall;
begin
  if Taskbars.SmallIcons <> Active then
    Taskbars.SmallIcons := Active;
end;

//function TBsizeIsSmall : Boolean; stdcall;
//begin
//  Result := Taskbars.SmallIcons;
//end;
//
procedure ChangeNxTaskbarLayout(path : string); stdcall;
begin
  TaskbarLayoutForm.LayoutImage.Picture.LoadFromFile(path);
end;

procedure ShowNxTaskbarLayout; stdcall;
var
  I : Integer;
begin
  for I := 0 to Taskbars.Count - 1 do begin
    if FindWindow('NxTaskbarLayout','NxTBLayout') = 0 then begin
      TaskbarLayoutForm := TTaskbarLayoutForm.Create(nil);
      TaskbarLayoutForm.Show;
    end;
  end;
end;

procedure CloseNxTaskbarLayout; stdcall;
var
  I : Integer;
begin
  for I := 0 to Taskbars.Count - 1 do begin
    if FindWindow('NxTaskbarLayout','NxTBLayout') <> 0 then begin
      TaskbarLayoutForm.Destroy;
//      Taskbars.RestoreOpacity(Taskbars.Items[i].Handle);
    end;
  end;
end;

function LowLevelMouseHookProc(nCode, wParam, lParam : integer) : integer; stdcall;
var
  info            : ^MouseLLHookStruct absolute lParam;
  CB {SMHandle}    : HWND;
  CBrect{SMRect}   : TRect;
  I               : Integer;
begin
  for I := 0 to Taskbars.Count -1 do begin
    CB := FindWindowEx(Taskbars.Items[I].Handle,0,'NxStart','Start');
//    SMHandle := FindWindowEx(0,0,'TStartMenuForm',nil);
//    GetWindowRect(CB,CBrect);
//    GetWindowRect(SMHandle,SMRect);

    result := CallNextHookEx(mHook, nCode, wParam, lParam);
    with info^ do begin
      if CB <> 0 then begin
        if (pt.x >= Taskbars.Items[I].StartRect.Left)
        and (pt.x <= Taskbars.Items[I].StartRect.Right)
        and (pt.y >= Taskbars.Items[I].StartRect.Top)
        and (pt.y <= Taskbars.Items[I].StartRect.Bottom)
        then begin
          StartOrbForm.StartOrbs.Hint := 'Start';
          StartOrbForm.StartOrbs.ShowHint := True;
          if isCustomStartOrb then begin
            if OrbClick then
              StartOrbForm.StartOrbs.Top := ClickTOP
            else
              StartOrbForm.StartOrbs.Top := HoverTOP;
          end;
        end else begin
          if isCustomStartOrb then begin
            if OrbClick then
              StartOrbForm.StartOrbs.Top := ClickTOP
            else
              StartOrbForm.StartOrbs.Top := NormalTOP;
          end;
        end;
      end;

      case wParam of
        wm_lbuttondown   : begin  // LEFT CLICK
          if ((pt.x >= Taskbars.Items[I].StartRect.Left)
          and (pt.x <= Taskbars.Items[I].StartRect.Right)
          and (pt.y >= Taskbars.Items[I].StartRect.Top)
          and (pt.y <= Taskbars.Items[I].StartRect.Bottom)) {or
                    ((pt.x >= CBrect.Left)
                              and (pt.x <= CBrect.Right)
                                        and (pt.y >= CBrect.Top)
                                                  and (pt.y <= CBrect.Bottom))}
          then begin
            if (isCustomStartOrb) and (IsCustomStartMenu) then begin
  //            ShellExecute(0, 'open', PChar('D:\PROJECT\D10STARTMENU\Win32\Debug\StartMenu.exe'), nil, nil, SW_SHOWNORMAL);
              ShowNxStartMenu;// else CloseNxStartMenu;
//              if SMHandle <> 0 then CloseNxStartMenu;
              if OrbClick = False then begin
                StartOrbForm.StartOrbs.Top := ClickTOP;
                OrbClick := True;
              end else
              if OrbClick = True then begin
                StartOrbForm.StartOrbs.Top := HoverTOP;
                OrbClick := False;
              end;
            end else
            if (not isCustomStartOrb) and (IsCustomStartMenu) then begin
              ShowNxStartMenu;// else CloseNxStartMenu;
  //            if SMHandle <> 0 then CloseNxStartMenu;
              EnableStartButton(False);
  //            ShellExecute(0, 'open', PChar('D:\PROJECT\D10STARTMENU\Win32\Debug\StartMenu.exe'), nil, nil, SW_SHOWNORMAL);
            end else
            if (isCustomStartOrb) and (not IsCustomStartMenu) then begin
              if OrbClick = False then begin
                StartOrbForm.StartOrbs.Top := ClickTOP;
                OrbClick := True;
              end else
              if OrbClick = True then begin
                StartOrbForm.StartOrbs.Top := HoverTOP;
                OrbClick := False;
              end;
              if not IsDisableWinKey then begin
//                SendMessageTimeout(HandleForm.Handle,WM_SYSCOMMAND,SC_TASKLIST,0,SMTO_ABORTIFHUNG, 3000, 0);
//                SendMessage(HandleForm.Handle, WM_SYSCOMMAND, SC_TASKLIST, 0);
                keybd_event(VK_LWIN, 0, 0, 0);
                keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, 0);
              end;
            end;
//          end else begin
//            if isCustomStartOrb then begin
//              StartOrbForm.StartOrbs.Top := NormalTOP;
//              if OrbClick then OrbClick := False;
//            end;
//            if SMHandle <> 0 then
//            if (pt.x < StartMenuForm.Left)
//            or (pt.x > StartMenuForm.left + StartMenuForm.Width)
//            or (pt.y < StartMenuForm.Top)
//            or (pt.y > StartMenuForm.Top + StartMenuForm.Height)
//            then begin
//              CloseNxStartMenu;
//            end;
          end;
        end;
        wm_lbuttonup : begin
          if (pt.x >= Taskbars.Items[I].StartRect.Left)
          and (pt.x <= Taskbars.Items[I].StartRect.Right)
          and (pt.y >= Taskbars.Items[I].StartRect.Top)
          and (pt.y <= Taskbars.Items[I].StartRect.Bottom) then begin
            if (not isCustomStartOrb) and (IsCustomStartMenu) then begin
              EnableStartButton(True);
            end;
            if isCustomStartOrb then begin
              if OrbClick then
                StartOrbForm.StartOrbs.Top := ClickTOP
                else
                StartOrbForm.StartOrbs.Top := HoverTOP;
            end;
          end else begin
            if isCustomStartOrb then begin
              if OrbClick then
                StartOrbForm.StartOrbs.Top := ClickTOP
                else
                StartOrbForm.StartOrbs.Top := NormalTOP;
            end;
          end;
        end;
  //      wm_mbuttondown   : begin
  //        if (pt.x >= R.Left)
  //        and (pt.x <= R.Right)
  //        and (pt.y >= R.Top)
  //        and (pt.y <= R.Bottom) then
  //          ShowMessage('Start Click');
  //      end;
        wm_rbuttondown : begin
          if (pt.x >= Taskbars.Items[I].StartRect.Left)
          and (pt.x <= Taskbars.Items[I].StartRect.Right)
          and (pt.y >= Taskbars.Items[I].StartRect.Top)
          and (pt.y <= Taskbars.Items[I].StartRect.Bottom) then begin
            if isCustomStartOrb then begin
              keybd_event(VK_LWIN, 0, 0, 0);
              keybd_event(Ord('X'), 0, 0, 0);
              keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, 0);
            end;
          end;
        end;
//        wm_rbuttondown   : begin
  //        if (pt.x >= R.Left)
  //        and (pt.x <= R.Right)
  //        and (pt.y >= R.Top)
  //        and (pt.y <= R.Bottom) then
  //          ShowMessage('Start Click');
//            if SMHandle <> 0 then
//            if (pt.x < StartMenuForm.Left)
//            or (pt.x > StartMenuForm.left + StartMenuForm.Width)
//            or (pt.y < StartMenuForm.Top)
//            or (pt.y > StartMenuForm.Top + StartMenuForm.Height)
//            then begin
//              CloseNxStartMenu;
//            end;
//        end;
      end;
    end;
  end;
end;

procedure ActiveMouseHook(Active: Boolean); stdcall;
begin
  if Active then
    mHook := SetWindowsHookEx(WH_MOUSE_LL, @LowLevelMouseHookProc, hInstance, 0)
  else
    UnhookWindowsHookEx(mHook);
end;

procedure ScheduleRunAtStartup(const ATaskName: string; const AFileName: string;
const Active: Boolean); stdcall;
var
  R : integer;
begin
  if Active then begin
    HandleForm.schTMP.Clear;
    HandleForm.schTMP.lines.assign(HandleForm.schXML.lines);
    R := Pos('EXEPATH', HandleForm.schTMP.Lines.Text);
    if R > 0 then
    begin
    ShellExecute(0, nil, 'schtasks', PChar('/delete /f /tn "' + ATaskName + '"'),
      nil, SW_HIDE);
      try
      HandleForm.schTMP.SelStart := R - 1;
      HandleForm.schTMP.SelLength := Length('EXEPATH');
      HandleForm.schTMP.SelText := ExtractFilePath(Application.ExeName)+'NxTaskbarEx.exe';
      HandleForm.schTMP.Lines.SaveToFile(ExtractFilePath(Application.ExeName)+'NxTaskbar.xml');
      finally
        ShellExecute(0, nil, 'schtasks', PChar('/create /tn "' + ATaskName + '" /XML "' + AFileName + '"'),
          nil, SW_HIDE);
        HandleForm.TimerDeleteXML.Enabled := True;
      end;
    end;
//    ShellExecute(0, nil, 'schtasks', PChar('/delete /f /tn "' + ATaskName + '"'),
//      nil, SW_HIDE);
//    ShellExecute(0, nil, 'schtasks', PChar('/create /tn "' + ATaskName + '" ' +
//      '/tr "' + AFileName + '" /rl HIGHEST /sc ONLOGON'),
//      nil, SW_HIDE);
  end else begin
    ShellExecute(0, nil, 'schtasks', PChar('/delete /f /tn "' + ATaskName + '"'),
      nil, SW_HIDE);
  end;
end;

function LowLevelKeyBoardProc(nCode:Integer;awParam:WPARAM;alParam:LPARAM):LRESULT;stdcall;
var
  fEatKeyStroke : Boolean;
  p : PKBDLLHOOKSTRUCT;
  SM : HWND;
begin
  fEatKeystroke := False;
  SM := FindWindow('TStartMenuForm',nil);
  if(nCode = HC_ACTION) then
  begin
    case awParam of
      WM_KEYDOWN,
      WM_SYSKEYDOWN,
      WM_KEYUP,
      WM_SYSKEYUP:
      begin
        p   :=   PKBDLLHOOKSTRUCT(alParam);
        if LwinHooked then
        begin
          if p^.vkCode = VK_LWIN then
          begin
            fEatKeystroke   :=   True;
            if Taskbars.IsStartMenuVisible then
              SendMessage(Taskbars.MainTaskbar.Handle, WM_SYSCOMMAND, SC_TASKLIST, 0);
//            if SM = 0 then ShowNxStartMenu;
            ShowNxStartMenu;
            if IsCustomStartOrb then StartOrbForm.StartOrbs.Top := ClickTOP;
          end;
        end;
      end;
    end;
  end;
  if fEatKeyStroke then
    Result := 1
  else
    Result := CallNextHookEx(hhkLowLevelKybd, nCode, awParam, alParam);
end;

procedure ActiveKeyboardHook(Active : Boolean); stdcall;
begin
  if Active then begin
    try
      if hhkLowLevelKybd <> 0 then exit;
      hhkLowLevelKybd := SetWindowsHookEx(WH_KEYBOARD_LL, @LowLevelKeyboardProc,   hInstance,   0);
    finally
      LwinHooked := True;
    end;
  end else begin
    try
      if LwinHooked then begin
        if hhkLowLevelKybd = 0 then exit;
        UnhookWindowsHookEx(hhkLowLevelKybd);
        hhkLowLevelKybd := 0;
      end;
    finally
      LwinHooked := False;
    end;
  end;
end;

procedure TaskbarInit; stdcall;
begin
  Taskbars := TTaskbars.Create;
  Taskbars.Refresh;
  Taskbars.UpdateTaskbarInfo;
end;

procedure RefreshTaskbar; stdcall;
begin
  Taskbars.Refresh;
end;

procedure UpdateTBRuntime;
begin
  Taskbars.UpdateTaskbarInfo;
end;

procedure ShutDownAllService;stdcall;
begin
    Taskbars.RestoreOpacity(Taskbars.MainTaskbar.Handle);
    SetTBTrans(False);
    ActiveMouseHook(False);
    ActiveKeyboardHook(False);
    CloseNxStartOrb;
    CloseNxStartMenu;
    CloseNxTaskbarLayout;
    ShowStartButton(SW_SHOW);
    EnableStartButton(True);
    CloseNxPowerOption;
    CenterTaskbarAppsButton(False,False);
    CloseHandleForm;
    Taskbars.Free;
end;

exports
//  TaskbarChangeColor,
  UpdateTBColorization,
  SetVarStartOrb,
  SetVarStartMenu,
  SetVarDisableWinKey,
  SetVarTBTransparent,
  ActiveMouseHook,
  ActiveKeyboardHook,
  CloseHandleForm,
  ShowStartButton,
  EnableStartButton,
  ChangeNxStartOrb,
  ShowNxStartOrb,
  CloseNxStartOrb,
  ShowNxPowerOption,
  CloseNxPowerOption,
  CenterTaskbarAppsButton,
  ScheduleRunAtStartup,
  TaskbarInit,
  RefreshTaskbar,
  UpdateTBRuntime,
  SetTBTrans,
  TBSmallIcon,
//  TBsizeIsSmall,
  ChangeNxTaskbarLayout,
  ShowNxTaskbarLayout,
  CloseNxTaskbarLayout,
  ShutDownAllService;


begin
  CreateHandleForm;
  Application.Handle := HandleForm.Handle;
  Application.MainFormOnTaskBar := False;
  ShowWindow(Application.Handle,SW_HIDE);
  Application.ShowMainForm := False;

end.

