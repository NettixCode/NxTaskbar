unit NxTaskbarCfgMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ImgList,
  Vcl.ComCtrls,
  Vcl.Menus,
  Vcl.Themes,
  Vcl.Styles,
  ShellAPI,
  MPCommonObjects,
  VirtualExplorerEasyListview,
  pngimage,
  acPNG,
  EasyListview,
  rkVistaPanel,
  IniFiles,
  sLabel,
  TlHelp32,
  DzTalkApp,
  Registry,
  ES.BaseControls,
  ES.Switch,
  Math,
  UIConsts,
  DwmApi,
  ActiveX,
  ComObj,
  madExceptVcl,
  UnivCL.TUVRadioButton;
  {$R 'NxAdmin.RES' 'NxAdmin.RC'}

const
  CM_COLORUPDATE = WM_USER + 1984; // Custom Message...
  WCA_ACCENT_POLICY = 19;
  ACCENT_DISABLED = 0;
  ACCENT_ENABLE_GRADIENT = 1;
  ACCENT_ENABLE_TRANSPARENTGRADIENT = 2;
  ACCENT_ENABLE_BLURBEHIND = 3;
  ACCENT_ENABLE_ACRYLICBLURBEHIND = 4;
  DRAW_LEFT_BORDER = $20;
  DRAW_TOP_BORDER = $40;
  DRAW_RIGHT_BORDER = $80;
  DRAW_BOTTOM_BORDER = $100;

  IID_AppVisibility: TGUID = '{2246EA2D-CAEA-4444-A3C4-6DE827E44313}';
  CLSID_AppVisibility: TGUID = '{7E5FE3D9-985F-4908-91F9-EE19F9FD1514}';

type
  MONITOR_APP_VISIBILITY = (
    MAV_UNKNOWN = 0,
    MAV_NO_APP_VISIBLE = 1,
    MAV_APP_VISIBLE = 2
  );

  IAppVisibilityEvents = interface(IUnknown)
    ['{6584CE6B-7D82-49C2-89C9-C6BC02BA8C38}']
    function AppVisibilityOnMonitorChanged(hMonitor: HMONITOR;
              previousMode: MONITOR_APP_VISIBILITY;
              currentMode: MONITOR_APP_VISIBILITY):HRESULT; stdcall;
    function LauncherVisibilityChange(currentVisibleState: BOOL): HRESULT; stdcall;
  end;

  IAppVisibility = interface(IUnknown)
    ['{2246EA2D-CAEA-4444-A3C4-6DE827E44313}']
    function GetAppVisibilityOnMonitor(monitor: HMONITOR; out pMode: MONITOR_APP_VISIBILITY): HRESULT; stdcall;
    function IsLauncherVisible(out pfVisible: BOOL): HRESULT; stdcall;
    function Advise(pCallBack: IAppVisibilityEvents; out pdwCookie: DWORD): HRESULT; stdcall;
    function Unadvise(dwCookie: DWORD): HRESULT; stdcall;
  end;

  PRGB = ^TRGB;
  TRGB = record b, g, r: Byte;
  end;
  PRGBA = ^TRGBA;
  TRGBA = record b, g, r, a: Byte;
  end;
  PRGBArray = ^TRGBArray;
  TRGBARRAY = array[0..0] of TRGB;
  THSB = record h, s, b: Word;
  end;

  TNxTaskbarCfgMainForm = class(TForm)
    PageControl: TPageControl;
    TabStartOrb: TTabSheet;
    OrbList: TVirtualExplorerEasyListview;
    TabSettings: TTabSheet;
    PanelPreview: TPanel;
    BarPreview: TrkVistaPanel;
    AddOrb: TButton;
    DelOrb: TButton;
    ApplyOrbs: TButton;
    LabelPreview: TLabel;
    PanelBottom: TPanel;
    RefreshList: TButton;
    IconList: TImageList;
    BevelLeft: TBevel;
    TA: TDzTalkApp;
    AlwaysOnTop: TCheckBox;
    BoxPreviewImage: TrkVistaPanel;
    ImagePreview: TImage;
    CenterTaskbarApps: TEsSwitch;
    CustomPowerOption: TEsSwitch;
    CustomStartOrb: TEsSwitch;
    CustomStartMenu: TEsSwitch;
    DisableWinKey: TEsSwitch;
    AutoRunWindows: TEsSwitch;
    BevelRight: TBevel;
    CenterTaskbarAppsRelative: TEsSwitch;
    TaskbarTransparent: TEsSwitch;
    SmallTaskbar: TEsSwitch;
    TimerCheckTBsizeChange: TTimer;
    MadExceptionHandler: TMadExceptionHandler;
    TabTaskbarColor: TTabSheet;
    CustomizeTaskbar: TEsSwitch;
    TabStartMenu: TTabSheet;
    TBLayoutList: TVirtualExplorerEasyListview;
    PanelColor: TPanel;
    imgColorBox: TImage;
    imgZBar: TImage;
    imgColor: TImage;
    btnVar: TSpeedButton;
    imgPal: TImage;
    imgAlpha: TImage;
    editColor1: TEdit;
    editColor2: TEdit;
    editColor3: TEdit;
    AlphaColor: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    AccentColor: TEdit;
    ilMain: TImageList;
    timeAni: TTimer;
    Label5: TLabel;
    PanelRadio: TPanel;
    SetTBLayout: TRadioButton;
    SetTBColor: TRadioButton;
    SetTBBlur: TRadioButton;
    PanelBtnLayout: TPanel;
    ApplyCustomTB: TButton;
    SetTBArcylic: TRadioButton;
    procedure ApplyOrbsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddOrbClick(Sender: TObject);
    procedure DelOrbClick(Sender: TObject);
    procedure ImagePreviewMouseEnter(Sender: TObject);
    procedure ImagePreviewMouseLeave(Sender: TObject);
    procedure ImagePreviewClick(Sender: TObject);
    procedure OrbListClick(Sender: TObject);
    procedure RefreshListClick(Sender: TObject);
    procedure CustomPowerOptionClick(Sender: TObject);
    procedure CustomStartOrbClick(Sender: TObject);
    procedure CustomStartMenuClick(Sender: TObject);
    procedure AlwaysOnTopClick(Sender: TObject);
    procedure AutoRunWindowsClick(Sender: TObject);
    procedure DisableWinKeyClick(Sender: TObject);
    procedure CheckAutoRunWindows;
    procedure CheckSmallTaskbarIcon;
    procedure FormActivate(Sender: TObject);
    procedure CenterTaskbarAppsClick(Sender: TObject);
    procedure CenterTaskbarAppsRelativeClick(Sender: TObject);
    procedure TaskbarTransparentClick(Sender: TObject);
    procedure SmallTaskbarClick(Sender: TObject);
    procedure TimerCheckTBsizeChangeTimer(Sender: TObject);
    procedure CustomizeTaskbarClick(Sender: TObject);
    procedure btnVarClick(Sender: TObject);
    procedure editColor1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editColor1KeyPress(Sender: TObject; var Key: Char);
    procedure editColor1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure imgAlphaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgAlphaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgAlphaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgColorBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgColorBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgColorBoxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgPalMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure timeAniTimer(Sender: TObject);
    procedure imgZBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgZBarMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure imgZBarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AccentColorChange(Sender: TObject);
    procedure SetTBLayoutClick(Sender: TObject);
    procedure SetTBColorClick(Sender: TObject);
    procedure SetTBBlurClick(Sender: TObject);
    procedure ApplyCustomTBClick(Sender: TObject);
    procedure SetTBArcylicClick(Sender: TObject);
  private
    FAlphaMode: Boolean;
    procedure PaintAlphaBar;
    procedure SetAlphaMode(const Value: Boolean);
    procedure PaintAlphaColor;
    procedure TransColor(wnd : HWND; col : Tcolor; Blur : Boolean = False);
    { Private declarations }
    procedure SaveINI;
    procedure LoadINI;
  public
    procedure PaintColorPnl;
    function GetColor: TColor;
    procedure SetColor(Color: TColor; Update: Boolean); overload;
    procedure SetColor(Color: TColor; Alpha: Byte; Update: Boolean); overload;
    procedure PaintVar;
    procedure PaintColorHue;
    procedure PaintHueBar;
    property AlphaMode: Boolean read FAlphaMode write SetAlphaMode;
    procedure RestoreOpacity(Handle: THandle);
    function IsStartMenuVisible: Boolean;
     { Public declarations }
  end;

  TRecordData = packed record
    Number: Integer;
    Text: ShortString;
    Flag: Boolean;
  end;

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

  TWinCompAttrData = packed record
    attribute: THandle;
    pData: Pointer;
    dataSize: ULONG;
  end;

const
  AniStep = 4;

var
  NxTaskbarCfgMainForm: TNxTaskbarCfgMainForm;
  StartOrbImage, TBLayoutImage,
  AppFolder, TBColor : String;
  FirstRun : Boolean = False;
  SelfKill : Boolean = False;
  isTaskbarSmall : Integer;
  HBoxBmp, HBarBmp, ABarBmp, ColorBmp: TBitmap;
  RGBColor: TRGB;
  RGBAlpha: Byte;
  HSBColor: THSB;
  ColorMode, CellMul, CellDiv: Byte;
  DoColor, DoBar, DoVar, DoLive, DoAlpha: Boolean;
  LUT138: array[0..138] of Byte;
  CTab: array[0..255] of TRGB;
  WebSafeColorLut: array[0..255] of Byte;
  VarIdx: Integer;
  AniCount: Integer;
  NewColor: TColor;
  OldColor: TColor;
  OldAlpha: Byte;
  BoxX, BoxY, BarX, BarA: Integer;
  LastHue: Integer;
  TextEnter: Boolean;
//  isLive : Boolean = True;

  function SetWindowCompositionAttribute(hWnd: HWND; var data: WindowCompositionAttributeData): Integer; stdcall;
    external User32 name 'SetWindowCompositionAttribute';
var
  SetWindowCompositionAttributes: function (Wnd: HWND; const AttrData: TWinCompAttrData): BOOL; stdcall = Nil;


implementation

{$R *.dfm}

uses
  ColorUtils;

function GetAccentColor:TColor;
var
  col: Cardinal;
  opaque: LongBool;
  newColor: TColor;
  a,r,g,b: byte;
begin
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

  Result := newcolor;
end;

function TNxTaskbarCfgMainForm.IsStartMenuVisible: Boolean;
var
  acc: IAppVisibility;
  res: HRESULT;
  isLauncherVisible: BOOL;
begin
  Result := False;
  // Initialization of COM is required to use the AppVisibility (CLSID_AppVisibility) object
  res := CoInitializeEx(nil, COINIT_APARTMENTTHREADED);
  if Succeeded(res) then
  begin
    // Create the App Visibility component
    res := CoCreateInstance(CLSID_AppVisibility, nil, CLSCTX_ALL, IID_AppVisibility, acc);
    if Succeeded(res) then
    begin
      res := acc.IsLauncherVisible(isLauncherVisible);
      if Succeeded(res) then
        Result := Boolean(isLauncherVisible);
    end;

  end;
  CoUninitialize;
end;

procedure TNxTaskbarCfgMainForm.RestoreOpacity(Handle: THandle);
var
  counter: UINT64;
begin
// hacky ugly way to restore opacity, it might fail if start menu is gone
    // bcoz, launching start menu restores opacity, but we need to hide it after
    SendMessageTimeout(Handle,WM_SYSCOMMAND,SC_TASKLIST,0,SMTO_ABORTIFHUNG, 3000, nil);
    counter := GetTickCount64;
    while (GetTickCount64 - counter < 3000) do
    begin
      if IsStartMenuVisible then
      begin
        SendMessage(Handle, WM_SYSCOMMAND, SC_TASKLIST, 0);
//        keybd_event(VK_LWIN, 0, 0, 0);
//        keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, 0);
        counter := counter - 3000;
      end;
      Sleep(1);
    end;
    // this restores secondary taskbars too
    SendNotifyMessage(HWND_BROADCAST, WM_SETTINGCHANGE, 0, LongInt(PChar('TraySettings')));
end;

procedure TNxTaskbarCfgMainForm.TransColor(wnd : HWND; col : Tcolor; Blur : Boolean = False);
var
  accent: AccentPolicy;
  dwm10: THandle;
  dataBlur : TWinCompAttrData;
  data: WindowCompositionAttributeData;
begin
  if Blur then begin
      dwm10 := LoadLibrary('user32.dll');
      try
        @SetWindowCompositionAttributes := GetProcAddress(dwm10, 'SetWindowCompositionAttribute');
        if @SetWindowCompositionAttribute <> nil then
        begin
          accent.AccentState := ACCENT_ENABLE_BLURBEHIND ;
          accent.GradientColor := col;
          accent.AccentFlags := DRAW_LEFT_BORDER or DRAW_TOP_BORDER or DRAW_RIGHT_BORDER or DRAW_BOTTOM_BORDER;
          dataBlur.Attribute := WCA_ACCENT_POLICY;
          dataBlur.dataSize := SizeOf(accent);
          dataBlur.pData := @accent;
          SetWindowCompositionAttributes(wnd, dataBlur);
        end
        else
        begin
          ShowMessage('Not found Windows 10 blur API');
        end;
      finally
        FreeLibrary(dwm10);
      end;
  end else begin
    accent.AccentState := ACCENT_ENABLE_TRANSPARENTGRADIENT;
    accent.GradientColor := col;
    accent.AccentFlags := $20 or $40 or $80 or $100;
    data.Attribute := WCA_ACCENT_POLICY;
    data.SizeOfData := SizeOf(accent);
    data.Data := @accent;
    SetWindowCompositionAttribute(wnd, data);
  end;
end;

function TNxTaskbarCfgMainForm.GetColor: TColor;
begin
  Result := RGB(RGBColor.r, RGBColor.g, RGBColor.b);
end;

procedure TNxTaskbarCfgMainForm.SetAlphaMode(const Value: Boolean);
begin
  FAlphaMode := Value;
  imgAlpha.Visible := FAlphaMode;
//  if FAlphaMode then
//  begin
//    labHex.Left := 144;
//    labHex.Caption := 'A';
//    AlphaColor.Left := 156;
//    AlphaColor.Width := 27;
//  end
//  else
//  begin
//    labHex.Left := 142;
//    labHex.Caption := '#';
//    AlphaColor.Left := 153;
//    AlphaColor.Width := 53;
//  end;
  AlphaColor.ReadOnly := not FAlphaMode;
end;

procedure TNxTaskbarCfgMainForm.SetColor(Color: TColor; Alpha: Byte; Update: Boolean);
begin
  RGBAlpha := Alpha;
  SetColor(Color, Update);
end;

procedure TNxTaskbarCfgMainForm.SetColor(Color: TColor; Update: Boolean);
var
  c: Integer;
  h, s, b: Word;
begin
  if not UpDate then
    OldColor := Color;
  c := ColorToRGB(Color);
  RGBColor.b := Byte(c shr 16);
  RGBColor.g := Byte(c shr 8);
  RGBColor.r := Byte(c);
  RGBtoHSB(RGBColor.r, RGBColor.g, RGBColor.b, h, s, b);
  BoxX := MulDiv(137, s, 255);
  BoxY := 137 - MulDiv(137, b, 255);
  BarX := MulDiv(192, h, 360);
  BarA := MulDiv(137, RGBAlpha, 255);
  LastHue := -1;
  PaintColorPnl;
end;

procedure TNxTaskbarCfgMainForm.PaintVar;
var
  x, y, i, j, k, q, h: Integer;
  col: TColor;
  cell: TRect;
  s: Double;
  mode16: Boolean;
begin
  mode16 := True;
  imgColorBox.Canvas.Brush.Color := clBlack;
  imgColorBox.Canvas.Rectangle(Canvas.ClipRect);
  // 16 or 64 mode ...
  if mode16 then
  begin
    CellMul := 4;
    CellDiv := 34;
    q := 8;
  end
  else
  begin
    CellMul := 8;
    CellDiv := 17;
    q := 32;
  end;
  s := 255 / (q - 1);
  j := (q * 2) - 1;
  h := MulDiv(360, BarX, 192);
  for i := 0 to q - 1 do
  begin
    k := Trunc(s * i);
    HSBtoRGB(h, k, 255, CTab[i].r, CTab[i].g, CTab[i].b);
    HSBtoRGB(h, 255, k, CTab[j - i].r, CTab[j - i].g, CTab[j - i].b);
  end;
  HBoxBmp.Canvas.Brush.Style := bsClear;
  HBoxBmp.Canvas.Brush.Color := clBlack;
  HBoxBmp.Canvas.Pen.Color := clBlack;
  HBoxBmp.Canvas.Rectangle(0, 0, 138, 138);
  HBoxBmp.Canvas.Brush.Style := bsSolid;
  for y := 0 to CellMul - 1 do
  begin
    for x := 0 to CellMul - 1 do
    begin
      i := (y * CellMul) + x;
      col := (cTab[i].b shl 16) + (cTab[i].g shl 8) + cTab[i].r;
      HBoxBmp.Canvas.Brush.Color := col;
      HBoxBmp.Canvas.Pen.Color := col;
      cell.Left := 1 + (x * CellDiv);
      cell.Top := 1 + (y * CellDiv);
      Cell.Right := Cell.Left + CellDiv - 2;
      Cell.Bottom := Cell.Top + CellDiv - 2;
      HBoxBmp.Canvas.Rectangle(Cell);
    end;
  end;
  imgColorBox.Canvas.Draw(1, 1, HBoxBmp);
end;

procedure TNxTaskbarCfgMainForm.PaintColorPnl;
begin
  NewColor := (RGBColor.b shl 16) + (RGBColor.g shl 8) + RGBColor.r;
  PaintHueBar;
  PaintAlphaBar;
  if DoVar then
    PaintVar
  else
    PaintColorHue;
  if FAlphaMode then
  begin
    PaintAlphaColor;
    imgColor.Canvas.Pen.Color := clBlack;
    imgColor.Canvas.Brush.Style := bsClear;
  end
  else
  begin
    imgColor.Canvas.Pen.Color := clBlack;
    imgColor.Canvas.Brush.Color := OldColor;
    imgColor.Canvas.Rectangle(0, 0, 22, 20);
    imgColor.Canvas.Brush.Color := NewColor;
    imgColor.Canvas.Rectangle(0, 19, 22, 39);
  end;
  if not TextEnter then
  begin
    editColor1.Text := IntToStr(RGBColor.r);
    editColor2.Text := IntToStr(RGBColor.g);
    editColor3.Text := IntToStr(RGBColor.b);
    AccentColor.Text := Format('%.2x%.2x%.2x%.2x',[RGBAlpha,RGBColor.b,RGBColor.g,RGBColor.r]);
    if FAlphaMode then
      AlphaColor.Text := IntToStr(RGBAlpha)
    else
      AlphaColor.Text := IntToHex(RGBColor.r, 2) + IntToHex(RGBColor.g, 2) +
        IntToHex(RGBColor.b, 2);
  end;
  if DoLive then
    PostMessage(Handle, CM_COLORUPDATE, OldColor, NewColor);
end;

procedure TNxTaskbarCfgMainForm.btnVarClick(Sender: TObject);
begin
  DoVar := btnVar.Down;
  LastHue := -1;
  PaintColorPnl;
end;

procedure TNxTaskbarCfgMainForm.AccentColorChange(Sender: TObject);
begin
//  if FirstRun then
//  if SetTBColor.Checked then
//    if TBLivePreview.Checked then begin
//      isLive := True;
//      TransColor(FindWindow('Shell_TrayWnd',nil),StringToAlphaColor('$'+AccentColor.Text));
//    end;
end;

procedure TNxTaskbarCfgMainForm.editColor1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  idx, i: Integer;
begin
  TextEnter := True;
  if Key = 13 then
  begin
    idx := (Sender as TEdit).Tag;
    case idx of
      0:
        begin
          i := StrToIntDef(editColor1.Text, -1);
          if (i >= 0) and (i <= 255) then
            RGBColor.r := i;
        end;
      1:
        begin
          i := StrToIntDef(editColor2.Text, -1);
          if (i >= 0) and (i <= 255) then
            RGBColor.g := i;
        end;
      2:
        begin
          i := StrToIntDef(editColor3.Text, -1);
          if (i >= 0) and (i <= 255) then
            RGBColor.b := i;
        end;
      3:
        begin
          if FAlphaMode then
          begin
            i := StrToIntDef(AlphaColor.Text, -1);
            if (i >= 0) and (i <= 255) then
            begin
              RGBAlpha := i;
              BarA := MulDiv(137, i, 255);
            end;
          end;
        end;
    end;
    AccentColor.Text := Format('%.2x%.2x%.2x%.2x',[RGBAlpha,RGBColor.b,RGBColor.g,RGBColor.r]);
    PaintColorPnl;
  end;
end;

procedure TNxTaskbarCfgMainForm.editColor1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) or (Key = #27) then
    Key := #0;
end;

procedure TNxTaskbarCfgMainForm.editColor1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  TextEnter := False;
end;

procedure TNxTaskbarCfgMainForm.imgAlphaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoAlpha := True;
  if y < 0 then
    Y := 0;
  if y > imgAlpha.Height - 1 then
    y := imgAlpha.Height - 1;
  BarA := Y;
  RGBAlpha := MulDiv(255, BarA, 137);
  PaintColorPnl;
end;

procedure TNxTaskbarCfgMainForm.imgAlphaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if not DoAlpha then
    Exit;
  if y < 0 then
    y := 0;
  if y > imgAlpha.Height - 1 then
    y := imgAlpha.Height - 1;
  BarA := Y;
  RGBAlpha := MulDiv(255, BarA, 137);
  PaintColorPnl;
end;

procedure TNxTaskbarCfgMainForm.imgAlphaMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoAlpha := False;
end;

procedure TNxTaskbarCfgMainForm.imgZBarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoBar := True;
  if x < 0 then
    x := 0;
  if x > imgZBar.Width - 1 then
    x := imgZBar.Width - 1;
  BarX := x;
  HSBtoRGB(MulDiv(360, BarX, 192), LUT138[BoxX], 255 - LUT138[BoxY],
    RGBColor.r, RGBColor.g, RGBColor.b);
  PaintcolorPnl;
end;

procedure TNxTaskbarCfgMainForm.imgZBarMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if not DoBar then
    Exit;
  if x < 0 then
    x := 0;
  if x > imgZBar.Width - 1 then
    x := imgZBar.Width - 1;
  BarX := x;
  HSBtoRGB(MulDiv(360, BarX, 192), LUT138[BoxX], 255 - LUT138[BoxY],
    RGBColor.r, RGBColor.g, RGBColor.b);
  PaintcolorPnl;
end;

procedure TNxTaskbarCfgMainForm.imgZBarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoBar := False;
end;

procedure TNxTaskbarCfgMainForm.imgColorBoxMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if DoVar then
  begin
    VarIdx := ((y div CellDiv) * CellMul) + (x div CellDiv);
    RGBColor.r := CTab[VarIdx].r;
    RGBColor.g := CTab[VarIdx].g;
    RGBColor.b := CTab[VarIdx].b;
    RGBtoHSB(RGBColor.r, RGBColor.g, RGBColor.b, HSBColor.h, HSBColor.s,
      HSBColor.b);
    BoxX := MulDiv(137, HSBColor.s, 255);
    BoxY := 137 - MulDiv(137, HSBColor.b, 255);
    PaintColorPnl;
    AniCount := AniStep;
    TimeAni.Enabled := VarIdx <> -1;
    Exit;
  end;
  DoColor := True;
  if x < 0 then
    x := 0;
  if x > imgColorBox.Width - 1 then
    x := imgColorBox.Width - 1;
  if y < 0 then
    y := 0;
  if y > imgColorBox.Height - 1 then
    y := imgColorBox.Height - 1;
  BoxX := x;
  BoxY := y;
  HSBtoRGB(MulDiv(360, BarX, 192), LUT138[BoxX], 255 - LUT138[BoxY],
    RGBColor.r, RGBColor.g, RGBColor.b);
  PaintcolorPnl;
end;

procedure TNxTaskbarCfgMainForm.imgColorBoxMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if not DoColor then
    Exit;
  if x < 0 then
    x := 0;
  if x > imgColorBox.Width - 1 then
    x := imgColorBox.Width - 1;
  if y < 0 then
    y := 0;
  if y > imgColorBox.Height - 1 then
    y := imgColorBox.Height - 1;
  BoxX := x;
  BoxY := y;
  HSBtoRGB(MulDiv(360, BarX, 192), LUT138[BoxX], 255 - LUT138[BoxY],
    RGBColor.r, RGBColor.g, RGBColor.b);
  PaintColorPnl;
end;

procedure TNxTaskbarCfgMainForm.imgColorBoxMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DoColor := False;
end;

procedure TNxTaskbarCfgMainForm.imgColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if y < 19 then
    SetColor(OldColor, OldAlpha, False);
end;

procedure TNxTaskbarCfgMainForm.imgPalMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  SetColor(imgPal.Canvas.Pixels[x, y], 255, True);
end;

procedure TNxTaskbarCfgMainForm.PaintColorHue;
var
  Row: PRGBArray;
  slMain, slSize, slPtr: Integer;
  x, y, w, h: Integer;
  m1, q1, q2, q3, s1, s2: Integer;
  r, g, b: Byte;
  LUT: array of Byte;
begin
  h := MulDiv(360, BarX, 192);
  if h <> LastHue then
  begin // Only update if needed
    LastHue := h;
    HSBtoRGB(h, 255, 255, r, g, b);
    h := HBoxBmp.Height - 1;
    w := HBoxBmp.Width - 1;
    SetLength(LUT, w);
    for x := 0 to w do
      LUT[x] := MulDiv(255, x, w);
    slMain := Integer(HBoxBmp.ScanLine[0]);
    slSize := Integer(HBoxBmp.ScanLine[1]) - slMain;
    slPtr := slMain;
    for y := 0 to h do
    begin
      s1 := LUT[y];
      m1 := s1 * -255 shr 8 + 255;
      q1 := (s1 * -r shr 8 + r) - m1; // Red
      q2 := (s1 * -g shr 8 + g) - m1; // Green
      q3 := (s1 * -b shr 8 + b) - m1; // Blue
      for x := 0 to w do
      begin
        s2 := LUT[x];
        Row := PRGBArray(slPtr);
        Row[x].r := Byte(s2 * q1 shr 8 + m1);
        Row[x].g := Byte(s2 * q2 shr 8 + m1);
        Row[x].b := Byte(s2 * q3 shr 8 + m1);
      end;
      slPtr := slPtr + slSize;
    end;
    LUT := nil;
  end;
  imgColorBox.Canvas.Draw(0, 0, HBoxBmp);
  ilMain.Draw(imgColorBox.Canvas, BoxX - 7, BoxY - 7, 0, True); // Paint Marker
end;

procedure TNxTaskbarCfgMainForm.PaintHueBar;
var
  Row: PRGBArray;
  x: Integer;
begin
  Row := PRGBArray(HBarBmp.ScanLine[0]);
  for x := 0 to HBarBmp.Width - 1 do
    HSBToRGB(MulDiv(360, x, 192), 255, 255, Row[x].r, Row[x].g, Row[x].b);
  imgZBar.Canvas.StretchDraw(Rect(0, 0, HBarBmp.Width, 18), HBarBmp);
  ilMain.Draw(imgZBar.Canvas, BarX - 7, 1, 0, True); // Paint Marker
end;

procedure TNxTaskbarCfgMainForm.PaintAlphaColor;
var
  Row: PRGBArray;
  RowOff: Integer;
  x, y, a: Integer;
  bool: Boolean;
  c1, c2, c3: TRGB;
begin
  c1.R := 0;
  c1.G := 0;
  c1.B := 0;
  c2.R := 255;
  c2.G := 255;
  c2.B := 255;
  Row := PRGBArray(ColorBmp.ScanLine[0]);
  RowOff := Integer(ColorBmp.ScanLine[1]) - Integer(ColorBmp.ScanLine[0]);
  a := 255 - OldAlpha;
  c3.b := Byte(OldColor shr 16);
  c3.g := Byte(OldColor shr 8);
  c3.r := Byte(OldColor);
  for y := 0 to ColorBmp.Height - 1 do
  begin
    bool := (y and 4 = 0);
    if y = 20 then
    begin
      a := 255 - RGBAlpha;
      c3.r := RGBColor.r;
      c3.g := RGBColor.g;
      c3.b := RGBColor.b;
    end;
    c1.R := a * (0 - c3.r) shr 8 + c3.r;
    c1.G := a * (0 - c3.g) shr 8 + c3.g;
    c1.B := a * (0 - c3.b) shr 8 + c3.b;
    c2.R := a * (255 - c3.r) shr 8 + c3.r;
    c2.G := a * (255 - c3.g) shr 8 + c3.g;
    c2.B := a * (255 - c3.b) shr 8 + c3.b;
    for x := 0 to ABarBmp.Width - 1 do
    begin
      if ((x + 1) mod 4 = 0) then
        bool := not bool;
      if bool then
        Row[x] := c1
      else
        Row[x] := c2;
    end;
    Row := PRGBArray(Integer(Row) + RowOff);
  end;
  imgColor.Canvas.Draw(0, 0, ColorBmp);
end;

procedure TNxTaskbarCfgMainForm.PaintAlphaBar;
var
  Row: PRGBArray;
  RowOff: Integer;
  x, y, a: Integer;
  bool: Boolean;
  c1, c2: TRGB;
begin
  c1.R := 0;
  c1.G := 0;
  c1.B := 0;
  c2.R := 255;
  c2.G := 255;
  c2.B := 255;
  Row := PRGBArray(ABarBmp.ScanLine[0]);
  RowOff := Integer(ABarBmp.ScanLine[1]) - Integer(ABarBmp.ScanLine[0]);
  for y := 0 to ABarBmp.Height - 1 do
  begin
    bool := (y and 4 = 0);
    a := 255 - MulDiv(255, y, 137);
    c1.R := a * (0 - RGBColor.r) shr 8 + RGBColor.r;
    c1.G := a * (0 - RGBColor.g) shr 8 + RGBColor.g;
    c1.B := a * (0 - RGBColor.b) shr 8 + RGBColor.b;
    c2.R := a * (255 - RGBColor.r) shr 8 + RGBColor.r;
    c2.G := a * (255 - RGBColor.g) shr 8 + RGBColor.g;
    c2.B := a * (255 - RGBColor.b) shr 8 + RGBColor.b;
    for x := 0 to ABarBmp.Width - 1 do
    begin
      if ((x + 1) mod 4 = 0) then
        bool := not bool;
      if bool then
        Row[x] := c1
      else
        Row[x] := c2;
    end;
    Row := PRGBArray(Integer(Row) + RowOff);
  end;
  imgAlpha.Canvas.Draw(0, 0, ABarBmp);
  ilMain.Draw(imgAlpha.Canvas, 11 - 8, BarA - 7, 0, True); // Paint Marker
end;

procedure TNxTaskbarCfgMainForm.timeAniTimer(Sender: TObject);
var
  x, y: Integer;
  c: Integer;
begin
  AniCount := AniCount - 1;
  if VarIdx <> -1 then
  begin
    y := (VarIdx div CellMul);
    x := (VarIdx - (CellMul * y));
    x := CellDiv * x;
    y := CellDiv * y;
    c := (CTab[VarIdx].b shl 16) + (CTab[VarIdx].g shl 8) + CTab[VarIdx].r;
    if VarIdx < 8 then
      c := Blend(clBlack, c, Trunc(AniCount * (100 / AniStep)))
    else
      c := Blend(clWhite, c, Trunc(AniCount * (100 / AniStep)));
    HBoxBmp.Canvas.Pen.Color := c;
    HBoxBmp.Canvas.Brush.Color := c;
    HBoxBmp.Canvas.Brush.Style := bsSolid;
    HBoxBmp.Canvas.Rectangle(x + 1, y + 1, x + CellDiv - 1, y + CellDiv - 1);
    imgColorBox.Canvas.Draw(1, 1, HBoxBmp);
  end;
  timeAni.Enabled := (AniCount > 0) or (VarIdx = -1);
end;

function GetDosOutput(CommandLine: string; Work: string = 'C:\'): string;
var
  SA: TSecurityAttributes;
  SI: TStartupInfo;
  PI: TProcessInformation;
  StdOutPipeRead, StdOutPipeWrite: THandle;
  WasOK: Boolean;
  Buffer: array[0..255] of AnsiChar;
  BytesRead: Cardinal;
  WorkDir: string;
  Handle: Boolean;
begin
  Result := '';
  with SA do begin
    nLength := SizeOf(SA);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;
  CreatePipe(StdOutPipeRead, StdOutPipeWrite, @SA, 0);
  try
    with SI do
    begin
      FillChar(SI, SizeOf(SI), 0);
      cb := SizeOf(SI);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_HIDE;
      hStdInput := GetStdHandle(STD_INPUT_HANDLE); // don't redirect stdin
      hStdOutput := StdOutPipeWrite;
      hStdError := StdOutPipeWrite;
    end;
    WorkDir := Work;
    Handle := CreateProcess(nil, PChar('cmd.exe /C ' + CommandLine),
                            nil, nil, True, 0, nil,
                            PChar(WorkDir), SI, PI);
    CloseHandle(StdOutPipeWrite);
    if Handle then
      try
        repeat
          WasOK := ReadFile(StdOutPipeRead, Buffer, 255, BytesRead, nil);
          if BytesRead > 0 then
          begin
            Buffer[BytesRead] := #0;
            Result := Result + Buffer;
          end;
        until not WasOK or (BytesRead = 0);
        WaitForSingleObject(PI.hProcess, INFINITE);
      finally
        CloseHandle(PI.hThread);
        CloseHandle(PI.hProcess);
      end;
  finally
    CloseHandle(StdOutPipeRead);
  end;
end;

procedure TNxTaskbarCfgMainForm.CheckAutoRunWindows;
begin
  if Pos('ERROR',GetDosOutput('schtasks /query /tn "NxTaskbar"','c:\windows')) <> 0 then begin
    FirstRun := false;
    AutoRunWindows.Checked := False;
    FirstRun := True;
  end else
  if Pos('NxTaskbar', GetDosOutput('schtasks /query /tn "NxTaskbar"','c:\windows')) <> 0 then begin
    FirstRun := False;
    AutoRunWindows.Checked := True;
    FirstRun := True;
  end;
end;

procedure TNxTaskbarCfgMainForm.CheckSmallTaskbarIcon;
var
  reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    reg.OpenKeyReadOnly('SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced');
    if reg.ReadInteger('TaskbarSmallIcons') = 1 then begin
      FirstRun := False;
      SmallTaskbar.Checked := True;
      isTaskbarSmall := 1;
      FirstRun := True;
    end else begin
      FirstRun := False;
      SmallTaskbar.Checked := False;
      isTaskbarSmall := 0;
      FirstRun := True;
    end;
  finally
    reg.Free;
  end;
end;

procedure TNxTaskbarCfgMainForm.SaveINI;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(AppFolder+'settings.ini');
  try
    ini.WriteString('NxTaskbar','OrbImage', StartOrbImage);
    ini.WriteString('NxTaskbar','LayoutImage',TBLayoutImage);
    ini.WriteString('NxTaskbar','TBColor',AccentColor.Text);
//    ini.WriteString('NxTaskbar','BlurAlphaColor',AlphaColor.Text);
    ini.WriteBool('NxTaskbar','CustomPowerOption', CustomPowerOption.Checked);
    ini.WriteBool('NxTaskbar','CustomStartOrb', CustomStartOrb.Checked);
    ini.WriteBool('NxTaskbar','CustomStartMenu', CustomStartMenu.Checked);
    ini.WriteBool('NxTaskbar','DisableWinKey',DisableWinKey.Checked);
    ini.WriteBool('NxTaskbar','AlwaysOnTop',AlwaysOnTop.Checked);
    ini.WriteBool('NxTaskbar','CenterTaskbarApps',CenterTaskbarApps.Checked);
    ini.WriteBool('NxTaskbar','CenterTaskbarAppsRelative',CenterTaskbarAppsRelative.Checked);
    ini.WriteBool('NxTaskbar','TaskbarTransparent',TaskbarTransparent.Checked);
    ini.WriteBool('NxTaskbar','CustomizeTaskbar',CustomizeTaskbar.Checked);
    ini.WriteBool('NxTaskbar','SetTBLayout',SetTBLayout.Checked);
    ini.WriteBool('NxTaskbar','SetTBColor',SetTBColor.Checked);
    ini.WriteBool('NxTaskbar','SetTBBlur',SetTBBlur.Checked);
    ini.WriteBool('NxTaskbar','SetTBArcylic',SetTBArcylic.Checked);
  finally
    ini.Free;
  end;
end;

procedure TNxTaskbarCfgMainForm.LoadINI;
var
  ini: TIniFile;
  CPO,CSO,CSM,DWK,AOT,CT,CTR,TT,CTC,STL,STC,STB,STA : Boolean;
begin
  ini := TIniFile.Create(AppFolder+'settings.ini');
  try
    StartOrbImage := ini.ReadString('NxTaskbar','OrbImage',AppFolder+'Orbs/kali-start-orb.bmp');
    TBLayoutImage := ini.ReadString('NxTaskbar','LayoutImage',AppFolder+'Layout/carbon.png');
    TBColor       := ini.ReadString('NxTaskbar','TBColor','FF000000');
//    BlurAlphaColor := ini.ReadString('NxTaskbar','BlurAlphaColor','255');
    CPO := ini.ReadBool('NxTaskbar','CustomPowerOption',False);
    CSO := ini.ReadBool('NxTaskbar','CustomStartOrb',True);
    CSM := ini.ReadBool('NxTaskbar','CustomStartMenu',False);
    DWK := ini.ReadBool('NxTaskbar','DisableWinKey',False);
    AOT := ini.ReadBool('NxTaskbar','AlwaysOnTop',False);
    CT  := ini.ReadBool('NxTaskbar','CenterTaskbarApps',False);
    CTR := ini.ReadBool('NxTaskbar','CenterTaskbarAppsRelative',False);
    TT  := ini.ReadBool('NxTaskbar','TaskbarTransparent',False);
    CTC := ini.ReadBool('NxTaskbar','CustomizeTaskbar',False);
    STL := ini.ReadBool('NxTaskbar','SetTBLayout',False);
    STC := ini.ReadBool('NxTaskbar','SetTBColor',False);
    STB := ini.ReadBool('NxTaskbar','SetTBBlur',False);
    STA := ini.ReadBool('NxTaskbar','SetTBArcylic',False);

    CustomPowerOption.Checked := CPO;
    CustomStartOrb.Checked := CSO;
    TabStartOrb.TabVisible := CSO;
    CustomStartMenu.Checked := CSM;
    TabStartMenu.TabVisible := CSM;
    if CSM = false then begin
      DisableWinKey.Enabled := CSM;
      DisableWinKey.Checked := CSM;
    end else begin
      DisableWinKey.Checked := DWK;
    end;
    CenterTaskbarApps.Checked := CT;
    if CT = False then begin
      CenterTaskbarAppsRelative.Checked := CT;
      CenterTaskbarAppsRelative.Enabled := CT;
    end else begin
      CenterTaskbarAppsRelative.Checked := CTR;
    end;
    AlwaysOnTop.Checked := AOT;
    CustomizeTaskbar.Checked := CTC;
    TabTaskbarColor.TabVisible := CTC;
    if CTC = True then begin
      TaskbarTransparent.Checked := False;
      TaskbarTransparent.Enabled := False;
    end else begin
      TaskbarTransparent.Checked := TT;
      TBLayoutList.Active :=  CTC;
      TBLayoutList.Clear;
      PanelBtnLayout.Enabled := False;
      PanelColor.Enabled := False;
      SetTBLayout.Checked := CTC;
      SetTBColor.Checked := CTC;
      SetTBBlur.Checked := CTC;
      SetTBArcylic.Checked := CTC;
    end;
    if CTC then SetTBLayout.Checked := STL;
    if STL then begin
      TBLayoutList.Active :=  True;
      TBLayoutList.RootFolderCustomPath := ExtractFilePath(Application.ExeName)+'Layout';
      PanelBtnLayout.Enabled := True;
      PanelColor.Enabled := False;
    end else begin
      TBLayoutList.Active :=  False;
      TBLayoutList.Clear;
      PanelBtnLayout.Enabled := False;
    end;
    if CTC then SetTBColor.Checked := STC;
    if STC then begin
      TBLayoutList.Active :=  False;
      TBLayoutList.Clear;
      PanelBtnLayout.Enabled := False;
      PanelColor.Enabled := True;
    end else begin
      if STL then
        PanelColor.Enabled := False
        else
        PanelColor.Enabled := True;
    end;
    if CTC then SetTBBlur.Checked := STB;
    if STB then begin
      TBLayoutList.Active :=  False;
      TBLayoutList.Clear;
      PanelBtnLayout.Enabled := False;
      PanelColor.Enabled := True;
    end;
    if CTC then SetTBArcylic.Checked := STA;
    if STA then begin
      TBLayoutList.Active :=  False;
      TBLayoutList.Clear;
      PanelBtnLayout.Enabled := False;
      PanelColor.Enabled := True;
    end;
  finally
    ini.Free;
  end;
end;

procedure AddOrbImage;
var
  selectedFile: string;
  dlg: TOpenDialog;
  bmp : TBitmap;
  png : TPngImage;
begin
  bmp := TBitmap.Create;
  selectedFile := '';
  dlg := TOpenDialog.Create(nil);
  try
    dlg.InitialDir := ExtractFilePath(Application.ExeName)+'Orbs';
    dlg.Filter := 'bmp/png image(*.bmp;*.png)|*.bmp;*.png';
    if dlg.Execute(NxTaskbarCfgMainForm.Handle) then
      selectedFile := dlg.FileName;
    if selectedFile <> '' then begin
      if ExtractFileExt(selectedFile) = '.png' then begin
        png := TPngImage.Create;
        png.LoadFromFile(selectedFile);
        bmp.Assign(png);
        bmp.PixelFormat := pf32Bit;
        bmp.HandleType :=  bmDIB;
        bmp.alphaformat := afDefined;
      end else begin
        bmp.LoadFromFile(selectedFile);
      end;

        if (bmp.Width <> 54) and
          (bmp.Height <> 162) then
        begin
          ShowMessage('Image Size must be 54x162 pixel, Png / bmp Image !');
        end else begin
          bmp.SaveToFile(dlg.InitialDir+'/'+ ExtractFileName(selectedFile));
          NxTaskbarCfgMainForm.OrbList.BeginUpdate;
          NxTaskbarCfgMainForm.OrbList.Clear;
          NxTaskbarCfgMainForm.OrbList.RootFolderCustomPath := ExtractFilePath(Application.ExeName)+'Orbs';
          NxTaskbarCfgMainForm.OrbList.EndUpdate();
          NxTaskbarCfgMainForm.OrbList.Refresh;
        end;
    end;
  finally
    dlg.Free;
  end;
end;

procedure DeleteOrbImage;
begin
  try
  if NxTaskbarCfgMainForm.OrbList.SelectedPath <> '' then begin
    if MessageDlg('Delete ' + NxTaskbarCfgMainForm.OrbList.SelectedFile + '?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      if NxTaskbarCfgMainForm.OrbList.SelectedPath <> StartOrbImage then begin
        if DeleteFile(NxTaskbarCfgMainForm.OrbList.SelectedPath) then begin
            NxTaskbarCfgMainForm.OrbList.BeginUpdate;
            NxTaskbarCfgMainForm.OrbList.Clear;
            NxTaskbarCfgMainForm.OrbList.RootFolderCustomPath := ExtractFilePath(Application.ExeName)+'Orbs';
            NxTaskbarCfgMainForm.OrbList.EndUpdate();
            NxTaskbarCfgMainForm.OrbList.Refresh;
            NxTaskbarCfgMainForm.ImagePreview.Picture.Assign(nil);
        end;
      end else begin
        ShowMessage('Orb Image In Use !! Delete Failed');
      end;
  end else begin
    ShowMessage('Select Orb to Delete !');
  end;
  finally
    ;
  end;
end;

procedure ServiceNotRunnings(Handle : TEsSwitch;Status : Boolean);
begin
    if MessageBox(Application.Handle,
      'NxTaskbar Service is not Running!!'+#13#10+
      'Changed Setting will not have affect until service is Running.'+#13#10+
      'Start Service Now ?',
      'Service Not Found!!', MB_ICONWARNING or MB_YESNO) = ID_YES
    then
    begin
      FirstRun := False;
      ShellExecute(0, 'open', PChar(ExtractFilePath(Application.ExeName) + 'NxTaskbarEx.exe'), nil, nil, SW_SHOWNORMAL);
      FirstRun := true;
      Sleep(1000);
      Handle.Checked := Status;
      Handle.OnClick(Handle);
    end else begin
      FirstRun :=  False;
      Handle.Checked := Not Status;
      FirstRun := True;
    end;
end;

procedure ServiceNotRunning(Handle : TButton);
begin
    if MessageBox(Application.Handle,
      'NxTaskbar Service is not Running!!'+#13#10+
      'Changed Setting will not have affect until service is Running.'+#13#10+
      'Start Service Now ?',
      'Service Not Found!!', MB_ICONWARNING or MB_YESNO) = ID_YES
    then
    begin
      FirstRun := False;
      ShellExecute(0, 'open', PChar(ExtractFilePath(Application.ExeName) + 'NxTaskbarEx.exe'), nil, nil, SW_SHOWNORMAL);
      FirstRun := true;
      Sleep(2000);
      Handle.OnClick(Handle);
    end;
end;

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

procedure TNxTaskbarCfgMainForm.AddOrbClick(Sender: TObject);
begin
  AddOrbImage;
end;

procedure TNxTaskbarCfgMainForm.AlwaysOnTopClick(Sender: TObject);
begin
  if AlwaysOnTop.Checked then
    NxTaskbarCfgMainForm.FormStyle := fsStayOnTop
    else
    NxTaskbarCfgMainForm.FormStyle := fsNormal;
  if FirstRun then SaveINI;
end;

procedure TNxTaskbarCfgMainForm.ApplyCustomTBClick(Sender: TObject);
var
  TempImg : TImage;
  R: TRecordData;
begin
  if processExists('NxTaskbarEx.exe') then begin
    if SetTBLayout.Checked then begin
      TempImg := TImage.Create(Self);
      try
        if TBLayoutList.SelectedPath <> '' then begin
          TBLayoutImage := TBLayoutList.SelectedPath;
          R.Number := 0;
          R.Text := TBLayoutImage;
          R.Flag := True;
          if FirstRun then TA.Send(20051,@R,SizeOf(R));
        end else begin
          ShowMessage('No Layout Selected .. Select Layout First !!');
        end;
      finally
        TempImg.Free;
      end;
    end else
    if SetTBColor.Checked then begin
      R.Number := 1;
      R.Text := AccentColor.Text;
      R.Flag := True;
      if FirstRun then TA.Send(20052,@R,SizeOf(R));
    end else
    if SetTBBlur.Checked then begin
      R.Number := 2;
      R.Text := AccentColor.Text;
      R.Flag := True;
      if FirstRun then TA.Send(20053,@R,SizeOf(R));
    end else
    if SetTBArcylic.Checked then begin
      R.Number := 3;
      R.Text := AccentColor.Text;
      R.Flag := True;
      if FirstRun then TA.Send(20054,@R,SizeOf(R));
    end else
    if (not SetTBLayout.Checked) and
       (not SetTBColor.Checked) and
       (not SetTBBlur.Checked) and
       (not SetTBArcylic.Checked) then begin
          ShowMessage('Please Select one Taskbar Custom Type.');
    end;
  end else begin
    if FirstRun then ServiceNotRunning(ApplyCustomTB);
  end;
  if FirstRun then SaveINI;
end;

procedure TNxTaskbarCfgMainForm.ApplyOrbsClick(Sender: TObject);
var
  TempImg : TImage;
  R: TRecordData;
begin
  if processExists('NxTaskbarEx.exe') then begin
  if CustomStartOrb.Checked = false then begin
    ShowMessage('Custom Start Orb is not active!!' + #13 + 'Cannot Change Start Orb.');
  end else begin
    TempImg := TImage.Create(Self);
    try
      if OrbList.SelectedPath <> '' then begin
        StartOrbImage := OrbList.SelectedPath;
        TempImg.Picture.LoadFromFile(StartOrbImage);
        if (TempImg.Picture.Bitmap.Width <> 54) and
          (TempImg.Picture.Bitmap.Height <> 162) then begin
          ShowMessage('Image Size must be 54x162 pixel, Png / bmp Image !');
        end else begin
          R.Number := 1;
          R.Text := StartOrbImage;
          R.Flag := True;
          if FirstRun then TA.Send(1010,@R,SizeOf(R));
  //        ChangeNxStartButton(StartOrbImage);
          if FirstRun then SaveINI;
        end;
      end else begin
        ShowMessage('No Orb Selected .. Select Orb First !!');
      end;
    finally
      TempImg.Free;
    end;
  end;
  end else begin
    if FirstRun then ServiceNotRunning(ApplyOrbs);
  end;
end;

procedure TNxTaskbarCfgMainForm.CustomPowerOptionClick(Sender: TObject);
begin
  if CustomPowerOption.Checked = True then begin
    if processExists('NxTaskbarEx.exe') then begin
      if FirstRun then TA.Send(1005);
    end else begin
      if FirstRun then ServiceNotRunnings(CustomPowerOption,True);
    end;
  end
    else
      begin
    if processExists('NxTaskbarEx.exe') then begin
        if FirstRun then TA.Send(1006);
    end else begin
      if FirstRun then ServiceNotRunnings(CustomPowerOption,False);
    end;
  end;
  if FirstRun then SaveINI;
end;

procedure TNxTaskbarCfgMainForm.CustomStartOrbClick(Sender: TObject);
begin
  if CustomStartOrb.Checked = True then begin
    TabStartOrb.TabVisible := True;
    if processExists('NxTaskbarEx.exe') then begin
      if FirstRun then TA.Send(1001);
    end else begin
      if FirstRun then ServiceNotRunnings(CustomStartOrb,True);
    end;
  end else begin
    TabStartOrb.TabVisible := False;
    if processExists('NxTaskbarEx.exe') then begin
      if FirstRun then TA.Send(1002);
    end else begin
      if FirstRun then ServiceNotRunnings(CustomStartOrb,False);
    end;
  end;
  if FirstRun then SaveINI;
end;

procedure TNxTaskbarCfgMainForm.CustomStartMenuClick(Sender: TObject);
begin
  if CustomStartMenu.Checked = True then begin
    TabStartMenu.TabVisible := True;
    DisableWinKey.Enabled := True;
    if processExists('NxTaskbarEx.exe') then begin
      if FirstRun then TA.Send(1003);
    end else begin
      if FirstRun then ServiceNotRunnings(CustomStartMenu,True);
    end;
  end else begin
    TabStartMenu.TabVisible := False;
    DisableWinKey.Enabled := False;
    DisableWinKey.Checked := False;
    if processExists('NxTaskbarEx.exe') then begin
      if FirstRun then TA.Send(1004);
    end else begin
      if FirstRun then ServiceNotRunnings(CustomStartMenu,False);
    end;
  end;
  if FirstRun then SaveINI;
end;

procedure TNxTaskbarCfgMainForm.DisableWinKeyClick(Sender: TObject);
begin
  if DisableWinKey.Checked = True then begin
    if processExists('NxTaskbarEx.exe') then begin
      if FirstRun then TA.Send(10031);
    end else begin
      if FirstRun then ServiceNotRunnings(DisableWinKey,True);
    end;
  end else begin
    if processExists('NxTaskbarEx.exe') then begin
      if FirstRun then TA.Send(10041);
    end else begin
      if FirstRun then ServiceNotRunnings(DisableWinKey,False);
    end;
  end;
end;

procedure TNxTaskbarCfgMainForm.AutoRunWindowsClick(Sender: TObject);
var
  R : TRecordData;
begin
  R.Number := 1;
  R.Text := 'NxTaskbar';

  if AutoRunWindows.Checked = True then begin
  R.Flag := True;
    if processExists('NxTaskbarEx.exe') then begin
      if FirstRun then TA.Send(1011,@R,SizeOf(R));
    end else begin
      if FirstRun then ServiceNotRunnings(AutoRunWindows,True);
    end;
  end
  else
  begin
  R.Flag := False;
    if processExists('NxTaskbarEx.exe') then begin
      if FirstRun then TA.Send(1011,@R,SizeOf(R));
    end else begin
      if FirstRun then ServiceNotRunnings(AutoRunWindows,False);
    end;
  end;
end;

procedure TNxTaskbarCfgMainForm.CenterTaskbarAppsClick(Sender: TObject);
var
  R : TRecordData;
begin
  R.Number := 1;
  if CenterTaskbarApps.Checked = True then begin
    CenterTaskbarAppsRelative.Enabled := True;
    R.Text := 'True';
    R.Flag := False;
    if processExists('NxTaskbarEx.exe') then begin
      if FirstRun then TA.Send(2001,@R,SizeOf(R));
    end else begin
      if FirstRun then ServiceNotRunnings(CenterTaskbarApps,True);
    end;
  end
  else
  begin
    CenterTaskbarAppsRelative.Enabled := False;
    CenterTaskbarAppsRelative.Checked := False;
    R.Text := 'False';
    R.Flag := False;
    if processExists('NxTaskbarEx.exe') then begin
      if FirstRun then TA.Send(2001,@R,SizeOf(R));
    end else begin
      if FirstRun then ServiceNotRunnings(CenterTaskbarApps,False);
    end;
  end;
end;

procedure TNxTaskbarCfgMainForm.CenterTaskbarAppsRelativeClick(Sender: TObject);
var
  R : TRecordData;
begin
  R.Number := 1;
  if CenterTaskbarAppsRelative.Checked = True then begin
    if CenterTaskbarApps.Checked = True then
      R.Text := 'True'
      else
        R.Text := 'False';
    R.Flag := True;
    if processExists('NxTaskbarEx.exe') then begin
      if FirstRun then TA.Send(2001,@R,SizeOf(R));
    end else begin
      if FirstRun then ServiceNotRunnings(CenterTaskbarAppsRelative,True);
    end;
  end
  else
  begin
    if CenterTaskbarApps.Checked = True then
      R.Text := 'True'
      else
        R.Text := 'False';
    R.Flag := False;
    if processExists('NxTaskbarEx.exe') then begin
      if FirstRun then TA.Send(2001,@R,SizeOf(R));
    end else begin
      if FirstRun then ServiceNotRunnings(CenterTaskbarAppsRelative,False);
    end;
  end;
end;

procedure TNxTaskbarCfgMainForm.TaskbarTransparentClick(Sender: TObject);
begin
  if TaskbarTransparent.Checked = True then begin
    if processExists('NxTaskbarEx.exe') then begin
      if FirstRun then TA.Send(2003);
    end else begin
      if FirstRun then ServiceNotRunnings(TaskbarTransparent,True);
    end;
  end
    else
      begin
    if processExists('NxTaskbarEx.exe') then begin
        if FirstRun then TA.Send(2004);
    end else begin
      if FirstRun then ServiceNotRunnings(TaskbarTransparent,False);
    end;
  end;
  if FirstRun then SaveINI;
end;

procedure TNxTaskbarCfgMainForm.CustomizeTaskbarClick(Sender: TObject);
var
  R : TRecordData;
begin
  R.Number := 1;
  R.Text := 'NxTaskbar';
  if CustomizeTaskbar.Checked = True then begin
    R.Flag := True;
    TabTaskbarColor.TabVisible := True;
    TaskbarTransparent.Checked := False;
    TaskbarTransparent.Enabled := False;
    if processExists('NxTaskbarEx.exe') then begin
      if FirstRun then TA.Send(2005,@R,SizeOf(R));
    end else begin
      if FirstRun then ServiceNotRunnings(CustomizeTaskbar,True);
    end;
  end else begin
    R.Flag := False;
    TabTaskbarColor.TabVisible := False;
    TaskbarTransparent.Enabled := True;
    TBLayoutList.Active :=  False;
    TBLayoutList.Clear;
    PanelBtnLayout.Enabled := False;
    PanelColor.Enabled := False;
    SetTBLayout.Checked := False;
    SetTBColor.Checked := false;
    SetTBBlur.Checked := False;
    SetTBArcylic.Checked := False;
    if processExists('NxTaskbarEx.exe') then begin
      if FirstRun then TA.Send(2005,@R,SizeOf(R));
    end else begin
      if FirstRun then ServiceNotRunnings(CustomizeTaskbar,False);
    end;
    RestoreOpacity(FindWindow('Shell_TrayWnd',nil));
  end;
  if FirstRun then SaveINI;
end;

procedure TNxTaskbarCfgMainForm.SetTBLayoutClick(Sender: TObject);
begin
  if SetTBLayout.Checked then begin
    TBLayoutList.Active :=  True;
    TBLayoutList.RootFolderCustomPath := ExtractFilePath(Application.ExeName)+'Layout';
    PanelBtnLayout.Enabled := True;
    PanelColor.Enabled := False;
  end;
end;

procedure TNxTaskbarCfgMainForm.SetTBColorClick(Sender: TObject);
begin
  if SetTBColor.Checked then begin
//    if FirstRun then
//      if FindWindow('NxTaskbarLayout','NxTBLayout') <> 0 then
//        TA.Send(22222); //close taskbar layout to apply live preview color
    TBLayoutList.Active :=  False;
    TBLayoutList.Clear;
    PanelBtnLayout.Enabled := False;
    PanelColor.Enabled := True;
  end;
end;

procedure TNxTaskbarCfgMainForm.SetTBBlurClick(Sender: TObject);
begin
  if SetTBBlur.Checked then begin
    TBLayoutList.Active :=  False;
    TBLayoutList.Clear;
    PanelBtnLayout.Enabled := False;
    PanelColor.Enabled := True;
  end;
end;

procedure TNxTaskbarCfgMainForm.SetTBArcylicClick(Sender: TObject);
begin
  if SetTBArcylic.Checked then begin
    TBLayoutList.Active :=  False;
    TBLayoutList.Clear;
    PanelBtnLayout.Enabled := False;
    PanelColor.Enabled := True;
  end;
end;

procedure TNxTaskbarCfgMainForm.TimerCheckTBsizeChangeTimer(Sender: TObject);
var
  Reg: TRegistry;
  RegKey: DWORD;
  Key: string;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    Key := 'Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced';
    if Reg.OpenKeyReadOnly(Key) then
    begin
      if Reg.ValueExists('TaskbarSmallIcons') then
      begin
        RegKey := Reg.ReadInteger('TaskbarSmallIcons');
        Reg.CloseKey;
        if RegKey <> isTaskbarSmall then begin
          isTaskbarSmall := RegKey;
          if RegKey = 1 then begin
            FirstRun := False;
            SmallTaskbar.Checked := True;
            FirstRun := True;
          end else begin
            FirstRun := False;
            SmallTaskbar.Checked := False;
            FirstRun := True;
          end;
        end;
      end;
    end;
  finally
    Reg.Free
  end;
end;

procedure TNxTaskbarCfgMainForm.SmallTaskbarClick(Sender: TObject);
var
  R : TRecordData;
begin
  R.Number := 1;
  R.Text := 'NxTaskbar';

  if SmallTaskbar.Checked = True then begin
  R.Flag := True;
    if processExists('NxTaskbarEx.exe') then begin
      if FirstRun then begin
        TimerCheckTBsizeChange.Enabled := false;
        TA.Send(2002,@R,SizeOf(R));
        TimerCheckTBsizeChange.Enabled := True;
      end;
    end else begin
      if FirstRun then ServiceNotRunnings(SmallTaskbar,True);
    end;
  end
  else
  begin
  R.Flag := False;
    if processExists('NxTaskbarEx.exe') then begin
      if FirstRun then begin
        TimerCheckTBsizeChange.Enabled := false;
        TA.Send(2002,@R,SizeOf(R));
        TimerCheckTBsizeChange.Enabled := True;
      end;
    end else begin
      if FirstRun then ServiceNotRunnings(SmallTaskbar,False);
    end;
  end;
end;

procedure TNxTaskbarCfgMainForm.DelOrbClick(Sender: TObject);
begin
  DeleteOrbImage;
end;

procedure TNxTaskbarCfgMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FirstRun then saveINI;
  ImagePreview.Picture := nil;
  Action := caFree;
end;

procedure TNxTaskbarCfgMainForm.FormCreate(Sender: TObject);
const
  Colors: array[0..15] of TColor = (clBlack, clWhite, clGray, clSilver,
    clMaroon, clRed, clGreen, clLime, clOlive, clYellow, clNavy, clBlue,
    clPurple, clFuchsia, clTeal, clAqua);
var
  T,ST  : TRect;
  TB,TS :HWND;
  i, j: Integer;
  col: Cardinal;
  opaque: LongBool;
begin
  TB := FindWindow('Shell_TrayWnd',nil);
  TS := FindWindowEx(TB,0,'Start',nil);
  GetWindowRect(TB,T);
  GetWindowRect(TS,ST);
  if ParamStr(1) <> '-OpenNxConfig' then begin
    ShellExecute(0, 'open', PChar(ExtractFilePath(Application.ExeName) + 'NxTaskbarEx.exe'), nil, nil, SW_SHOWNORMAL);
    SelfKill := true;
  end else begin
    Application.MainFormOnTaskbar := True;
    Application.ShowMainForm := True;

    TStyleManager.TrySetStyle('Carbon');

    AppFolder := ExtractFilePath(Application.ExeName);
    OrbList.RootFolderCustomPath := ExtractFilePath(Application.ExeName)+'Orbs';
    ShowWindow(Application.Handle, SW_HIDE);
    LoadINI;

    ImagePreview.Picture.LoadFromFile(StartOrbImage);
    PanelPreview.Width := Width;
    PanelPreview.Height := BarPreview.Height;

    BoxPreviewImage.Width := 40;
    BoxPreviewImage.Height := 40;
    BoxPreviewImage.Top := (PanelPreview.Height - BoxPreviewImage.Height) div 2;
    BoxPreviewImage.Left := 0;

    ImagePreview.Top := (BoxPreviewImage.Height - 54) div 2;
    ImagePreview.Left := (BoxPreviewImage.Width - 54) div 2;
    LabelPreview.Top := (PanelPreview.Height - LabelPreview.Top) div 2;

    ApplyOrbs.Left := (PanelPreview.Width - ApplyOrbs.Width) div 2;
    ApplyOrbs.Top := (PanelPreview.Height - ApplyOrbs.Height) div 2;
    RefreshList.Top := (PanelPreview.Height - RefreshList.Height) div 2;
    AddOrb.Top := (PanelPreview.Height - AddOrb.Height) div 2;
    DelOrb.Top := (PanelPreview.Height - AddOrb.Height) div 2;

    HBoxBmp := TBitmap.Create;
    HBoxBmp.PixelFormat := pf24bit;
    HBoxBmp.Width := 138;
    HBoxBmp.Height := 138;
    HBarBmp := TBitmap.Create;
    HBarBmp.PixelFormat := pf24bit;
    HBarBmp.Width := 193;
    HBarBmp.Height := 1;
    ABarBmp := TBitmap.Create;
    ABarBmp.PixelFormat := pf24bit;
    ABarBmp.Width := 22;
    ABarBmp.Height := 138;
    ColorBmp := TBitmap.Create;
    ColorBmp.PixelFormat := pf24bit;
    ColorBmp.Width := 22;
    ColorBmp.Height := 40;
    Alphamode := True;
    Randomize;
    if TBColor = 'FF000000' then begin
      DwmGetColorizationColor(col, opaque);
      RGBColor.r := Byte(col shr 16);//Random(255);
      RGBColor.g := Byte(col shr 8);//Random(255);
      RGBColor.b := Byte(col);//Random(255);
      RGBAlpha := Byte(col shr 24);//Random(255);
    end else begin
      RGBColor.r := StrToInt('$' + Copy(TBColor,7,2)); //Byte(col shr 16);//Random(255);
      RGBColor.g := StrToInt('$' + Copy(TBColor,5,2)); //Byte(col shr 8);//Random(255);
      RGBColor.b := StrToInt('$' + Copy(TBColor,3,2)); //Byte(col);//Random(255);
      RGBAlpha := StrToInt('$' + Copy(TBColor,1,2)); //Byte(col shr 24);//Random(255);
    end;
    OldColor := (RGBColor.b shl 16) + (RGBColor.g shl 8) + RGBColor.r;
    OldAlpha := RGBAlpha;
    SetColor((RGBColor.b shl 16) + (RGBColor.g shl 8) + (RGBColor.r), RGBAlpha,
      False);
    for i := 0 to 255 do
      WebSafeColorLut[I] := ((I + $19) div $33) * $33;
    for i := 0 to 137 do
      Lut138[i] := MulDiv(255, i, 137);
    DoColor := False;
    DoBar := False;
    DoVar := False;
    DoLive := False;
    VarIdx := -1;
    LastHue := -1;
    PaintColorPnl;
    // Paint 16 colors palette
    i := 0;
    j := 0;
    while j < 8 do
    begin
      imgPal.Canvas.Brush.Color := Colors[i];
      imgPal.Canvas.FillRect(Rect(0, j * 9, 11, (j + 1) * 9));
      imgPal.Canvas.Brush.Color := Colors[i + 1];
      imgPal.Canvas.FillRect(Rect(11, j * 9, 22, (j + 1) * 9));
      inc(i, 2);
      inc(j);
    end;
//    if SetTBColor.Checked or SetTBBlur.Checked then begin
//      AccentColor.Text := TBColor;
//      AlphaColor.Text := BlurAlphaColor;
//    end;
    if not processExists('NxTaskbarEx.exe') then
      ShellExecute(0, 'open', PChar(ExtractFilePath(Application.ExeName) + 'NxTaskbarEx.exe'), nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TNxTaskbarCfgMainForm.FormDestroy(Sender: TObject);
begin
  ColorBmp.Free;
  ABarBmp.Free;
  HBarBmp.Free;
  HBoxBmp.Free;
end;

procedure TNxTaskbarCfgMainForm.FormShow(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TNxTaskbarCfgMainForm.FormActivate(Sender: TObject);
begin
  if SelfKill then begin
    Application.ShowMainForm := False;
    close;
  end else begin
    FirstRun := True;
    CheckAutoRunWindows;
    CheckSmallTaskbarIcon;
    TimerCheckTBsizeChange.Enabled := True;
  end;
end;

procedure TNxTaskbarCfgMainForm.ImagePreviewClick(Sender: TObject);
begin
  ImagePreview.Top := ((BoxPreviewImage.Height - 54) div 2)-108;
end;

procedure TNxTaskbarCfgMainForm.ImagePreviewMouseEnter(Sender: TObject);
begin
  ImagePreview.Top := ((BoxPreviewImage.Height - 54) div 2)-54;
end;

procedure TNxTaskbarCfgMainForm.ImagePreviewMouseLeave(Sender: TObject);
begin
  ImagePreview.Top := (BoxPreviewImage.Height - 54) div 2;
end;

procedure TNxTaskbarCfgMainForm.OrbListClick(Sender: TObject);
begin
  ImagePreview.Picture.LoadFromFile(OrbList.SelectedPath);
end;

procedure TNxTaskbarCfgMainForm.RefreshListClick(Sender: TObject);
begin
  OrbList.RootFolderCustomPath := ExtractFilePath(Application.ExeName)+'Orbs';
end;


//====== MUTEX ======\\
var
  mHandle: THandle;    // Mutexhandle

initialization
  SetWindowCompositionAttributes := GetProcAddress(GetModuleHandle(user32), 'SetWindowCompositionAttribute');

  mHandle := CreateMutex(nil, True, 'NxTaskbarCfg');
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
    ShowMessage('Program is already running!');
    halt;
  end;

finalization
  if mHandle <> 0 then CloseHandle(mHandle)

end.


