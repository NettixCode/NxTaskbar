unit WinDialogs;

interface

uses
  Windows, Dialogs, Messages, DDEMan, ShellAPI, SysUtils, ShlObj, ActiveX;

type

  TWindowsDialogs = (wdStartMenu,
                      wdRecycleBin,
                      wdRunFile,
                      wdUserManager,
                      wdWindowsAboutDlg,
                      wdWindowsShutdownDialog,
                      wdScreenSaver,
                      wdControlPanel,
                      wdSystemProperties,
                      wdDisplayProperties,
                      wdThemesProperties,
                      wdPasswordsProperties,
                      wdPowerManagementProperties,
                      wdDateTimeProperties,
                      wdAccessibilityProperties,
                      wdSoftwareProperties,
                      wdDialProperties,
                      wdFontsProperties,
                      wdLocalRegionProperties,
                      wdPrinterProperties,
                      wdMouseProperties,
                      wdKeyboardProperties,
                      wdNetworkProperties,
                      wdInternetProperties,
                      wdModemProperties,
                      wdMultimediaProperties,
                      wdMailProperties,
                      wdScanCamProperties,
                      wdODBCProperties,
                      wdBDEProperties);

Const
   RFF_NOOPT =                    0;
   RFF_NOBROWSE =            1;
   RFF_NODEFAULT =            2;
   RFF_CALCDIRECTORY =     4;
   RFF_NOLABEL =                8;
   RFF_NOSEPARATEMEM =   14;

 //-----------Windows API functions to call windows dialogs-----------//

procedure RunFileDlg(OwnerWnd: HWND; Icon: HICON; lpstrDirectory: PChar;
          lpstrTitle: PChar; lpstrDescription: PChar; Flags: Longint); stdcall;
          external 'Shell32.dll' Index 61;

function ShowWinAbout(hwndOwner: HWND; pszApp: PAnsiChar; lpszOther: PAnsiChar;
 hIcon: HICON): DWORD; stdcall; external 'Shell32.dll' name 'ShellAboutA';
 //--------------------------------------------------//

function OpenRecycleBin: Boolean;
function ShowCustomRunDialog(OwnerWnd: HWND; InitialDir, Title, Description: PChar; flags: Integer; StandardCaptions: Boolean): Boolean;
function ShowFolderBrowserDialog(ParentWindow: HWND; const DisplayText, InitPath: String; const Editable, NewStyle, ShowFiles: Boolean): String;
procedure FileOpenWithDialog(const Filename: String);
procedure FilePropertiesDialog(const Filename: String);
procedure ShowWindowsSpecialDialog(const SpecialDialog: TWindowsDialogs);

implementation

function OpenRecycleBin: Boolean;
 procedure FreeIDList(pidl: Pointer);
 var
  allocator: IMalloc;
 begin
  if Succeeded(shlobj.SHGetMalloc(allocator)) then
  begin
   allocator.Free(pidl);
   {$IFDEF VER90}
   allocator.Release;
   {$ENDIF}
  end;
 end;
var
  exInfo: TShellExecuteInfo;
begin
  FillChar(exInfo, SizeOf(exInfo), 0);
  with exInfo do
  begin
    cbSize := SizeOf(exInfo);
    fMask := SEE_MASK_FLAG_DDEWAIT or SEE_MASK_IDLIST;
    Wnd := 0;
    nShow := SW_SHOWNORMAL;
    lpVerb := 'open';
    ShGetSpecialFolderLocation(0, CSIDL_BITBUCKET, PItemIDLIst(lpIDList));
  end;
  result:= ShellExecuteEx(@exInfo);
  FreeIDList(exinfo.lpIDList);
end;

function ShowCustomRunDialog(OwnerWnd: HWND; InitialDir, Title, Description: PChar;  flags: Integer; StandardCaptions: Boolean): Boolean;
var
  sTitle, sInitialDir, sDescription: PWideChar;
  iSize: Integer;
begin
  if (Win32Platform = VER_PLATFORM_WIN32_NT) and not StandardCaptions then
  begin
    iSize := SizeOf(WideChar) * MAX_PATH;
{    sInitialDir := nil;
    sTitle := nil;
    sDescription := nil;  }
    GetMem(sInitialDir, iSize);
    GetMem(sTitle, iSize);
    GetMem(sDescription, iSize);
    StringToWideChar(InitialDir, sInitialDir, MAX_PATH);
    StringToWideChar(Title, sTitle, MAX_PATH);
    StringToWideChar(Description, sDescription, MAX_PATH);
    try
      RunFileDlg(OwnerWnd, 0, sInitialDir, sTitle, sDescription, Flags);
    finally
      FreeMem(sInitialDir);
      FreeMem(sTitle);
      FreeMem(sDescription);
      result:= TRUE;
    end;
  end else
    try
     RunFileDlg(OwnerWnd, 0, PChar(InitialDir), PChar(Title), PChar(Description), Flags);
     result:= TRUE;
    finally
    end;
end;


function ShowFolderBrowserDialog(ParentWindow: HWND; const DisplayText, InitPath: String; const Editable, NewStyle, ShowFiles: Boolean): String;
var
   BI: TBrowseInfo;
   Flags: LongWord;
   SelectedPIDL: PItemIDList;
   RootItemIDList: PItemIDList;
   IDesktopFolder: IShellFolder;
   Dummy: LongWord;

   procedure MergeFlag(var Flag: LongWord; const Value: LongWord);
   begin
    Flag:= Flag or Value;
   end;

begin
   Result := '';
   Flags:= 0;
   if Editable  then MergeFlag(Flags, BIF_EDITBOX);
   if NewStyle  then MergeFlag(Flags, BIF_NEWDIALOGSTYLE);
   if ShowFiles  then MergeFlag(Flags, BIF_BROWSEINCLUDEFILES);
   MergeFlag(Flags, BIF_UAHINT);
   ZeroMemory(@BI, SizeOf(TBrowseInfo));

    RootItemIDList := nil;
    if InitPath <> '' then
    begin
      SHGetDesktopFolder(IDesktopFolder);
      IDesktopFolder.ParseDisplayName(0, nil, PChar(InitPath), Dummy, RootItemIDList, Dummy);
    end;

   with BI do
   begin
      hwndOwner:= ParentWindow;
      GetMem(pszDisplayName, MAX_PATH);
      lpszTitle:= PChar(DisplayText);
      ulFlags:= Flags;
      lParam := Longint(ParentWindow);
      iImage:= 0;
      pidlRoot := RootItemIDList;
   end;
   SelectedPIDL:= SHBrowseForFolder(bi);
   if SelectedPIDL <> NIL then begin
     if SHGetPathFromIDList(SelectedPIDL, BI.pszDisplayName) then
       result:= StrPas(BI.pszDisplayName);
     GlobalFreePtr(SelectedPIDL);
   end;
   FreeMem(BI.pszDisplayName);
end;

procedure FileOpenWithDialog(const Filename: String);
begin
  ShellExecute(GetCurrentProcess, 'open', PChar('rundll32.exe'),
    PChar('shell32.dll,OpenAs_RunDLL ' + FileName), nil, SW_SHOWNORMAL);
end;

procedure FilePropertiesDialog(const Filename: String);
var
  exInfo: TShellExecuteInfo;
begin
  FillChar(exInfo, SizeOf(exInfo), 0);
  exInfo.cbSize := SizeOf(exInfo);
  exInfo.lpFile := PChar(FileName);
  exInfo.lpVerb := 'properties';
  exInfo.fMask  := SEE_MASK_INVOKEIDLIST;
  ShellExecuteEx(@exInfo);
end;

procedure ShowWindowsSpecialDialog(const SpecialDialog: TWindowsDialogs);
    procedure OpenCPLDialogs(const cpl: string);
    begin
       shellexecute(GetCurrentProcess,'open','rundll32.exe',
          pchar('shell32.dll,Control_RunDLL'+#32+cpl),nil,sw_shownormal);
    end;
begin
  case SpecialDialog of
    wdStartMenu:
      begin
        keybd_event(VK_LWIN, MapVirtualKey(VK_LWIN, 0), 0, 0);
     keybd_event(VK_LWIN, MapVirtualKey(VK_LWIN, 0), KEYEVENTF_KEYUP, 0)
      end;
    wdRecycleBin:
     begin
       OpenRecycleBin;
      end;
    wdRunFile:
     begin
        ShowCustomRunDialog(FindWindow('Shell_TrayWnd', NIL), NIL, NIL, NIL,
                              RFF_NOOPT, TRUE);
      end;
    wdUserManager:
      begin
        ShellExecute(0, 'open', 'musrmgr.exe', '', '', SW_SHOW);
      end;
    wdWindowsAboutDlg:
     begin
       ShowWinAbout(0, PAnsiChar(''), PAnsiChar(''), 0);
      end;
    wdWindowsShutdownDialog:
      begin
         PostMessage(FindWindow('Progman',nil), WM_CLOSE, 0, 0);
      end;
    wdScreenSaver:
     begin
         SendMessage(GetDesktopWindow, WM_SYSCOMMAND, SC_SCREENSAVE, 0);
      end;
    wdControlPanel:
      begin
         ShellExecute(GetCurrentProcess, 'open','rundll32.exe',
                         'shell32,Control_RunDLL', nil, SW_SHOWNORMAL);
      end;
    wdSystemProperties:
      begin
         OpenCPLDialogs('SYSDM.CPL');
      end;
    wdDisplayProperties:
      begin
         OpenCPLDialogs('DESK.CPL');
      end;
    wdThemesProperties:
      begin
         OpenCPLDialogs('THEMES.CPL');
      end;
    wdPasswordsProperties:
      begin
         OpenCPLDialogs('PASSWORD.CPL');
      end;
    wdPowerManagementProperties:
      begin
         OpenCPLDialogs('POWERCFG.CPL');
      end;
    wdDateTimeProperties:
      begin
         ShellExecute(GetCurrentProcess, 'open', 'control',
                        'date/time', nil, SW_SHOW)
      end;
    wdAccessibilityProperties:
      begin
         OpenCPLDialogs('ACCESS.CPL');
      end;
    wdSoftwareProperties:
      begin
         OpenCPLDialogs('APPWIZ.CPL');
      end;
    wdDialProperties:
      begin
         OpenCPLDialogs('TELEPHON.CPL');
      end;
    wdFontsProperties:
      begin
         OpenCPLDialogs('MAIN.CPL @3');
      end;
    wdLocalRegionProperties:
      begin
         OpenCPLDialogs('INTL.CPL');
      end;
    wdPrinterProperties:
      begin
         OpenCPLDialogs('MAIN.CPL @2');
      end;
    wdMouseProperties:
      begin
         OpenCPLDialogs('MAIN.CPL @0');
      end;
    wdKeyboardProperties:
      begin
         OpenCPLDialogs('MAIN.CPL @1');
      end;
    wdNetworkProperties:
      begin
          OpenCPLDialogs('NETCPL.CPL');
      end;
    wdInternetProperties:
      begin
         OpenCPLDialogs('INETCPL.CPL');
      end;
    wdModemProperties:
      begin
         OpenCPLDialogs('MODEM.CPL');
      end;
    wdMultimediaProperties:
      begin
         OpenCPLDialogs('MMSYS.CPL');
      end;
    wdMailProperties:
      begin
         OpenCPLDialogs('MLCFG32.CPL');
      end;
    wdScanCamProperties:
      begin
         OpenCPLDialogs('STICPL.CPL');
      end;
    wdODBCProperties:
      begin
         OpenCPLDialogs('ODBCCP32.CPL');
      end;
    wdBDEProperties:
      begin
         OpenCPLDialogs('BDEADMIN.CPL');
      end;
  end;
end;

end.
