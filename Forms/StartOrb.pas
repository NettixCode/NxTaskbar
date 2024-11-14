unit StartOrb;

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
  ShlObj,
  ActiveX,
  ComObj,
  ShellAPI,
  TlHelp32,
  Vcl.ExtCtrls,
  Registry,
  Taskbar;
  {$R 'NxAdmin.RES' 'NxAdmin.RC'}

type
  TStartOrbForm = class(TForm)
    StartOrbs: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure CreateParams(var Params: TCreateParams); override;
  public
    Taskbars : TTaskbars;
    { Public declarations }
  end;

var
  StartOrbForm : TStartOrbForm;
  TaskB, TaskS    : HWND;
  TaskBR, TaskST  : TRect;
  SMCreated       : Boolean = False;
  CurrentLeft,
  NormalTOP,
  HoverTOP,
  ClickTOP        : Integer;
  RHandled        : Boolean = True;
  fwm_TaskbarRestart: Cardinal;

implementation


{$R *.dfm}

function TBPosition: integer;
var
  pData: TAppBarData;
begin
  Result := -1;
  pData.cbSize := SizeOf(TAppBarData);
  pData.hWnd := 0;
  if SHAppBarMessage(ABM_GETTASKBARPOS, pData) = 0 then
    Exit;
  Result := pData.uEdge;
end; { DSiGetTaskBarPosition }

procedure TStartOrbForm.CreateParams(var Params: TCreateParams);
var
  I : Integer;
begin
  Taskbars := TTaskbars.Create;
  Taskbars.Refresh;
  Taskbars.UpdateTaskbarInfo;
  fwm_TaskbarRestart := RegisterWindowMessage('TaskbarCreated');

  for I := 0 to Taskbars.count -1 do begin
    TaskB := Taskbars.Items[I].Handle;
    TaskS := Taskbars.Items[I].StartButton.Handle;
    TaskBR := Taskbars.Items[I].Rect;
    TaskST := Taskbars.Items[I].StartRect;

    inherited
    CreateParams(Params);
    with Params do begin
      Style := WS_CHILD or
                      WS_CHILDWINDOW or
                      WS_VISIBLE or
                      WS_CLIPSIBLINGS or
                      BS_TOP or
                      BS_BOTTOM or
                      BS_PUSHBUTTON or
                      BS_TEXT;
      ExStyle := WS_EX_TOPMOST or
                        WS_EX_APPWINDOW or
                        WS_EX_TOOLWINDOW or
                        WS_EX_LEFT or
                        WS_EX_LTRREADING or
                        WS_EX_RIGHTSCROLLBAR;
      WndParent := TaskB;
      WinClassName := 'NxStart';
      Caption := 'Start';
      Hint := 'Start';
      WindowClass.style := Params.WindowClass.style or CS_PARENTDC;
      StrLCopy(Params.WinClassName, 'NxStart', 63);

      case TBPosition of
        0 : begin
          Width := TaskST.Height;
          Height := Width;
          Y := TaskST.Top;
          X := (TaskBR.Width - Width) div 2;
        end;
        1 : begin
          Width := TaskST.Width;
          Height := Width;
          X := TaskST.Left;
          Y := (TaskBR.Height - Height) div 2;
        end;
        2 : begin
          Width := TaskST.Height;
          Height := Width;
          Y := TaskST.Top;
          X := (TaskBR.Width - Width) div 2;
        end;
        3 : begin
          Width := TaskST.Width;
          Height := Width;
          X := TaskST.Left;
          Y := (TaskBR.Height - Height) div 2;
        end;
      end;

      ParentWindow := GetDesktopWindow;
  //FindWindowEx(FindWindow('Progman',nil),0,'SHELLDLL_DefView',nil);//
    end;
  end;
end;

procedure TStartOrbForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Taskbars.Free;
  Action:=caFree;
end;

procedure RightClick;
begin
  keybd_event(VK_LWIN, 0, 0, 0);
  keybd_event(Ord('X'), 0, 0, 0);
  keybd_event(VK_LWIN, 0, KEYEVENTF_KEYUP, 0);
end;

procedure TStartOrbForm.FormContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
  SO : TRect;
begin
  GetWindowRect(Handle,SO);
  if (MousePos.x >= SO.Left)
  and (MousePos.x <= SO.Right)
  and (MousePos.y >= SO.Top)
  and (MousePos.y <= SO.Bottom) then begin
    Handled := True;
    RightClick;
  end else begin
    Handled := False;
  end;
end;

procedure TStartOrbForm.FormCreate(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);

  case TBPosition of
    0 : begin
      Width     := TaskST.Height;
      Height    := Width;
      top       := TaskST.Top;
      Left      := (TaskBR.Width - Width) div 2;
      StartOrbs.Width := 54;
      StartOrbs.Height := 162;
      StartOrbs.Left := (Width - 54) div 2;
      StartOrbs.Top := (Width -54) div 2;
    end;
    1 : begin
      Width     := TaskST.Width;
      Height    := Width;
      Left      := TaskST.Left;
      top       := (TaskBR.Height - Height) div 2;
      StartOrbs.Width := 54;
      StartOrbs.Height := 162;
      StartOrbs.Left := (Width - 54) div 2;
      StartOrbs.Top := (Width -54) div 2;
    end;
    2 : begin
      Width     := TaskST.Height;
      Height    := Width;
      top       := TaskST.Top;
      Left      := (TaskBR.Width - Width) div 2;
      StartOrbs.Width := 54;
      StartOrbs.Height := 162;
      StartOrbs.Left := (Width - 54) div 2;
      StartOrbs.Top := (Width -54) div 2;
    end;
    3 : begin
      Width     := TaskST.Width;
      Height    := Width;
      Left      := TaskST.Left;
      top       := (TaskBR.Height - Height) div 2;
      StartOrbs.Width := 54;
      StartOrbs.Height := 162;
      StartOrbs.Left := (Width - 54) div 2;
      StartOrbs.Top := (Width -54) div 2;
    end;
  end;

  ShowHint  := True;
  Hint      := 'Start';

  SetWindowPos(Handle,
      HWND_TOPMOST or HWND_TOP or HWND_DESKTOP,
      Left,
      Top,
      Width,
      Height,
      SWP_NOMOVE or
      SWP_NOZORDER or
      SWP_NOSENDCHANGING or
      SWP_NOSIZE or
      SWP_NOACTIVATE or
      SWP_ASYNCWINDOWPOS);

//  with StartOrbs do begin
//      Width := 54;
//      Height := 162;
//      top := (StartOrbForm.Width - 54) div 2;
//      Left := (StartOrbForm.Width - 54) Div 2;
//      ShowHint := True;
//      Hint := 'Start';
//  end;
      CurrentLeft := StartOrbs.Left;
      NormalTOP := StartOrbs.Top;
      HoverTOP := StartOrbs.Top - 54;
      ClickTOP := StartOrbs.Top - (54*2);

  inherited;
    Canvas.Brush.Style := bsClear;
end;

procedure TStartOrbForm.FormDestroy(Sender: TObject);
begin
  Taskbars.Free;
end;

procedure TStartOrbForm.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
end;

var
  mHandle: THandle;    // Mutexhandle

initialization
  mHandle := CreateMutex(nil, True, 'StartButton');
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
//    ShowMessage('StartButton is already running!');
    halt;
  end;

finalization
  if mHandle <> 0 then CloseHandle(mHandle)

end.
