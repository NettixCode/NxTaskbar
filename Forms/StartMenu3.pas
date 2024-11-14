unit StartMenu3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Registry,
  ActiveX,
  ComObj,MPCommonObjects, EasyListview,
  VirtualExplorerEasyListview,
  ShlObj, Vcl.StdCtrls, VirtualExplorerEasyListModeview, scStyledForm,
  sSkinManager;


type
  TStartMenu3Form = class(TForm)
    Button2: TButton;
    VirtualColumnModeView1: TVirtualColumnModeView;
    sSkinManager1: TsSkinManager;
    procedure VirtualColumnModeView1ListviewRootChange(
      Sender: TCustomVirtualColumnModeView;
      Listview: TCustomVirtualExplorerEasyListview);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StartMenu3Form: TStartMenu3Form;

implementation

{$R *.dfm}

procedure TStartMenu3Form.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle,SW_HIDE);
end;

procedure TStartMenu3Form.VirtualColumnModeView1ListviewRootChange(
  Sender: TCustomVirtualColumnModeView;
  Listview: TCustomVirtualExplorerEasyListview);
begin
  Width := (VirtualColumnModeView1.ViewCount *
           VirtualColumnModeView1.DefaultColumnWidth)
           + 20;
  if Width > Screen.Width then
    VirtualColumnModeView1.HorzScrollBar.Visible := True
    else
    VirtualColumnModeView1.HorzScrollBar.Visible := False;
end;

end.
