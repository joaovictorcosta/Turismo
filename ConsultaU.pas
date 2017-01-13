unit ConsultaU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TelaU, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,
  Datasnap.Provider, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TConsultaF = class(TTelaF)
    pnlCabecalho: TPanel;
    btnInativar: TBitBtn;
    btnAlterar: TBitBtn;
    pnlRodape: TPanel;
    pnlConteudo: TPanel;
    grdConsulta: TDBGrid;
    dsConsulta: TDataSource;
    cdsConsulta: TClientDataSet;
    dspConsulta: TDataSetProvider;
    qryConsulta: TFDQuery;
    lblQtdRegistros: TLabel;
    Label1: TLabel;
    cdsConsultaCount: TAggregateField;
    pnlFiltros: TPanel;
    pnlFiltrosRodape: TPanel;
    btnFechar: TBitBtn;
    btnLimpar: TBitBtn;
    btnFiltrar: TBitBtn;
    pnlOpcoes: TPanel;
    btnIncluir: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    function dspConsultaDataRequest(Sender: TObject;
      Input: OleVariant): OleVariant;
    procedure cdsConsultaAfterOpen(DataSet: TDataSet);
    procedure btnFecharClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConsultaF: TConsultaF;

implementation

uses DmU, PrincipalU;

{$R *.dfm}

procedure TConsultaF.BitBtn5Click(Sender: TObject);
begin
  inherited;
  pnlFiltros.Visible := pnlFiltros.Visible = False;
end;

procedure TConsultaF.btnFecharClick(Sender: TObject);
begin
  inherited;
  pnlFiltros.Visible := False;
end;

procedure TConsultaF.cdsConsultaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  lblQtdRegistros.Caption := 'Qtd. Registro:   '+cdsConsultaCount.AsString;
end;

function TConsultaF.dspConsultaDataRequest(Sender: TObject;
  Input: OleVariant): OleVariant;
begin
  inherited;
  qryConsulta.SQL.Text := Input;
end;

procedure TConsultaF.FormCreate(Sender: TObject);
begin
  inherited;
  Parent := PrincipalF.pnlAreaTrabalho;
end;

end.
