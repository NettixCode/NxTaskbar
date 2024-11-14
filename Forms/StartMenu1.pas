unit StartMenu1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.WinXCtrls, VirtualTrees,
  VirtualExplorerTree, VirtualShellToolBar, Vcl.ComCtrls, sSkinManager,
  Vcl.ExtCtrls, sSkinProvider, sButton, ShlObj, MPShellUtilities, Vcl.Buttons,
  sSpeedButton, acArcControls, sBitBtn, Vcl.Imaging.jpeg, acPNG,
  sPanel, acDBBtns, scGPControls, scControls, scGPFontControls, scStyledForm,
  scStyleManager, scImageCollection, scGPImages, DwmApi, DzTalkApp, Vcl.Mask;

type
  TTaskBarPos = (
  _TOP,
  _BOTTOM,
  _LEFT,
  _RIGHT,
  _NONE);

  MouseLLHookStruct = record
    pt          : TPoint;
    mouseData   : cardinal;
    flags       : cardinal;
    time        : cardinal;
    dwExtraInfo : cardinal;
  end;

  TStartMenu1Form = class(TForm)
    StyledForm: TscStyledForm;
    TA: TDzTalkApp;
    PanelMain: TscPanel;
    BtnPower: TscGPCharGlyphButton;
    PanelBorder: TscPanel;
    PanelAppList: TscPanel;
    AppList: TVirtualExplorerListview;
    PanelBtn: TscPanel;
    BtnUser: TscGPCharGlyphButton;
    BtnProgram: TscGPCharGlyphButton;
    BtnAdministrative: TscGPCharGlyphButton;
    BtnDrives: TscGPCharGlyphButton;
    BtnRecent: TscGPCharGlyphButton;
    BtnPinnedApps: TscGPCharGlyphButton;
    IconList: TImageList;
    BtnSetting: TscGPCharGlyphButton;
    WallpaperList: TscGPImageCollection;
    BtnExplorer: TscGPCharGlyphButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AppListShellExecute(Sender: TCustomVirtualExplorerTree;
      Namespace: TNamespace; var WorkingDir, CmdLineArgument: string;
      var Allow: Boolean);
    procedure btnPowerClick(Sender: TObject);
    procedure btnSettingClick(Sender: TObject);
    procedure BtnExplorerClick(Sender: TObject);
    procedure BtnUserClick(Sender: TObject);
    procedure BtnProgramClick(Sender: TObject);
    procedure BtnAdministrativeClick(Sender: TObject);
    procedure BtnDrivesClick(Sender: TObject);
    procedure BtnRecentClick(Sender: TObject);
    procedure BtnPinnedAppsClick(Sender: TObject);
  private
    { Private declarations }
    function GetAccentColor:TColor;
    Procedure sizeMove(var msg: TWMSize); message WM_SIZE;
  public
    { Public declarations }
  end;

var
  StartMenu1Form: TStartMenu1Form;
  mHook : cardinal;

implementation

{$R *.dfm}

uses
  System.IOUtils,ShellAPI, ActiveX, ComObj, CommCtrl, FileCtrl, WinDialogs;

function GetTaskBarPos: TTaskBarPos;
var
//   hTaskbar: HWND;
//   T: TRect;
//   scrW, scrH: integer;
   pData: TAppBarData;
begin
//   hTaskBar := FindWindow('Shell_TrayWnd', nil);
//
//   if hTaskbar <> 0 then
//   begin
//     GetWindowRect(hTaskBar, T);
//     ScrW := Screen.Width;
//     ScrH := Screen.Height;
//     if (T.Top > scrH div 2) and (T.Right >= scrW) then
//       Result := _BOTTOM
//     else if (T.Top < scrH div 2) and (T.Bottom <= scrW div 2) then
//       Result := _TOP
//     else if (T.Left < scrW div 2) and (T.Top <= 0) then
//       Result := _LEFT
//     else
//     if T.Left >= ScrW div 2 then
//       Result := _RIGHT;
//   end;
  pData.cbSize := SizeOf(TAppBarData);
  pData.hWnd := 0;
  if SHAppBarMessage(ABM_GETTASKBARPOS, pData) = 0 then
    Exit;
  if pData.uEdge = 0 then
    Result := _LEFT
  else if pData.uEdge = 1 then
    Result := _TOP
  else if pData.uEdge = 2 then
    Result := _RIGHT
  else if pData.uEdge = 3 then
    Result := _BOTTOM;
end;

function LowLevelMouseHookProc(nCode, wParam, lParam : integer) : integer; stdcall;
// possible wParam values: WM_LBUTTONDOWN, WM_LBUTTONUP, WM_MOUSEMOVE, WM_MOUSEWHEEL, WM_RBUTTONDOWN, WM_RBUTTONUP
var
  info : ^MouseLLHookStruct absolute lParam;
  msg: TWMSize;
  Form : Tform;
begin
  Form := StartMenu1Form;
  result := CallNextHookEx(mHook, nCode, wParam, lParam);
  with info^ do begin
    case wParam of
      wm_lbuttondown   : begin
        if (pt.x < Form.Left - 10) or (pt.x > Form.left + Form.Width + 10) then begin
//          UnhookWindowsHookEx(mHook);
          Form.Close;
//          Application.Minimize;
        end else if (pt.y < Form.Top - 10) or (pt.y > Form.Top + Form.Height + 10) then begin
//          UnhookWindowsHookEx(mHook);
          Form.Close;
//          Application.Minimize;
        end;
      end;
      wm_mbuttondown   : begin
        if (pt.x < Form.Left) or (pt.x > Form.left + Form.Width) then begin
//          UnhookWindowsHookEx(mHook);
          Form.Close;
//          Application.Minimize;
        end else if (pt.y < Form.Top) or (pt.y > Form.Top + Form.Height) then begin
//          UnhookWindowsHookEx(mHook);
          Form.Close;
//          Application.Minimize;
        end;
      end;
      wm_rbuttondown   : begin
        if (pt.x < Form.Left) or (pt.x > Form.left + Form.Width) then begin
//          UnhookWindowsHookEx(mHook);
          Form.Close;
//          Application.Minimize;
        end else if (pt.y < Form.Top - 10) or (pt.y > Form.Top + Form.Height + 10) then begin
//          UnhookWindowsHookEx(mHook);
          Form.Close;
//          Application.Minimize;
        end;
      end;
//      wm_lbuttondown : MainForm.Memo1.Lines.Append(format('pressed left button (%d, %d)'    , [pt.x, pt.y]));
//      wm_lbuttonup   : MainForm.Memo1.Lines.Append(format('released left button (%d, %d)'   , [pt.x, pt.y]));
//      wm_mbuttondown : MainForm.Memo1.Lines.Append(format('pressed middle button (%d, %d)'  , [pt.x, pt.y]));
//      wm_mbuttonup   : MainForm.Memo1.Lines.Append(format('released middle button (%d, %d)' , [pt.x, pt.y]));
//      wm_rbuttondown : MainForm.Memo1.Lines.Append(format('pressed right button (%d, %d)'   , [pt.x, pt.y]));
//      wm_rbuttonup   : MainForm.Memo1.Lines.Append(format('released right button (%d, %d)'  , [pt.x, pt.y]));
//      wm_mousewheel  : begin
//        if smallInt(mouseData shr 16) > 0
//        then MainForm.Memo1.Lines.Append('scrolled wheel (up)')
//        else MainForm.Memo1.Lines.Append('scrolled wheel (down)');
//      end;
    end;
  end;
end;

procedure PositionOnShow;
var
   TaskBarPos: TTaskBarPos;
   Form : Tform;
begin
  Form := StartMenu1Form;
  TaskBarPos := GetTaskBarPos;
  case TaskBarPos of
     _LEFT: begin
        Form.left := Screen.WorkAreaLeft;
        Form.top := 0;
//        TimerVisible.Enabled := True;
//        ShowMessage('Left Position');
     end;
     _TOP: begin
        Form.left := 0;
        Form.top := Screen.WorkAreaTop;
//        TimerVisible.Enabled := True;
//        ShowMessage('Top Position');
     end;
     _RIGHT: begin
        Form.left:= Screen.WorkAreaWidth - Form.Width;
        Form.top := 0;
//        TimerVisible.Enabled := True;
//        ShowMessage('Right Position');
     end;
     _BOTTOM: begin
        Form.left := 0;
        Form.top := Screen.WorkAreaHeight - Form.Height;
//        TimerVisible.Enabled := True;
//        ShowMessage('Bottom Position');
     end;
  end;
end;

function TStartMenu1Form.GetAccentColor:TColor;
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

procedure TStartMenu1Form.BtnExplorerClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('Explorer.exe'), nil, nil, SW_SHOWNORMAL);
  Close;
end;

Procedure TStartMenu1Form.sizeMove (var msg: TWMSize);
begin
  inherited;
  if msg.SizeType = SIZE_MINIMIZED then begin
//    UnhookWindowsHookEx(mHook);
    Left := Screen.WorkAreaLeft - Width;
 end else
  if (msg.SizeType = SIZE_MAXIMIZED) OR (msg.SizeType = SIZE_RESTORED)then
  begin
//    mHook := SetWindowsHookEx(WH_MOUSE_LL, @LowLevelMouseHookProc, hInstance, 0);
    PositionOnShow;
  end;
end;

procedure TStartMenu1Form.AppListShellExecute(Sender: TCustomVirtualExplorerTree;
  Namespace: TNamespace; var WorkingDir, CmdLineArgument: string;
  var Allow: Boolean);
begin
  Allow := True;
//  ShowMessage(AppList.SelectedPath);
//  ShellExecute(Handle, 'open', PChar(AppList.SelectedPath), nil, nil, SW_SHOWNORMAL);
  Close;
end;

procedure TStartMenu1Form.BtnDrivesClick(Sender: TObject);
begin
  AppList.RootFolder := rfDrives;
end;

procedure TStartMenu1Form.BtnAdministrativeClick(Sender: TObject);
begin
  AppList.RootFolder := rfCommonAdminTools;
end;

procedure TStartMenu1Form.BtnPinnedAppsClick(Sender: TObject);
begin
  AppList.RootFolderCustomPath := 'C:\Application';
end;

procedure TStartMenu1Form.FormCreate(Sender: TObject);
const
  WH_MOUSE_LL = 14;
begin
  ShowWindow(Application.Handle,SW_HIDE);
  BtnUser.Caption := GetEnvironmentVariable('USERNAME');
  Caption := 'Start Menu';
//  StyledForm.FluentUIAcrylicColor := GetAccentColor;
//  AppList.Color := GetAccentColor;
//  ReportMemoryLeaksOnShutdown := True;
  mHook := SetWindowsHookEx(WH_MOUSE_LL, @LowLevelMouseHookProc, hInstance, 0);
//  SetWindowLong(Handle,GWL_STYLE,GetWindowLong(Handle,GWL_STYLE) and not WS_CAPTION);
end;

procedure TStartMenu1Form.FormDestroy(Sender: TObject);
begin
  UnhookWindowsHookEx(mHook);
//ShowWindow(FindWindowEx(FindWindow ('Shell_TrayWnd', nil), 0, 'Start', nil),SW_SHOW);
//  SetWindowRgn(FindWindowEx(FindWindow('Shell_TrayWnd', nil),0, 'Start', nil),0, true); //hidestart button
//  ShowWindow(hnc, SW_SHOW);

//  ShowWindow(FindWindowEx(FindWindow ('Shell_TrayWnd', nil), 0, 'Start', nil),SW_SHOW);
//  SetWindowPos(FindWindowEx(FindWindow ('Shell_TrayWnd', nil), 0, 'Start', nil),HWND_TOPMOST,0,0,36,30,SW_ERASE);
//
//  GetWindowRect(TB,TTB);
//  SetWindowPos(FindWindowEx (FindWindow ('Shell_TrayWnd', nil), 0, 'ReBarWindow32', nil),HWND_NOTOPMOST,36,0,TTB.Width - 36,30,SW_ERASE);
//  SetWindowPos(FindWindowEx (FindWindow ('ReBarWindow32', nil), 0, 'MSTaskSwWClass', nil),HWND_NOTOPMOST,36,0,TTB.Width - 36,30,SW_ERASE);
//  SetWindowPos(FindWindowEx (FindWindow ('MSTaskSwWClass', nil), 0, 'MSTaskListWClass', nil),HWND_NOTOPMOST,36,0,TTB.Width - 36,30,SW_ERASE);
end;

procedure TStartMenu1Form.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle,SW_HIDE);
  PositionOnShow;
end;

procedure TStartMenu1Form.btnPowerClick(Sender: TObject);
begin
//  WinExec(PChar(ExtractFilePath(Application.ExeName) + 'PowerExecute.exe -nettixcode') , SW_HIDE);
//  WinExec(PAnsiChar('C:\PowerExecute.exe -nettixcode') , SW_HIDE);
//  ShellExecute(0, 'open', PChar('C:\PowerExecute.exe'), '-nettixcode', nil, SW_SHOWNORMAL);
  TA.Send(9000);
  Close;
end;

procedure TStartMenu1Form.BtnProgramClick(Sender: TObject);
begin
  AppList.RootFolder := rfCommonPrograms;
end;

procedure TStartMenu1Form.BtnRecentClick(Sender: TObject);
begin
  AppList.RootFolder := rfRecent;
end;

procedure TStartMenu1Form.btnSettingClick(Sender: TObject);
begin
//ShowWindowsSpecialDialog(wdRunFile);
//  WinExec(PAnsiChar('ms-settings:\\system') , SW_SHOWNORMAL);
  ShellExecute(0, 'open', PChar('ms-settings:\\system'), nil, nil, SW_SHOWNORMAL);
  Close;
end;

procedure TStartMenu1Form.BtnUserClick(Sender: TObject);
begin
  AppList.RootFolder := rfProfile;
end;

end.
