unit CadEstadoU;

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
  TCadEstadoF = class(TCadastroF)
    edtDescricao: TDBEdit;
    lblDescricao: TLabel;
    qryCadastroCODIGO: TIntegerField;
    qryCadastroDESCRICAO: TStringField;
    lblPais: TLabel;
    edtCodPais: TDBEdit;
    cmbDescPais: TDBLookupComboBox;
    qryPais: TFDQuery;
    qryPaisCODIGO: TIntegerField;
    qryPaisDESCRICAO: TStringField;
    qryCadastroCODIGOPAIS: TIntegerField;
    qryCadastroPAIS: TStringField;
    dsPais: TDataSource;
    procedure qryCadastroAfterOpen(DataSet: TDataSet);
    procedure qryCadastroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure ShowCadEstadoF(Codigo:String);

var
  CadEstadoF: TCadEstadoF;

implementation
uses UtilU;
{$R *.dfm}

procedure ShowCadEstadoF(Codigo:String);
begin
  CadEstadoF := TCadEstadoF.Create(Application);
  with CadEstadoF do
  begin
    qryCadastro.Close;
    qryCadastro.Params[0].AsString := Codigo;
    qryCadastro.Open;
  end;
end;



procedure TCadEstadoF.qryCadastroAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qryCadastroCODIGO.AsString := ProximaOrdem('ESTADO');
end;

procedure TCadEstadoF.qryCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (qryCadastroDESCRICAO.IsNull) or (Trim(qryCadastroDESCRICAO.AsString) = '') then
  begin
    ShowMessage('Descrição obrigatória para o cadastro de estado.');
    Abort;
  end;
  if (qryCadastroCODIGOPAIS.IsNull) or (Trim(qryCadastroCODIGOPAIS.AsString) = '') then
  begin
    ShowMessage('País obrigatório para o cadastro de estado.');
    Abort;
  end;
end;

end.
