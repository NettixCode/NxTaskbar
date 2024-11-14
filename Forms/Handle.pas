unit Handle;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;
  {$R 'NxAdmin.RES' 'NxAdmin.RC'}

type
  THandleForm = class(TForm)
    SchXML: TMemo;
    schTMP: TMemo;
    TimerDeleteXML: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerDeleteXMLTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HandleForm: THandleForm;

implementation

{$R *.dfm}

procedure THandleForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure THandleForm.FormCreate(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
  Application.ShowMainForm := False;
  Application.MainFormOnTaskBar := False;
end;

procedure THandleForm.FormShow(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
  Application.ShowMainForm := False;
  Application.MainFormOnTaskBar := False;
end;

procedure THandleForm.TimerDeleteXMLTimer(Sender: TObject);
begin
  DeleteFile(ExtractFilePath(Application.ExeName)+'NxTaskbar.xml');
  TimerDeleteXML.Enabled := False;
end;

end.
