unit PowerOption;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Themes, ShellAPI, ExtCtrls, pngimage,
  System.ImageList, Vcl.ImgList, sSkinManager, Vcl.StdCtrls, sButton, Registry, DWMApi,
  sPanel, TlHelp32;
  {$R 'NxAdmin.RES' 'NxAdmin.RC'}

const
  WM_ICONTRAY      =   WM_USER + 1;
  WH_KEYBOARD_LL   =   13;
  LLKHF_ALTDOWN    =   $00000020;
  LLKHF_INJECTED   =   $00000010;

type
  tagKBDLLHOOKSTRUCT   =   record
  vkCode      : DWORD;
  scanCode    : DWORD;
  flags       : DWORD;
  time        : DWORD;
  dwExtraInfo : DWORD;
  end;
  KBDLLHOOKSTRUCT     = tagKBDLLHOOKSTRUCT;
  LPKBDLLHOOKSTRUCT   = ^KBDLLHOOKSTRUCT;
  PKBDLLHOOKSTRUCT    = ^KBDLLHOOKSTRUCT;

  TPowerOptionForm = class(TForm)
    ImageList1: TImageList;
    Image1: TImage;
    Image2: TImage;
    Panel: TsPanel;
    btnShutdown: TsButton;
    btnRestart: TsButton;
    btnSleep: TsButton;
    btnLogout: TsButton;
    btnCancel: TsButton;
    sSkinManager1: TsSkinManager;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnShutdownClick(Sender: TObject);
    procedure btnRestartClick(Sender: TObject);
    procedure btnSleepClick(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure WndProc(var Message: TMessage);override;
  private
    function TaskbarAccented:boolean;
    function TaskbarTranslucent:boolean;
    procedure EnableBlur;
    function GetAccentColor:TColor;
    procedure UpdateColorization;
    { Private declarations }
  public
    { Public declarations }
  end;

  AccentPolicy = packed record
    AccentState: Integer;
    AccentFlags: Integer;
    GradientColor: Integer;
    AnimationId: Integer;
  end;

  TWinCompAttrData = packed record
    attribute: THandle;
    pData: Pointer;
    dataSize: ULONG;
  end;

var
  PowerOptionForm: TPowerOptionForm;
  hhkLowLevelKybd: HHOOK;
  PO_CustomStartMenuActive : Boolean = False;

var
  SetWindowCompositionAttribute: function (Wnd: HWND; const AttrData: TWinCompAttrData): BOOL; stdcall = Nil;

implementation

{$R *.dfm}

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


procedure SetAlphaColorPicture(
  const Col: TColor;
  const Alpha: Integer;
  Picture: TPicture;
  const _width: Integer;
  const _height: Integer
  );
var
  bmp: TBitmap;
  pn: TPngImage;
  y: integer;
  sl: pByteArray;
begin

  bmp := TBitmap.Create;
  try
    bmp.SetSize(_width,_height);
    bmp.Canvas.Brush.Color := Col;
    bmp.Canvas.FillRect(Rect(0,0,_width,_height));

    pn := TPngImage.Create;
    try
      pn.Assign(bmp);
      pn.CreateAlpha;

      for y := 0 to pn.Height - 1 do
      begin
        sl := pn.AlphaScanline[y];
        FillChar(sl^, pn.Width, Alpha);
      end;

      Picture.Assign(pn);

    finally
      pn.Free;
    end;
  finally
    bmp.Free;
  end;
end;

function TPowerOptionForm.TaskbarAccented: boolean;
var
  reg: TRegistry;
begin
  Result := False;
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    reg.OpenKeyReadOnly('SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize');
    try
      if reg.ReadInteger('ColorPrevalence') = 1 then
      Result := True;
    except
      Result := False;
    end;
    reg.CloseKey;

  finally
    reg.Free;
  end;
end;

function TPowerOptionForm.TaskbarTranslucent: boolean;
var
  reg: TRegistry;
begin
  Result := False;
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    reg.OpenKeyReadOnly('SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize');
    try
      if reg.ReadInteger('EnableTransparency') = 1 then
      Result := True;
    except
      Result := False;
    end;
    reg.CloseKey;

  finally
    reg.Free;
  end;
end;

procedure TPowerOptionForm.EnableBlur;
const
  WCA_ACCENT_POLICY = 19;
  ACCENT_ENABLE_BLURBEHIND = 3;
  DrawLeftBorder = $20;
  DrawTopBorder = $40;
  DrawRightBorder = $80;
  DrawBottomBorder = $100;
var
  dwm10: THandle;
  data : TWinCompAttrData;
  accent: AccentPolicy;
begin

      dwm10 := LoadLibrary('user32.dll');
      try
        @SetWindowCompositionAttribute := GetProcAddress(dwm10, 'SetWindowCompositionAttribute');
        if @SetWindowCompositionAttribute <> nil then
        begin
          accent.AccentState := ACCENT_ENABLE_BLURBEHIND ;
          accent.AccentFlags := DrawLeftBorder or DrawTopBorder or DrawRightBorder or DrawBottomBorder;

          data.Attribute := WCA_ACCENT_POLICY;
          data.dataSize := SizeOf(accent);
          data.pData := @accent;
          SetWindowCompositionAttribute(Handle, data);
        end
        else
        begin
          ShowMessage('Not found Windows 10 blur API');
        end;
      finally
        FreeLibrary(dwm10);
      end;

end;

function TPowerOptionForm.GetAccentColor:TColor;
var
  col: cardinal;
  opaque: longbool;
  newcolor: TColor;
  a,r,g,b: byte;
begin
  try
    DwmGetColorizationColor(col, opaque);
    a := Byte(col shr 24);
    r := Byte(col shr 16);
    g := Byte(col shr 8);
    b := Byte(col);

    newcolor := RGB(
        round(r*(a/255)+255-a),
        round(g*(a/255)+255-a),
        round(b*(a/255)+255-a)
    );
  finally
    Result := newcolor;
  end;
end;

procedure TPowerOptionForm.WndProc(var Message: TMessage);
//const
//  WM_DWMCOLORIZATIONCOLORCHANGED = $0320;
begin
  if Message.Msg = WM_DWMCOLORIZATIONCOLORCHANGED then
  begin
      UpdateColorization;
  end;
  inherited WndProc(Message);

end;

procedure TPowerOptionForm.UpdateColorization;
begin
  if TaskbarTranslucent then
  begin
    SetAlphaColorPicture(clblack, 200, Image1.Picture, 10,10  );
    Image1.Align := alClient;
    Image1.Stretch := True;
    Image1.Visible := True;
  end
  else
    Image1.Visible := False;

  if TaskbarAccented then
  begin
    SetAlphaColorPicture(GetAccentColor, 110, Image2.Picture, 10, 10);
    Image2.Visible := True;
    Image2.Align := alClient;
    Image2.Stretch := True;
  end
  else
    Image2.Visible := False;
end;

function POLowLevelKeyBoardProc(nCode:   Integer;   awParam:   WPARAM;   alParam:   LPARAM):   LRESULT;   stdcall;
var
  fEatKeyStroke:   Boolean;
  p:   PKBDLLHOOKSTRUCT;
begin
  fEatKeystroke   :=   False;
  if nCode   =   HC_ACTION   then
  begin
    case awParam of
      WM_KEYDOWN,
      WM_SYSKEYDOWN,
      WM_KEYUP,
      WM_SYSKEYUP:
      begin
        p   :=   PKBDLLHOOKSTRUCT(alParam);
        if p^.vkCode   =   VK_LWIN
          then fEatKeystroke   :=   True;
        if p^.vkCode   =   VK_RWIN
          then fEatKeystroke   :=   True;
      end;
    end;
  end;
  if fEatKeyStroke then
    Result := 1
  else
    Result := CallNextHookEx(hhkLowLevelKybd, nCode, awParam, alParam);
end;

procedure InstallHook;
begin
  if hhkLowLevelKybd <> 0 then exit;
  if not PO_CustomStartMenuActive then
    hhkLowLevelKybd := SetWindowsHookEx(WH_KEYBOARD_LL, @POLowLevelKeyboardProc, hInstance, 0)
  else exit;
end;

procedure UninstallHook;
begin
  if hhkLowLevelKybd = 0 then exit;
  if PO_CustomStartMenuActive then begin
    UnhookWindowsHookEx(hhkLowLevelKybd);
    hhkLowLevelKybd := 0;
  end else exit;
end;

procedure TPowerOptionForm.btnRestartClick(Sender: TObject);
begin
  UninstallHook;
  WinExec('shutdown.exe -r -t 00' , SW_HIDE);
  KillTask('NxTaskbarEx.exe');
  PowerOptionForm.Close;
end;

procedure TPowerOptionForm.btnShutdownClick(Sender: TObject);
begin
  UninstallHook;
  WinExec('shutdown.exe -s -t 00' , SW_HIDE);
  KillTask('NxTaskbarEx.exe');
  PowerOptionForm.Close;
end;

procedure TPowerOptionForm.btnSleepClick(Sender: TObject);
begin
  UninstallHook;
  WinExec('rundll32.exe powrprof.dll,SetSuspendState 0,1,0' , SW_HIDE);
  PowerOptionForm.Close;
end;

procedure TPowerOptionForm.btnLogoutClick(Sender: TObject);
begin
//  CloseNxStartButton;
//  ShowStartButton(SW_SHOW);
//  EnableStartButton(True);
  UninstallHook;
  WinExec('shutdown.exe -L' , SW_HIDE);
  KillTask('NxTaskbarEx.exe');
  PowerOptionForm.Close;
end;

procedure TPowerOptionForm.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
  Color := clBlack;
  BorderStyle := bsNone;
  if TaskbarTranslucent then
    EnableBlur;

  UpdateColorization;
//  SetWindowLong(Handle,GWL_STYLE,GetWindowLong(Handle,GWL_STYLE) and not WS_CAPTION);
  WindowState := wsMaximized;
  Left := -20;
  Top := -20;
  Width := Screen.Width + 20;
  Height := Screen.Height + 20;
  ShowWindow(Application.Handle, SW_HIDE);
//  RecreateWnd;
end;

procedure TPowerOptionForm.FormResize(Sender: TObject);
begin
  Panel.Left := (ClientWidth - Panel.Width)  div 2;
  Panel.Top := (ClientHeight - Panel.Height) div 2;
end;

procedure TPowerOptionForm.FormShow(Sender: TObject);
begin
  InstallHook;
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TPowerOptionForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  UninstallHook;
  Action := caFree;
end;

procedure TPowerOptionForm.FormDestroy(Sender: TObject);
begin
  UninstallHook;
end;

procedure TPowerOptionForm.btnCancelClick(Sender: TObject);
begin
  PowerOptionForm.Close;
  UninstallHook;
end;

var
  mHandle: THandle;    // Mutexhandle

initialization
  SetWindowCompositionAttribute := GetProcAddress(GetModuleHandle(user32), 'SetWindowCompositionAttribute');
  mHandle := CreateMutex(nil, True, 'PowerOption');
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
    ShowMessage('PowerOption is already running!');
    halt;
  end;

finalization
  if mHandle <> 0 then CloseHandle(mHandle)

end.
