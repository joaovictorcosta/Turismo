unit CadastroU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TelaU, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls;

type
  TCadastroF = class(TTelaF)
    pnlRodape: TPanel;
    btnFechar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    pnlConteudo: TPanel;
    pnlArvore: TPanel;
    tvMenu: TTreeView;
    qryCadastro: TFDQuery;
    pnlPrincipal: TPanel;
    lblCodigo: TLabel;
    edtCodigo: TDBEdit;
    dsCadastro: TDataSource;
    procedure btnFecharClick(Sender: TObject);
    procedure qryCadastroAfterOpen(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  protected
    Chave: String;
  public
    { Public declarations }
  end;

var
  CadastroF: TCadastroF;

implementation

uses PrincipalU;

{$R *.dfm}

procedure TCadastroF.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TCadastroF.btnSalvarClick(Sender: TObject);
begin
  inherited;
  qryCadastro.Post;
  qryCadastro.ApplyUpdates(0);
end;

procedure TCadastroF.qryCadastroAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if DataSet.IsEmpty then
    DataSet.Append
  else
    DataSet.Edit;
end;

end.
