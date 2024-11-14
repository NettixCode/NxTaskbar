unit TaskbarLayout;
//{$DEFINE hideFromTaskBar}

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  System.Types,
  ActiveX,
  Shlobj,
  ComObj,
  DwmApi,
  pngimage,
  Registry,
  ShellAPI,
  Taskbar,
  scStyledForm,
  scControls;

const
  WCA_ACCENT_POLICY = 19;
  ACCENT_DISABLED = 0;
  ACCENT_ENABLE_GRADIENT = 1;
  ACCENT_ENABLE_TRANSPARENTGRADIENT = 2;
  ACCENT_ENABLE_BLURBEHIND = 3;
  ACCENT_ENABLE_ACRYLICBLURBEHIND = 4;

type
  TTaskbarLayoutForm = class(TForm)
    TimerBGTrans: TTimer;
    StyledForm: TscStyledForm;
    LayoutImage: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerBGTransTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    procedure TransTB(wnd : HWND);
    function TaskbarAccented:boolean;
    function TaskbarTranslucent:boolean;
    procedure EnableBlur;
    function GetAccentColor:TColor;
    procedure WndProc(var Message: TMessage);override;
    { Private declarations }
  protected
//  {$IFDEF hideFromTaskBar}
    procedure CreateParams(var Params: TCreateParams); override;
//  {$ENDIF}
  public
    Taskbars : TTaskbars;
    procedure UpdateColorization(Colorz : TColor; Alpha, Mode : Integer);
    { Public declarations }
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

var
  TaskbarLayoutForm: TTaskbarLayoutForm;
  TaskB: HWND;
  TaskBR: TRect;
  BlurMode : Boolean = False;
  Dcol  : TColor;
  Dalp  : Integer;

  function SetWindowCompositionAttribute(hWnd: HWND; var data: WindowCompositionAttributeData): Integer; stdcall;
    external User32 name 'SetWindowCompositionAttribute';

var
  SetWindowCompositionAttributes: function (Wnd: HWND; const AttrData: TWinCompAttrData): BOOL; stdcall = Nil;

implementation

{$R *.dfm}

function IsTaskbarAutoHideOn: Boolean;
var
  ABData: TAppBarData;
begin
  ABData.cbSize := SizeOf(ABData);
  Result        := (SHAppBarMessage(ABM_GETSTATE, ABData) and ABS_AUTOHIDE) <> 0;
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
  x,y: integer;
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

procedure TTaskbarLayoutForm.EnableBlur;
var
  dwm10: THandle;
  data : TWinCompAttrData;
  accent: AccentPolicy;
begin
      dwm10 := LoadLibrary('user32.dll');
      try
        @SetWindowCompositionAttributes := GetProcAddress(dwm10, 'SetWindowCompositionAttribute');
        if @SetWindowCompositionAttributes <> nil then
        begin
          accent.AccentState := ACCENT_ENABLE_BLURBEHIND ;
          accent.AccentFlags := $20 or $40 or $80 or $100;

          data.Attribute := WCA_ACCENT_POLICY;
          data.dataSize := SizeOf(accent);
          data.pData := @accent;
          SetWindowCompositionAttributes(Handle, data);
        end
        else
        begin
          ShowMessage('Not found Windows 10 blur API');
        end;
      finally
        FreeLibrary(dwm10);
      end;
end;

function TTaskbarLayoutForm.TaskbarAccented: boolean;
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

function TTaskbarLayoutForm.TaskbarTranslucent: boolean;
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

procedure TTaskbarLayoutForm.UpdateColorization(Colorz : TColor; Alpha, Mode : Integer);
begin
//  BlurMode := True;
  Dcol := Colorz;
  Dalp := Alpha;
  DoubleBuffered := True;
  LayoutImage.Visible := False;
//  Color := clBlack;
//  BorderStyle := bsNone;
//  if TaskbarTranslucent then
//  EnableBlur;

//  ShowMessage(ColorToString(Colorz)+ ' + ' + IntToStr(Alpha));
  case Mode of
    1 : begin //normal color
      BlurMode := False;
      TaskbarLayoutForm.AlphaBlend := True;
      TaskbarLayoutForm.AlphaBlendValue := Alpha;
      StyledForm.FluentUIBackground := scfuibNone;
      TaskbarLayoutForm.Color := Colorz;
//      ShowMessage(ColorToString(Colorz));
    end;
    2 : begin //blur
      BlurMode := False;
      TaskbarLayoutForm.AlphaBlend := False;
      TaskbarLayoutForm.AlphaBlendValue := Alpha;
      StyledForm.FluentUIBackground := scfuibBlur;
      TaskbarLayoutForm.Color := Colorz;
      Dcol := Colorz;
//      ShowMessage(ColorToString(Colorz));
//      SetAlphaColorPicture(Colorz, Alpha, LayoutImage.Picture, 10,10  );
    end;
    3 : begin //acrylic
      BlurMode := False;
      TaskbarLayoutForm.AlphaBlend := False;
      TaskbarLayoutForm.AlphaBlendValue := Alpha;
      StyledForm.FluentUIBackground := scfuibAcrylic;
      StyledForm.FluentUIAcrylicColor := Colorz;
      StyledForm.FluentUIAcrylicColorAlpha := Alpha;
//      ShowMessage(ColorToString(Colorz));
//      TaskbarLayoutForm.Color := clBlack;
    end;
  end;
//  StyledForm.FluentUIBackground := scfuibBlur;
//  StyledForm.FluentUIAcrylicColor := Colorz;
//  StyledForm.FluentUIAcrylicColorAlpha := Alpha;
//  TaskbarLayoutForm.Color := Colorz;
//  TaskbarLayoutForm.AlphaBlend := True;
//  TaskbarLayoutForm.AlphaBlendValue := Alpha;

  if TaskbarTranslucent then
  begin
//    SetAlphaColorPicture(Colorz, Alpha, LayoutImage.Picture, 10,10  );
  end
  else
  if TaskbarAccented then
  begin
//    SetAlphaColorPicture(GetAccentColor, Alpha, LayoutImage.Picture, 10, 10);
  end;
end;

function TTaskbarLayoutForm.GetAccentColor:TColor;
var
  col: cardinal;
  opaque: longbool;
  newcolor: TColor;
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

procedure TTaskbarLayoutForm.TimerBGTransTimer(Sender: TObject);
begin
  TransTB(TaskB);
//  if BlurMode then
//    TaskbarLayoutForm.Color := Dcol;
end;

procedure TTaskbarLayoutForm.TransTB(wnd : HWND);
var
  accent: AccentPolicy;
  data: WindowCompositionAttributeData;
begin
  begin
    accent.AccentState := ACCENT_ENABLE_TRANSPARENTGRADIENT;
    accent.GradientColor := $32000000;
    accent.AccentFlags := not $20 or not $40 or not $80 or not $100;
    data.Attribute := WCA_ACCENT_POLICY;
    data.SizeOfData := SizeOf(accent);
    data.Data := @accent;

    SetWindowCompositionAttribute(wnd, data);
  end;
end;

//{$IFDEF hideFromTaskBar}
procedure TTaskbarLayoutForm.CreateParams(var Params: TCreateParams);
var
  I : Integer;
begin
  Taskbars := TTaskbars.Create;
  Taskbars.Refresh;
  Taskbars.UpdateTaskbarInfo;

  for I := 0 to Taskbars.count -1 do begin
    TaskB := Taskbars.Items[I].Handle;
    TaskBR := Taskbars.Items[I].Rect;

  inherited
  CreateParams(Params);
  with Params do begin
    Style := WS_POPUP or
                    WS_VISIBLE or
                    WS_CLIPSIBLINGS;
    ExStyle := WS_EX_LAYERED or
                      WS_EX_NOACTIVATE or
                      WS_EX_TOOLWINDOW and not
                      WS_EX_APPWINDOW;
    WndParent := GetDesktopWindow;
    WinClassName := 'NxTaskbarLayout';
    Caption := 'NxTBLayout';
    WindowClass.style := Params.WindowClass.style or CS_PARENTDC;
    StrLCopy(Params.WinClassName, 'NxTaskbarLayout', 63);
    Width := TaskBR.Width;
    Height := TaskBR.Height;
    X := TaskBR.Left;
    Y := TaskBR.Top;
    ParentWindow := GetDesktopWindow;
  end;
  end;
    SetForegroundWindow(TaskB);
    BringWindowToTop(TaskB);
end;
//{$ENDIF}

procedure TTaskbarLayoutForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TTaskbarLayoutForm.FormCreate(Sender: TObject);
begin
//  if IsTaskbarAutoHideOn then
//    ShowMessage('hide')
//    else
//    ShowMessage('no');
//

  ShowWindow(Application.Handle,SW_HIDE);
  Top := TaskBR.Top;
  Left := TaskBR.Left;
  Width := TaskBR.Width;
  Height := TaskBR.Height;

  SetWindowPos(Handle,
      HWND_BOTTOM,
      Left,
      Top,
      Width,
      Height,
      SWP_NOMOVE or
      SWP_NOSIZE or
      SWP_NOACTIVATE);

  TimerBGTrans.Enabled := True;
end;

procedure TTaskbarLayoutForm.FormDestroy(Sender: TObject);
begin
  TimerBGTrans.Enabled := False;
end;

procedure TTaskbarLayoutForm.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle,SW_HIDE);
end;

procedure TTaskbarLayoutForm.WndProc(var Message: TMessage);
//const
//  WM_DWMCOLORIZATIONCOLORCHANGED = $0320;
begin
  if Message.Msg = WM_DWMCOLORIZATIONCOLORCHANGED then
  begin
    if BlurMode then
//      UpdateColorization(Dcol,Dalp,2);
  end;
  inherited WndProc(Message);

end;

var
  mHandle: THandle;    // Mutexhandle

initialization
  if BlurMode then
//  SetWindowCompositionAttributes := GetProcAddress(GetModuleHandle(user32), 'SetWindowCompositionAttribute');

  mHandle := CreateMutex(nil, True, 'TaskbarLayout');
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
//    ShowMessage('StartButton is already running!');
    halt;
  end;

finalization
  if mHandle <> 0 then CloseHandle(mHandle)

end.
