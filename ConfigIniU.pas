unit ConfigIniU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IniFiles;

type
  TConfigIniF = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    CaminhoINI:String;
    procedure CarregarDados;
  public
    { Public declarations }
  end;
  procedure ShowConfigIniF;

var
  ConfigIniF: TConfigIniF;

implementation

{$R *.dfm}

procedure ShowConfigIniF;
begin
  ConfigIniF := TConfigIniF.Create(application);
  try
    ConfigIniF.CarregarDados;
    ConfigIniF.ShowModal;
  finally
    ConfigIniF.Free;
  end;
end;

procedure TConfigIniF.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TConfigIniF.Button2Click(Sender: TObject);
begin
  Memo1.Lines.SaveToFile(CaminhoINI);
end;

procedure TConfigIniF.CarregarDados;
var
  xIni: TIniFile;
begin
  CaminhoINI := ExtractFileDir(Application.ExeName)+'\'+StringReplace(ExtractFileName(Application.ExeName),ExtractFileExt(Application.ExeName),'',[])+'.ini';
  xIni := TIniFile.Create(CaminhoINI);
  memo1.Lines.Clear;
  if not FileExists(CaminhoINI) then
  begin
    xIni.WriteString('CONFIG','DATABASE','LOCALHOST:'+ExtractFileDir(Application.ExeName)+'\TURISMO.FDB');
    xIni.WriteString('CONFIG','DRIVER','FB');
    xIni.WriteString('CONFIG','USER','SYSDBA');
    xIni.WriteString('CONFIG','SENHA','MASTERKEY');
    xIni.WriteString('CONFIG','PORTA','COM1');
  end;
  Memo1.Lines.LoadFromFile(CaminhoINI);

end;

end.
