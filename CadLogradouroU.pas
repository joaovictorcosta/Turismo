unit CadLogradouroU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroU, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TCadLogradouroF = class(TCadastroF)
    edtDescricao: TDBEdit;
    lblDescricao: TLabel;
    qryCadastroCODIGO: TIntegerField;
    qryCadastroDESCRICAO: TStringField;
    lblBairro: TLabel;
    edtBairro: TDBEdit;
    qryCadastroBAIRRO: TStringField;
    qryCadastroCODIGOCIDADE: TIntegerField;
    lblPais: TLabel;
    cmbDescCidade: TDBLookupComboBox;
    qryCidade: TFDQuery;
    qryCidadeCODIGO: TIntegerField;
    qryCidadeDESCRICAO: TStringField;
    qryCadastroCIDADE: TStringField;
    edtCodCidade: TDBEdit;
    dsCidade: TDataSource;
    procedure qryCadastroAfterInsert(DataSet: TDataSet);
    procedure qryCadastroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure ShowCadLogradouroF(Codigo:String);
var
  CadLogradouroF: TCadLogradouroF;

implementation
uses UtilU;
{$R *.dfm}

procedure ShowCadLogradouroF(Codigo:String);
begin
  CadLogradouroF := TCadLogradouroF.Create(Application);
  with CadLogradouroF do
  begin
    qryCadastro.Close;
    qryCadastro.Params[0].AsString := Codigo;
    qryCadastro.Open;
  end;
end;

procedure TCadLogradouroF.qryCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryCadastroCODIGO.AsString := ProximaOrdem('LOGRADOURO');
end;

procedure TCadLogradouroF.qryCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (qryCadastroDESCRICAO.IsNull) or (Trim(qryCadastroDESCRICAO.AsString) = '') then
  begin
    ShowMessage('Descrição obrigatória para o cadastro de logradouro.');
    Abort;
  end;
  if (qryCadastroCODIGOCIDADE.IsNull) or (Trim(qryCadastroCODIGOCIDADE.AsString) = '') then
  begin
    ShowMessage('Cidade obrigatória para o cadastro de logradouro.');
    Abort;
  end;
end;

end.
