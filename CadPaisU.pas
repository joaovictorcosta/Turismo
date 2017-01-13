unit CadPaisU;

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
  TCadPaisF = class(TCadastroF)
    edtDescricao: TDBEdit;
    lblDescricao: TLabel;
    qryCadastroCODIGO: TIntegerField;
    qryCadastroDESCRICAO: TStringField;
    procedure qryCadastroAfterInsert(DataSet: TDataSet);
    procedure qryCadastroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure ShowCadPaisF(Codigo:String);

var
  CadPaisF: TCadPaisF;

implementation

uses UtilU;

{$R *.dfm}

procedure ShowCadPaisF(Codigo:String);
begin
  CadPaisF := TCadPaisF.Create(Application);
  with CadPaisF do
  begin
    qryCadastro.Close;
    qryCadastro.Params[0].AsString := Codigo;
    qryCadastro.Open;
  end;
end;

procedure TCadPaisF.qryCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryCadastroCODIGO.AsString := ProximaOrdem('PAIS');
end;

procedure TCadPaisF.qryCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (qryCadastroDESCRICAO.IsNull) or (Trim(qryCadastroDESCRICAO.AsString) = '') then
  begin
    ShowMessage('Descrição obrigatória para o cadastro de país');
    Abort;
  end;
end;

end.
