unit CadCidadeU;

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
  TCadCidadeF = class(TCadastroF)
    edtDescricao: TDBEdit;
    lblDescricao: TLabel;
    qryCadastroCODIGO: TIntegerField;
    qryCadastroDESCRICAO: TStringField;
    qryCadastroCODIGOESTADO: TIntegerField;
    qryEstado: TFDQuery;
    qryEstadoCODIGO: TIntegerField;
    qryEstadoDESCRICAO: TStringField;
    lblPais: TLabel;
    edtCodEstado: TDBEdit;
    cmbDescEstado: TDBLookupComboBox;
    qryCadastroESTADO: TStringField;
    dsEstado: TDataSource;
    procedure qryCadastroAfterInsert(DataSet: TDataSet);
    procedure qryCadastroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure ShowCadCidadeF(Codigo:String);
var
  CadCidadeF: TCadCidadeF;

implementation
uses UtilU;
{$R *.dfm}

procedure ShowCadCidadeF(Codigo:String);
begin
  CadCidadeF := TCadCidadeF.Create(Application);
  with CadCidadeF do
  begin
    qryCadastro.Close;
    qryCadastro.Params[0].AsString := Codigo;
    qryCadastro.Open;
  end;
end;

procedure TCadCidadeF.qryCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryCadastroCODIGO.AsString := ProximaOrdem('CIDADE');
end;

procedure TCadCidadeF.qryCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (qryCadastroDESCRICAO.IsNull) or (Trim(qryCadastroDESCRICAO.AsString) = '') then
  begin
    ShowMessage('Descrição obrigatória para o cadastro de cidade.');
    Abort;
  end;
  if (qryCadastroCODIGOESTADO.IsNull) or (Trim(qryCadastroCODIGOESTADO.AsString) = '') then
  begin
    ShowMessage('Estado obrigatório para o cadastro de cidade.');
    Abort;
  end;
end;

end.
