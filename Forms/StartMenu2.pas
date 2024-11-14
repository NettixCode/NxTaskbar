unit StartMenu2;

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
  scControls,
  scModernControls,
  Vcl.StdCtrls,
  scExtControls,
  scStyledForm,
  scStyleManager,
  Vcl.ImgList,
  Vcl.Imaging.jpeg,
  Vcl.ExtCtrls,
  scImageCollection,
  ShellApi,
  Vcl.Mask,
  scAdvancedControls,
  scHint,
  System.ImageList,
  VirtualTrees,
  VirtualExplorerTree,
  Vcl.ComCtrls,
  scShellControls,
  MPCommonObjects,
  EasyListview,
  VirtualExplorerEasyListview,
  scGPFontControls,
  MPShellUtilities,
  SHlObj,
  DzTalkApp, scGPImages;

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

type
  TStartMenu2Form = class(TForm)
    scSplitView1: TscSplitView;
    scStyledForm1: TscStyledForm;
    ImageList1: TImageList;
    scPanel1: TscPanel;
    AppList: TVirtualExplorerEasyListview;
    scPanel5: TscPanel;
    BtnAllApps: TscGPCharGlyphButton;
    TA: TDzTalkApp;
    BtnOpenMenu: TscGPCharGlyphButton;
    BtnPower: TscGPCharGlyphButton;
    BtnSettings: TscGPCharGlyphButton;
    procedure BtnPowerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnAllAppsClick(Sender: TObject);
    function AppListItemCompare(Sender: TCustomEasyListview;
      Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
      var DoDefault: Boolean): Integer;
    procedure AppListItemGetCaption(Sender: TCustomEasyListview;
      Item: TEasyItem; Column: Integer; var Caption: string);
    procedure AppListRootRebuild(Sender: TCustomVirtualExplorerEasyListview);
    procedure scSplitView1Closed(Sender: TObject);
    procedure scSplitView1Opened(Sender: TObject);
    procedure BtnOpenMenuClick(Sender: TObject);
    procedure BtnOpenMenuMouseEnter(Sender: TObject);
    procedure BtnSettingsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FZombieItem: TExplorerItem;
  end;

var
  StartMenu2Form: TStartMenu2Form;
  mHook : cardinal;

implementation

{$R *.dfm}

function GetPrevNamespace(NS: TNamespace): TNamespace;
var
  PIDL: PItemIDList;
begin
  Result := nil;
  if Assigned(NS) and (not NS.IsDesktop) then begin
    PIDL := PIDLMgr.CopyPIDL(NS.AbsolutePIDL);
    PIDLMgr.StripLastID(PIDL);
    Result := TNamespace.Create(PIDL, nil);
    Result.FreePIDLOnDestroy := True; // TNamespace will destroy the PIDL
  end;
end;

function GetTaskBarPos: TTaskBarPos;
var
   pData: TAppBarData;
begin
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
  Form := StartMenu2Form;
  result := CallNextHookEx(mHook, nCode, wParam, lParam);
  with info^ do begin
    case wParam of
      wm_lbuttondown   : begin
        if (pt.x < Form.Left - 10) or (pt.x > Form.left + Form.Width + 10) then begin
          Form.Close;
        end else if (pt.y < Form.Top - 10) or (pt.y > Form.Top + Form.Height + 10) then begin
          Form.Close;
        end;
      end;
      wm_mbuttondown   : begin
        if (pt.x < Form.Left) or (pt.x > Form.left + Form.Width) then begin
          Form.Close;
        end else if (pt.y < Form.Top) or (pt.y > Form.Top + Form.Height) then begin
          Form.Close;
        end;
      end;
      wm_rbuttondown   : begin
        if (pt.x < Form.Left) or (pt.x > Form.left + Form.Width) then begin
          Form.Close;
        end else if (pt.y < Form.Top - 10) or (pt.y > Form.Top + Form.Height + 10) then begin
          Form.Close;
        end;
      end;
    end;
  end;
end;

procedure PositionOnShow;
var
   TaskBarPos: TTaskBarPos;
   Form : Tform;
begin
  Form := StartMenu2Form;
  TaskBarPos := GetTaskBarPos;
  case TaskBarPos of
     _LEFT: begin
        Form.left := Screen.WorkAreaLeft;
        Form.top := 0;
     end;
     _TOP: begin
        Form.left := 0;
        Form.top := Screen.WorkAreaTop;
     end;
     _RIGHT: begin
        Form.left:= Screen.WorkAreaWidth - Form.Width;
        Form.top := 0;
     end;
     _BOTTOM: begin
        Form.left := 0;
        Form.top := Screen.WorkAreaHeight - Form.Height;
     end;
  end;
end;

function TStartMenu2Form.AppListItemCompare(Sender: TCustomEasyListview;
  Column: TEasyColumn; Group: TEasyGroup; Item1, Item2: TEasyItem;
  var DoDefault: Boolean): Integer;
begin
  Result := 0;
  if Assigned(FZombieItem) then
    if FZombieItem = Item1 then begin
      Result := -1;
      DoDefault := False;
    end else
    if FZombieItem = Item2 then begin
      Result := 1;
      DoDefault := False;
    end;
end;

procedure TStartMenu2Form.AppListItemGetCaption(Sender: TCustomEasyListview;
  Item: TEasyItem; Column: Integer; var Caption: string);
begin
  if Assigned(FZombieItem) and (FZombieItem = Item) and (Column = 0) and (AppList.RootFolderCustomPath <> 'C:\Application\') then
    Caption := '[..]';
end;

procedure TStartMenu2Form.AppListRootRebuild(
  Sender: TCustomVirtualExplorerEasyListview);
var
  NS: TNamespace;
begin
  if AppList.RootFolderCustomPath <> 'C:\Application\' then begin
    FZombieItem := nil;
  // First we should create the Namespace that will represent the '..' dir.
  // Simply get the parent level namespace
    NS := GetPrevNamespace(AppList.RootFolderNamespace);
    if Assigned(NS) then begin
    // Now create the ZombieNode and sort the tree
      FZombieItem := AppList.AddCustomItem(nil, NS, True);
      AppList.SortList;
    end;
  end;
end;

procedure TStartMenu2Form.BtnAllAppsClick(Sender: TObject);
begin
  if BtnAllApps.Tag = 0 then begin
    BtnAllApps.Caption := 'Pinned';
    AppList.RootFolder := VirtualExplorerTree.rfCommonPrograms;
    BtnAllApps.tag := 1;
    BtnAllApps.Down := False;
  end else
  if BtnAllApps.Tag = 1 then begin
    BtnAllApps.Caption := 'All Apps';
    AppList.RootFolderCustomPath := 'C:\Application';
    BtnAllApps.Tag := 0;
    BtnAllApps.Down := False;
  end;
end;

procedure TStartMenu2Form.BtnOpenMenuClick(Sender: TObject);
begin
  scSplitView1.Opened := not scSplitView1.Opened;
  BtnOpenMenu.Down := False;
end;

procedure TStartMenu2Form.BtnOpenMenuMouseEnter(Sender: TObject);
begin
  BtnOpenMenuClick(self);
end;

procedure TStartMenu2Form.FormCreate(Sender: TObject);
const
  WH_MOUSE_LL = 14;
begin
  ShowWindow(Application.Handle,SW_HIDE);
  AppList.RootFolderCustomPath := 'C:\Application';
  BtnOpenMenu.Top := 0;
  BtnOpenMenu.Left := (scSplitView1.Width - BtnOpenMenu.Width) div 2;
  mHook := SetWindowsHookEx(WH_MOUSE_LL, @LowLevelMouseHookProc, hInstance, 0);
end;

procedure TStartMenu2Form.FormDestroy(Sender: TObject);
begin
  UnhookWindowsHookEx(mHook);
end;

procedure TStartMenu2Form.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle,SW_HIDE);
  PositionOnShow;
end;

procedure TStartMenu2Form.scSplitView1Closed(Sender: TObject);
begin
  BtnPower.Visible := False;
  BtnSettings.Visible := False;
  BtnOpenMenu.GlyphOptions.Index := 119;
end;

procedure TStartMenu2Form.scSplitView1Opened(Sender: TObject);
begin
  BtnPower.Visible := True;
  BtnSettings.Visible := True;
  BtnOpenMenu.GlyphOptions.Index := 120;
end;

procedure TStartMenu2Form.BtnPowerClick(Sender: TObject);
begin
  TA.Send(9000);
  Close;
end;

procedure TStartMenu2Form.BtnSettingsClick(Sender: TObject);
begin
  ShellExecute(0, 'open', PChar('ms-settings:\\system'), nil, nil, SW_SHOWNORMAL);
  Close;
end;

end.
