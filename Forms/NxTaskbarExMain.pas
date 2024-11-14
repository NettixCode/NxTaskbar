unit NxTaskbarExMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.StrUtils,
  System.ImageList,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Dialogs,
  Vcl.ImgList,
  Vcl.Menus,
  IniFiles,
  DzTalkApp,
  TlHelp32,
  Registry,
  ShellAPI,
  UIConsts,
  madExceptVcl;
  {$R 'NxAdmin.RES' 'NxAdmin.RC'}

type
  TRecordData = packed record
    Number  : Integer;
    Text    : ShortString;
    Flag    : Boolean;
  end;

  TMARGINS = record
    leftWidth: integer;
    rightWidth: integer;
    topHeight: integer;
    bottomHeight: integer;
  end;

  TNxTaskbarExMainForm = class(TForm)
    TimerCheckTaskbarExist  : TTimer;
    TA: TDzTalkApp;
    IconList                : TImageList;
    TrayIcon                : TTrayIcon;
    PopupMenu               : TPopupMenu;
    OpenNxConfig            : TMenuItem;
    NxAbout                 : TMenuItem;
    NxDonate                : TMenuItem;
    NxExit                  : TMenuItem;
    TimerCheckExplorer      : TTimer;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    WinTaskbarSetting: TMenuItem;
    TimerCenter: TTimer;
    MadExceptionHandler: TMadExceptionHandler;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerCheckTaskbarExistTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TAMessage(Sender: TObject; From: HWND; ID: Word; P: Pointer;
      Size: Cardinal; var Result: Integer);
    procedure TrayIconClick(Sender: TObject);
    procedure NxExitClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure OpenNxConfigClick(Sender: TObject);
    procedure TimerCheckExplorerTimer(Sender: TObject);
    procedure WinTaskbarSettingClick(Sender: TObject);
    procedure TimerCenterTimer(Sender: TObject);
  private
    procedure WMQueryEndSession(var Msg : TWMQueryEndSession); message WM_QUERYENDSESSION;
    { Private declarations }
    procedure LoadINI;
  protected
   procedure WndProc(var Msg: TMessage); override;
    { Protected declarations }
  public
    { Public declarations }
  end;

var
  NxTaskbarExMainForm   : TNxTaskbarExMainForm;
  ChangeDetect          : Boolean = False;
  StartOrbImage,
  TBLayoutImage,
  TBCustomColor         : String;
  AppStart              : Boolean = False;
  CustomPowerOption,
  CustomStartOrb,
  CustomStartMenu,
  IsCenterTaskbarApps,
  IsCenterTaskbarAppsRelative,
  TBTransparent,
  DisableWinKey,
  isCustomTaskbar,
  CustomTaskbarLayout,
  CustomTaskbarColor,
//  IsTBSmallIcon,
  CustomTaskbarBlur,
  CustomTaskbarArcylic  : Boolean;
  LibHandle             : THandle;
//  isTaskbarSmall        : Integer = 0;
  fwm_TaskbarRestart    : cardinal;

implementation

uses ActiveX, Shlobj, ComObj;

function ShutdownBlockReasonCreate(hWnd: HWND; Reason: LPCWSTR): Bool; stdcall; external user32;
function ShutdownBlockReasonDestroy(hWnd: HWND): Bool; stdcall; external user32;
//procedure TaskbarChangeColor(col : Tcolor); stdcall;external 'NxTaskbarLib.dll';
procedure UpdateTBColorization(Colorz : TColor;Alpha,Mode : integer); stdcall;external 'NxTaskbarLib.dll';
procedure SetVarStartOrb(Vars:Boolean); stdcall;external 'NxTaskbarLib.dll';
procedure SetVarStartMenu(Vars:Boolean); stdcall;external 'NxTaskbarLib.dll';
procedure SetVarDisableWinKey(Vars:Boolean); stdcall;external 'NxTaskbarLib.dll';
procedure SetVarTBTransparent(Vars:Boolean); stdcall;external 'NxTaskbarLib.dll';
procedure ActiveMouseHook(Active:Boolean); stdcall;external 'NxTaskbarLib.dll';
procedure ActiveKeyboardHook(Active:Boolean); stdcall;external 'NxTaskbarLib.dll';
procedure CloseHandleForm; stdcall;external 'NxTaskbarLib.dll';
procedure ShowStartButton(Command:Integer); stdcall;external 'NxTaskbarLib.dll';
procedure EnableStartButton(Option:Boolean); stdcall;external 'NxTaskbarLib.dll';
procedure ChangeNxStartOrb(path:string); stdcall;external 'NxTaskbarLib.dll';
procedure ShowNxStartOrb; stdcall;external 'NxTaskbarLib.dll';
procedure CloseNxStartOrb; stdcall;external 'NxTaskbarLib.dll';
procedure ShowNxPowerOption; stdcall;external 'NxTaskbarLib.dll';
procedure CloseNxPowerOption; stdcall;external 'NxTaskbarLib.dll';
procedure CenterTaskbarAppsButton(Centers,Relatives : Boolean); stdcall;external 'NxTaskbarLib.dll';
procedure ScheduleRunAtStartup(const ATaskName: string; const AFileName: string;
const Active: Boolean); stdcall;external 'NxTaskbarLib.dll';
procedure TaskbarInit; stdcall;external 'NxTaskbarLib.dll';
procedure RefreshTaskbar; stdcall;external 'NxTaskbarLib.dll';
procedure UpdateTBRuntime; stdcall;external 'NxTaskbarLib.dll';
procedure SetTBTrans(Active : Boolean); stdcall;external 'NxTaskbarLib.dll';
procedure TBSmallIcon(Active : Boolean); stdcall;external 'NxTaskbarLib.dll';
procedure ShutDownAllService; stdcall;external 'NxTaskbarLib.dll';
//function TBsizeIsSmall : Boolean;stdcall;external 'NxTaskbarLib.dll';
procedure ChangeNxTaskbarLayout(path:string); stdcall;external 'NxTaskbarLib.dll';
procedure ShowNxTaskbarLayout; stdcall;external 'NxTaskbarLib.dll';
procedure CloseNxTaskbarLayout; stdcall;external 'NxTaskbarLib.dll';
{$R *.dfm}

procedure TNxTaskbarExMainForm.LoadINI;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(ExtractFilePath(Application.ExeName) +'settings.ini');
  try
    StartOrbImage               := ini.ReadString('NxTaskbar','OrbImage',ExtractFilePath(Application.ExeName)+'Orbs/kali-start-orb.bmp');
    TBLayoutImage               := ini.ReadString('NxTaskbar','LayoutImage',ExtractFilePath(Application.ExeName)+'Layout/carbon.png');
    TBCustomColor               := ini.ReadString('NxTaskbar','TBColor','E3393939');
//    BlurAlphaColor              := ini.ReadString('NxTaskbar','BlurAlphaColor','255');
    CustomPowerOption           := ini.ReadBool('NxTaskbar','CustomPowerOption',False);
    CustomStartOrb              := ini.ReadBool('NxTaskbar','CustomStartOrb',True);
    CustomStartMenu             := ini.ReadBool('NxTaskbar','CustomStartMenu',False);
    DisableWinKey               := ini.ReadBool('NxTaskbar','DisableWinKey',False);
    IsCenterTaskbarApps         := ini.ReadBool('NxTaskbar','CenterTaskbarApps',False);
    IsCenterTaskbarAppsRelative := ini.ReadBool('NxTaskbar','CenterTaskbarAppsRelative',False);
    TBTransparent               := ini.ReadBool('NxTaskbar','TaskbarTransparent',False);
    isCustomTaskbar             := ini.ReadBool('NxTaskbar','CustomizeTaskbar',False);
    CustomTaskbarLayout         := ini.ReadBool('NxTaskbar','SetTBLayout',False);
    CustomTaskbarColor          := ini.ReadBool('NxTaskbar','SetTBColor',False);
    CustomTaskbarBlur           := ini.ReadBool('NxTaskbar','SetTBBlur',False);
    CustomTaskbarArcylic        := ini.ReadBool('NxTaskbar','SetTBArcylic',False);

    SetVarStartOrb(CustomStartOrb);
    SetVarStartMenu(CustomStartMenu);
    SetVarDisableWinKey(DisableWinKey);
    SetVarTBTransparent(TBTransparent);
  finally
//    if (CustomStartOrb) or (CustomStartMenu) then
//      ActiveMouseHook(True);
    ini.Free;
  end;
end;

procedure TNxTaskbarExMainForm.WinTaskbarSettingClick(Sender: TObject);
begin
  WinExec(PAnsiChar('rundll32.exe shell32.dll, Options_RunDLL 1'), SW_SHOWNORMAL);
end;

procedure TNxTaskbarExMainForm.WMQueryEndSession(var Msg: TWMQueryEndSession);
begin
  if AppStart then
    Msg.Result := 0
  else
    inherited;
end;

//procedure CheckTaskbarIconSize;
//var
//  Reg: TRegistry;
//  RegKey: DWORD;
//  Key: string;
//begin
//  Reg := TRegistry.Create;
//  try
//    Reg.RootKey := HKEY_CURRENT_USER;
//    Key := 'Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced';
//    if Reg.OpenKeyReadOnly(Key) then
//    begin
//      if Reg.ValueExists('TaskbarSmallIcons') then
//      begin
//        RegKey := Reg.ReadInteger('TaskbarSmallIcons');
//        Reg.CloseKey;
//        isTaskbarSmall := RegKey;
//        if RegKey = 1 then
//          IsTBSmallIcon := True
//          else
//          IsTBSmallIcon := False;
//      end;
//    end;
//  finally
//    Reg.Free
//  end;
//end;
//
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

procedure TNxTaskbarExMainForm.TAMessage(Sender: TObject; From: HWND; ID: Word; P: Pointer;
  Size: Cardinal; var Result: Integer);
var
  R: TRecordData;
begin
  case ID of
    1001: //custom start orb ON
      begin
        ShowStartButton(SW_HIDE);
        EnableStartButton(False);
        ShowNxStartOrb;
        ChangeNxStartOrb(StartOrbImage);
        CustomStartOrb := True;
        SetVarStartOrb(CustomStartOrb);
        TrayIcon.BalloonHint := 'Custom Start Orb Active';
        TrayIcon.ShowBalloonHint;
//        ActiveMouseHook(True);
      end;
    1002: //custom start orb OFF
      begin
        ShowStartButton(SW_SHOW);
        EnableStartButton(True);
        CloseNxStartOrb;
        CustomStartOrb := False;
        TrayIcon.BalloonHint := 'Custom Start Orb Not Active';
        TrayIcon.ShowBalloonHint;
        SetVarStartOrb(CustomStartOrb);
//        if not CustomStartMenu then
//          ActiveMouseHook(False);
      end;
    1003: //custom start menu ON
      begin
//        EnableStartButton(False);
        CustomStartMenu := True;
        SetVarStartMenu(CustomStartMenu);
        TrayIcon.BalloonHint := 'Custom Start Menu Active';
        TrayIcon.ShowBalloonHint;
//        ActiveKeyboardHook(True);
//        ActiveMouseHook(True);
      end;
    1004: //custom start menu OFF
      begin
//        EnableStartButton(True);
        CustomStartMenu := False;
        DisableWinKey := False;
        SetVarStartMenu(CustomStartMenu);
        SetVarDisableWinKey(DisableWinKey);
        TrayIcon.BalloonHint := 'Custom Start Menu Not Active';
        TrayIcon.ShowBalloonHint;
        ActiveKeyboardHook(False);
//        if not CustomStartOrb then
//          ActiveMouseHook(False);
      end;
    10031: //Disable Win Key ON
      begin
//        EnableStartButton(False);
        DisableWinKey := True;
        SetVarDisableWinKey(DisableWinKey);
        TrayIcon.BalloonHint := 'Disable Win Key Active';
        TrayIcon.ShowBalloonHint;
        ActiveKeyboardHook(True);
//        ActiveMouseHook(True);
      end;
    10041: //Disable Win Key OFF
      begin
        DisableWinKey := False;
        SetVarDisableWinKey(DisableWinKey);
        TrayIcon.BalloonHint := 'Disable Win Key Not Active';
        TrayIcon.ShowBalloonHint;
        ActiveKeyboardHook(False);
      end;
    1005: //custom power button ON
      begin
        CustomPowerOption := True;
        TrayIcon.IconIndex := 1;
        trayIcon.Hint := 'Power Option';
        TrayIcon.BalloonHint := 'Custom Power Option Active';
        TrayIcon.ShowBalloonHint;
      end;
    1006: //custom power button OFF
      begin
        CustomPowerOption := False;
        TrayIcon.IconIndex := 0;
        TrayIcon.Hint := 'NxTaskbar';
        TrayIcon.BalloonHint := 'Custom Power Option Not Active';
        TrayIcon.ShowBalloonHint;
      end;
    1010: //Change Start Orb Image
      begin
        R := TRecordData(P^);
        StartOrbImage := R.Text;
        ChangeNxStartOrb(StartOrbImage);
        TrayIcon.BalloonHint := 'Start Orb Changed to ' + ExtractFileName(StartOrbImage);
        TrayIcon.ShowBalloonHint;
      end;
    1011: //Auto Run Windows
      begin
        R := TRecordData(P^);
        ScheduleRunAtStartup('NxTaskbar',ExtractFilePath(Application.ExeName)+'NxTaskbar.xml',R.Flag);
        if R.Flag then
        TrayIcon.BalloonHint := 'AutoRun with Windows Start Active'
        else
        TrayIcon.BalloonHint := 'AutoRun with Windows Start Not Active';
        TrayIcon.ShowBalloonHint;
      end;
    2001: //Center Taskbar and Relative On Off
      begin
        R := TRecordData(P^);
        if R.Text = 'True' then begin
          IsCenterTaskbarApps :=  True;
          TimerCenter.Enabled := True;
        end else begin
          IsCenterTaskbarApps := False;
        end;
        if R.Flag then
          IsCenterTaskbarAppsRelative := True
          else
          IsCenterTaskbarAppsRelative := False;

        CenterTaskbarAppsButton(IsCenterTaskbarApps,IsCenterTaskbarAppsRelative);
        if R.Text = 'True' then
        TrayIcon.BalloonHint := 'Center Application Button Taskbar Active'
        else
        TrayIcon.BalloonHint := 'Center Application Button Taskbar Not Active';
        TrayIcon.ShowBalloonHint;
      end;
    2002: //Taskbar Small Icon
      begin
        R := TRecordData(P^);
//        IsTBSmallIcon := R.Flag;
        TBSmallIcon(R.Flag);
        if R.Flag then
        TrayIcon.BalloonHint := 'Small Taskbar Active'
        else
        TrayIcon.BalloonHint := 'Small Taskbar Not Active';
        TrayIcon.ShowBalloonHint;
      end;
    2003: //Transparent ON
      begin
        TBTransparent := True;
        SetTBTrans(True);
        SetVarTBTransparent(TBTransparent);
        TrayIcon.BalloonHint := 'Taskbar Transparent Active';
        TrayIcon.ShowBalloonHint;
      end;
    2004: //Transparent OFF
      begin
        TBTransparent := False;
        SetTBTrans(False);
        SetVarTBTransparent(TBTransparent);
        TrayIcon.BalloonHint := 'Taskbar Transparent Not Active';
        TrayIcon.ShowBalloonHint;
      end;
    2005: //Custom Taskbar On Off
      begin
        R := TRecordData(P^);
        isCustomTaskbar := R.Flag;
        if R.Flag then begin
          TBTransparent := False;
          SetTBTrans(False);
          SetVarTBTransparent(TBTransparent);
          TrayIcon.BalloonHint := 'Custom Taskbar Layout Active'
        end else begin
          CloseNxTaskbarLayout;
          CustomTaskbarLayout := False;
          CustomTaskbarColor := False;
          CustomTaskbarBlur := False;
          TrayIcon.BalloonHint := 'Custom Taskbar Layout Not Active';
        end;
        TrayIcon.ShowBalloonHint;
      end;
    20051: //custom Taskbar Layout
      begin
        R := TRecordData(P^);
        CloseNxTaskbarLayout;
        TBLayoutImage := R.Text;
        CustomTaskbarLayout := R.Flag;
        CustomTaskbarColor := False;
        CustomTaskbarBlur := False;
        CustomTaskbarArcylic := False;
        ShowNxTaskbarLayout;
        ChangeNxTaskbarLayout(TBLayoutImage);
//        ActiveMouseHook(True);
      end;
    20052: //custom Taskbar Color
      begin
        R := TRecordData(P^);
        CloseNxTaskbarLayout;
        TBCustomColor := R.Text;
        CustomTaskbarLayout := False;
        CustomTaskbarColor := R.Flag;
        CustomTaskbarBlur := False;
        CustomTaskbarArcylic := False;
        ShowNxTaskbarLayout;
        UpdateTBColorization(StringToAlphaColor('$'+Copy(R.Text, 3, 6)),StrToInt('$'+Copy(R.Text, 1, 2)),R.Number);
      end;
    20053: //custom Taskbar Blur
      begin
        R := TRecordData(P^);
        TBCustomColor := R.Text;
//        BlurAlphaColor := IntToStr(R.Number);
        CloseNxTaskbarLayout;
        CustomTaskbarLayout := False;
        CustomTaskbarColor := False;
        CustomTaskbarBlur := R.Flag;
        CustomTaskbarArcylic := False;
        ShowNxTaskbarLayout;
        UpdateTBColorization(StringToAlphaColor('$'+Copy(R.Text, 3, 6)),StrToInt('$'+Copy(R.Text, 1, 2)),R.Number);
      end;
    20054: //custom Taskbar Acrylic
      begin
        R := TRecordData(P^);
        TBCustomColor := R.Text;
//        BlurAlphaColor := IntToStr(R.Number);
        CloseNxTaskbarLayout;
        CustomTaskbarLayout := False;
        CustomTaskbarColor := False;
        CustomTaskbarBlur := False;
        CustomTaskbarArcylic := R.Flag;
        ShowNxTaskbarLayout;
        UpdateTBColorization(StringToAlphaColor('$'+Copy(R.Text, 3, 6)),StrToInt('$'+Copy(R.Text, 1, 2)),R.Number);
      end;
    22222: //close taskbar layout to apply live preview color
      begin
        CloseNxTaskbarLayout;
      end;
    9000: //Show Custom Power Option from Start Menu
      begin
        ShowNxPowerOption;
      end;
  end;
end;

procedure TNxTaskbarExMainForm.TimerCheckExplorerTimer(Sender: TObject);
var
//  Reg: TRegistry;
//  RegKey: DWORD;
//  Key: string;
  i : Integer;
begin
  UpdateTBRuntime;
//  IsTBSmallIcon := TBsizeIsSmall;

//  Reg := TRegistry.Create;
//  try
//    Reg.RootKey := HKEY_CURRENT_USER;
//    Key := 'Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced';
//    if Reg.OpenKeyReadOnly(Key) then
//    begin
//      if Reg.ValueExists('TaskbarSmallIcons') then
//      begin
//        RegKey := Reg.ReadInteger('TaskbarSmallIcons');
//        Reg.CloseKey;
//        if RegKey <> isTaskbarSmall then begin
//          try
//            isTaskbarSmall := RegKey;
//            CloseNxStartOrb;
//          finally
//            TimerCheckTaskbarExist.Enabled := True;
//            TimerCheckExplorer.Enabled := False;
//          end;
//        end;
//      end;
//    end;
//  finally
//    Reg.Free
//  end;

//  if IsTBSmallIcon then i:=1 else i:=0;
//  if isTaskbarSmall <> i then begin

  if ChangeDetect then begin
    try
//      isTaskbarSmall := i;
      CloseNxStartOrb;
      CloseNxTaskbarLayout;
    finally
      ChangeDetect := False;
//      if CustomTaskbarBlur then UpdateBlurColorization(StringToAlphaColor('$'+Copy(TBCustomColor,3,6)),StrToInt('$' + Copy(TBCustomColor,1,2)));
      TimerCheckTaskbarExist.Enabled := True;
      TimerCheckExplorer.Enabled := False;
    end;
  end;
end;

procedure TNxTaskbarExMainForm.TimerCheckTaskbarExistTimer(Sender: TObject);
var
  T : TRect;
  TB :HWND;
begin
  TimerCheckTaskbarExist.Interval := 750;
  TB := FindWindow('Shell_TrayWnd',nil);
//  B := FindWindowEx(TB,0,'Start','Start');
  GetWindowRect(TB,T);
//  GetWindowRect(B,R);

  if IsWindow(TB) then begin
    try
      if CustomStartOrb then begin
        ShowNxStartOrb;
        ShowStartButton(SW_HIDE);
        EnableStartButton(False);
        ChangeNxStartOrb(StartOrbImage);
      end else begin
        ShowStartButton(SW_SHOW);
        EnableStartButton(True);
        CloseNxStartOrb;
      end;
      if DisableWinKey then begin
        ActiveKeyboardHook(True);
      end else begin
        ActiveKeyboardHook(False);
      end;
      if CustomPowerOption then begin
        TrayIcon.IconIndex := 1;
        trayIcon.Hint := 'Power Option';
      end else begin
        TrayIcon.IconIndex := 0;
        TrayIcon.Hint := 'NxTaskbar';
      end;
      if TBTransparent then begin
        SetTBTrans(True);
      end else begin
        SetTBTrans(False);
      end;
      if IsCenterTaskbarApps then
        TimerCenter.Enabled := True;
      if isCustomTaskbar and CustomTaskbarLayout then begin
          ShowNxTaskbarLayout;
          CustomTaskbarColor := False;
          CustomTaskbarBlur := False;
          CustomTaskbarArcylic := False;
//          Sleep(100);
          ChangeNxTaskbarLayout(TBLayoutImage);
      end else
      if isCustomTaskbar and CustomTaskbarColor then begin
          ShowNxTaskbarLayout;
          CustomTaskbarLayout := False;
          CustomTaskbarBlur := False;
          CustomTaskbarArcylic := False;
//          Sleep(100);
          UpdateTBColorization(StringToAlphaColor('$'+Copy(TBCustomColor,3,6)),StrToInt('$' + Copy(TBCustomColor,1,2)),1);
      end else
      if isCustomTaskbar and CustomTaskbarBlur then begin
          ShowNxTaskbarLayout;
          CustomTaskbarLayout := False;
          CustomTaskbarColor := False;
          CustomTaskbarArcylic := False;
//          Sleep(100);
          UpdateTBColorization(StringToAlphaColor('$'+Copy(TBCustomColor,3,6)),StrToInt('$' + Copy(TBCustomColor,1,2)),2);
      end else
      if isCustomTaskbar and CustomTaskbarArcylic then begin
          ShowNxTaskbarLayout;
          CustomTaskbarLayout := False;
          CustomTaskbarColor := False;
          CustomTaskbarBlur := False;
//          Sleep(100);
          UpdateTBColorization(StringToAlphaColor('$'+Copy(TBCustomColor,3,6)),StrToInt('$' + Copy(TBCustomColor,1,2)),3);
      end else
      if isCustomTaskbar and
         not CustomTaskbarLayout and
         not CustomTaskbarColor and
         not CustomTaskbarBlur and
         not CustomTaskbarArcylic then begin
        CustomTaskbarLayout := False;
        CustomTaskbarColor := false;
        CustomTaskbarBlur := false;
        CustomTaskbarArcylic := False;
        CloseNxTaskbarLayout;
      end else
      if not isCustomTaskbar then begin
        CustomTaskbarLayout := False;
        CustomTaskbarColor := false;
        CustomTaskbarBlur := false;
        CustomTaskbarArcylic := False;
        CloseNxTaskbarLayout;
      end;
//      TBSmallIcon(IsTBSmallIcon);
    finally
      ActiveMouseHook(True);
      ShutdownBlockReasonCreate(Application.MainForm.Handle,'dont kill me');
      TimerCheckTaskbarExist.Enabled := False;
      TimerCheckExplorer.Enabled := True;
      RefreshTaskbar;
    end;
  end;
end;

procedure TNxTaskbarExMainForm.TimerCenterTimer(Sender: TObject);
begin
  CenterTaskbarAppsButton(IsCenterTaskbarApps,IsCenterTaskbarAppsRelative);
end;

procedure TNxTaskbarExMainForm.TrayIconClick(Sender: TObject);
var
  po, cfg : HWND;
begin
  po := FindWindow('TPowerOptionForm',nil);
  cfg := FindWindow('TNxTaskbarCfgForm',nil);
  if CustomPowerOption then begin
    if po = 0 then
    ShowNxPowerOption;
  end else begin
    if not processExists('NxTaskbarCfg.exe') then
      ShellExecute(0, 'open', PChar(ExtractFilePath(Application.ExeName) + 'NxTaskbarCfg.exe'),'-OpenNxConfig', nil, SW_SHOWNORMAL)
    else
      if cfg <> 0 then
      SetForegroundWindow(cfg);
  end;

end;

procedure TNxTaskbarExMainForm.NxExitClick(Sender: TObject);
begin
  close;
end;

procedure TNxTaskbarExMainForm.OpenNxConfigClick(Sender: TObject);
var
  cfg : HWND;
begin
  cfg := FindWindow('TNxTaskbarCfgForm',nil);
    if not processExists('NxTaskbarCfg.exe') then
      ShellExecute(0, 'open', PChar(ExtractFilePath(Application.ExeName) + 'NxTaskbarCfg.exe'), '-OpenNxConfig', nil, SW_SHOWNORMAL)
    else
      if cfg <> 0 then
      SetForegroundWindow(cfg);
end;

procedure TNxTaskbarExMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TNxTaskbarExMainForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
    if MessageBox(Handle,
      'Are you sure want Exit application?',
      'Warning', MB_ICONWARNING or MB_YESNO) = ID_YES
    then
    begin
      CanClose := True;
    end
    else
    begin
      CanClose := False;
    end;
end;

procedure TNxTaskbarExMainForm.FormCreate(Sender: TObject);
begin
//  IsTBSmallIcon := TBsizeIsSmall;
  TaskbarInit;
  AppStart := True;
  LoadINI;
//  CheckTaskbarIconSize;
  if GetModuleHandle('NxTaskbarLib.dll') = 0 then
  LibHandle := LoadLibrary('NxTaskbarLib.dll');
  TimerCheckTaskbarExist.Enabled := True;
  fwm_TaskbarRestart := RegisterWindowMessage('TaskbarCreated');
end;

procedure TNxTaskbarExMainForm.FormDestroy(Sender: TObject);
begin
  try
    ShutDownAllService;
    AppStart := False;
    ShutdownBlockReasonDestroy(Handle);
//    ActiveMouseHook(False);
//    ActiveKeyboardHook(False);
//    CloseNxStartButton;
//    ShowStartButton(SW_SHOW);
//    EnableStartButton(True);
//    CloseNxPowerOption;
//    CloseHandleForm;
  finally
    FreeLibrary(LibHandle);
  end;
end;

procedure TNxTaskbarExMainForm.WndProc(var Msg: TMessage);
//var
//  margins: TMARGINS;
//  v: Integer;
begin
  if Msg.Msg = fwm_TaskbarRestart then
  begin
    CloseNxTaskbarLayout;
    ActiveMouseHook(False);
    ActiveKeyboardHook(False);
    TimerCheckExplorer.Enabled := False;
    TimerCheckTaskbarExist.Interval := 1000;
    TimerCheckTaskbarExist.Enabled := True;
  end
  else
  begin
    case (Msg.Msg) of
    WM_NCPAINT:
      begin
      {  v := 2;
        DwmSetWindowAttribute(Self.Handle, 2, @v, 4);
        DwmExtendFrameIntoClientArea(Self.Handle, margins);}
      end;
    WM_DWMCOLORIZATIONCOLORCHANGED:
      begin
        CloseNxTaskbarLayout;
        ActiveMouseHook(False);
        ActiveKeyboardHook(False);
        TimerCheckExplorer.Enabled := False;
        TimerCheckTaskbarExist.Interval := 1000;
        TimerCheckTaskbarExist.Enabled := True;
        // add or remove taskbars
      end;
    WM_DISPLAYCHANGE:
      begin
        // monitor settings changed
        // added or duplicated
//        Taskbars.Refresh;
      end;
    WM_SETTINGCHANGE:
      begin
        ChangeDetect := True;
        // when taskbar is allowed to be shown on multiple monitors
        // this event is sent, but it is also sent when taskbar is resized or moved
        // and if its set to hidden or visible in desktop mode
        if msg.WParam = SPI_SETWORKAREA then
//          RefreshTaskbar;
      end;
    end;

  end;

  inherited WndProc(Msg);
end;


var
  mHandle: THandle;    // Mutexhandle

initialization
  mHandle := CreateMutex(nil, True, 'NxTaskbarEx');
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
//    ShowMessage('Program is already running!');
    halt;
  end;

finalization
  if mHandle <> 0 then CloseHandle(mHandle)


end.
