unit LoginU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TelaU, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TLoginF = class(TTelaF)
    Panel1: TPanel;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnEntrar: TBitBtn;
    btnFechar: TBitBtn;
    btnConfiguracao: TBitBtn;
    procedure btnEntrarClick(Sender: TObject);
    procedure btnConfiguracaoClick(Sender: TObject);
  private
    { Private declarations }
    procedure ValidarDados;
    procedure VerificaLogin;
  public
    { Public declarations }
  end;

var
  LoginF: TLoginF;

implementation

uses DmU,ConfigIniU;

{$R *.dfm}
procedure TLoginF.ValidarDados;
begin
  if Trim(edtUsuario.Text) = '' then
  begin
    ShowMessage('Informe o Usuário!');
    ModalResult := mrNone;
    Abort;
  end
  else
  if Trim(edtSenha.Text) = '' then
  begin
    ShowMessage('Informe a Senha!');
    ModalResult := mrNone;
    Abort;
  end;
  VerificaLogin;
end;

procedure TLoginF.VerificaLogin;
var
  qryTemp:TFDQuery;
begin
  qryTemp := TFDQuery.Create(nil);
  try
    with qryTemp do
    begin
      Connection := DmF.Conexao;
      Close;
      SQL.Text := 'SELECT SENHA FROM USUARIO WHERE NOME = '+QuotedStr(edtUsuario.Text);
      Open;
      if isEmpty then
      begin
        ShowMessage('Login inválido.');
        ModalResult := mrNone;
        Abort;
      end
      else
      if edtSenha.Text <> FieldByName('SENHA').AsString then
      begin
        ShowMessage('Senha inválida.');
        ModalResult := mrNone;
        Abort;
      end;
    end;
  finally
    qryTemp.Free;
  end;
end;


procedure TLoginF.btnConfiguracaoClick(Sender: TObject);
begin
  inherited;
  ShowConfigIniF;
end;

procedure TLoginF.btnEntrarClick(Sender: TObject);
begin
  if DmF.ConectarBanco then
  begin
    ValidarDados;
    ModalResult := mrOk;
    inherited;
  end
  else
    ModalResult := mrNone;

end;

end.
