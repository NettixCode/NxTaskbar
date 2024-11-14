unit StartMenu;

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
  Vcl.StdCtrls,
  scStyledForm,
  DwmApi,
  VirtualTrees,
  VirtualExplorerTree,
  scControls, MPCommonObjects, EasyListview, VirtualExplorerEasyListview,
  Vcl.ComCtrls, scShellControls, scModernControls;

type
  TStartMenuForm = class(TForm)
    StyledForm: TscStyledForm;
    VirtualExplorerListview1: TVirtualExplorerListview;
    scModernSplitView1: TscModernSplitView;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    procedure PositionOnShow;
    function GetAccentColor:TColor;
    { Private declarations }
  protected
//    procedure WMMove(var Message: TMessage); message WM_MOVE;
    { Protected delcarations}
  public
    { Public declarations }
  end;

  TTaskBarPos = (
  _TOP,
  _BOTTOM,
  _LEFT,
  _RIGHT,
  _NONE);

var
  StartMenuForm  : TStartMenuForm;
  CurrentLeft,
  CurrentTop     : Integer;
//  isShown        : Boolean = False;

implementation

{$R *.dfm}

//procedure TStartMenuForm.WMMove(var Message: TMessage);
//begin
//  inherited;
//  if isShown then begin
//    if Top <> CurrentTop then Top := CurrentTop;
//    if Left <> CurrentLeft then Left := CurrentLeft;
//  end;
//end;

function GetTaskBarPos: TTaskBarPos;
var
  hTaskbar: HWND;
  T: TRect;
  scrW, scrH: integer;
begin
  hTaskBar := FindWindow('Shell_TrayWnd', nil);
  if hTaskbar <> 0 then
  begin
    GetWindowRect(hTaskBar, T);
    ScrW := Screen.Width;
    ScrH := Screen.Height;
    if (T.Top > scrH div 2) and (T.Right >= scrW) then
      Result := _BOTTOM
    else if (T.Top < scrH div 2) and (T.Bottom <= scrW div 2) then
      Result := _TOP
    else if (T.Left < scrW div 2) and (T.Top <= 0) then
      Result := _LEFT
    else
    if T.Left >= ScrW div 2 then
      Result := _RIGHT;
  end;
end;

function TStartMenuForm.GetAccentColor:TColor;
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

procedure TStartMenuForm.PositionOnShow;
var
   TaskBarPos: TTaskBarPos;
begin
  TaskBarPos := GetTaskBarPos;
  case TaskBarPos of
     _LEFT: begin
        StartMenuForm.left := Screen.WorkAreaLeft + 1;
        StartMenuForm.top := Screen.WorkAreaTop + 1;
        CurrentLeft := StartMenuForm.Left;
        CurrentTop := StartMenuForm.Top;
//        isShown := True;
     end;
     _TOP: begin
        StartMenuForm.left := Screen.WorkAreaLeft + 1;
        StartMenuForm.top := Screen.WorkAreaTop + 1;
        CurrentLeft := StartMenuForm.Left;
        CurrentTop := StartMenuForm.Top;
//        isShown := True;
     end;
     _RIGHT: begin
        StartMenuForm.left:= (Screen.WorkAreaWidth - StartMenuForm.Width) - 1;
        StartMenuForm.top := Screen.WorkAreaTop + 1;
        CurrentLeft := StartMenuForm.Left;
        CurrentTop := StartMenuForm.Top;
//        isShown := True;
     end;
     _BOTTOM: begin
        StartMenuForm.left := Screen.WorkAreaLeft + 1;
        StartMenuForm.top := (Screen.WorkAreaHeight - StartMenuForm.Height) - 1;
        CurrentLeft := StartMenuForm.Left;
        CurrentTop := StartMenuForm.Top;
//        isShown := True;
     end;
  end;
end;

procedure TStartMenuForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TStartMenuForm.FormCreate(Sender: TObject);
begin
//  SetWindowLong(Handle,GWL_STYLE,GetWindowLong(Handle,GWL_STYLE) and not WS_CAPTION);
  Application.MainFormOnTaskBar := False;
  ShowWindow(Application.Handle, SW_HIDE);
  Color := clBlack;
  StyledForm.FluentUIAcrylicColor := GetAccentColor;
end;

procedure TStartMenuForm.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
  PositionOnShow;
end;

var
  mHandle: THandle;    // Mutexhandle

initialization
  mHandle := CreateMutex(nil, True, 'StartMenu');
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
//    ShowMessage('StartButton is already running!');
    halt;
  end;

finalization
  if mHandle <> 0 then CloseHandle(mHandle)
end.
