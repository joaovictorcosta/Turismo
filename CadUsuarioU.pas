unit CadUsuarioU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroU, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TCadUsuarioF = class(TCadastroF)
    lblDescricao: TLabel;
    edtDescricao: TDBEdit;
    Label1: TLabel;
    edtSenha: TDBEdit;
    qryCadastroCODIGO: TIntegerField;
    qryCadastroNOME: TStringField;
    qryCadastroSENHA: TStringField;
    procedure qryCadastroBeforePost(DataSet: TDataSet);
    procedure qryCadastroAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure ShowCadUsuarioF(Codigo:String);
var
  CadUsuarioF: TCadUsuarioF;

implementation
 uses UtilU;
{$R *.dfm}

procedure ShowCadUsuarioF(Codigo:String);
begin
  CadUsuarioF := TCadUsuarioF.Create(Application);
  with CadUsuarioF do
  begin
    qryCadastro.Close;
    qryCadastro.Params[0].AsString := Codigo;
    qryCadastro.Open;
  end;
end;

procedure TCadUsuarioF.qryCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryCadastroCODIGO.AsString := ProximaOrdem('USUARIO');
end;

procedure TCadUsuarioF.qryCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (qryCadastroNOME.IsNull) or (Trim(qryCadastroNOME.AsString) = '') then
  begin
    ShowMessage('Usuário obrigatório para o cadastro de usuário.');
    Abort;
  end;
  if (qryCadastroSENHA.IsNull) or (Trim(qryCadastroSENHA.AsString) = '') then
  begin
    ShowMessage('Senha obrigatória para o cadastro de usuário.');
    Abort;
  end;
end;

end.
