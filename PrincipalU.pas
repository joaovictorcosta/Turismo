unit PrincipalU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TPrincipalF = class(TForm)
    pnlMenu: TPanel;
    pnlAreaTrabalho: TPanel;
    imgFundo: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    btnPais: TBitBtn;
    btnEstado: TBitBtn;
    btnCidade: TBitBtn;
    btnLogradouro: TBitBtn;
    btnUsuario: TBitBtn;
    BitBtn8: TBitBtn;
    pnlRodape: TPanel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPaisClick(Sender: TObject);
    procedure btnLogradouroClick(Sender: TObject);
    procedure btnCidadeClick(Sender: TObject);
    procedure btnEstadoClick(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrincipalF: TPrincipalF;

implementation

uses ConsultaU, CadastroU, LoginU, CadLogradouroU,CadPaisU,CadEstadoU,
     CadCidadeU, CadUsuarioU;

{$R *.dfm}

procedure TPrincipalF.BitBtn1Click(Sender: TObject);
var
  ConsultaF: TConsultaF;
begin
  ConsultaF := TConsultaF.Create(Self);
  ConsultaF.Parent := pnlAreaTrabalho;
end;

procedure TPrincipalF.BitBtn2Click(Sender: TObject);
var
  CadastroF: TCadastroF;
begin
  CadastroF := TCadastroF.Create(Self);
  CadastroF.Parent := pnlAreaTrabalho;
end;

procedure TPrincipalF.btnCidadeClick(Sender: TObject);
begin
  ShowCadCidadeF('0');   // 0 para não encontrar registro e dar append
end;

procedure TPrincipalF.btnEstadoClick(Sender: TObject);
begin
  ShowCadEstadoF('0'); // 0 para não encontrar registro e dar append
end;

procedure TPrincipalF.btnLogradouroClick(Sender: TObject);
begin
  ShowCadLogradouroF('0');// 0 para não encontrar registro e dar append
end;

procedure TPrincipalF.btnPaisClick(Sender: TObject);
begin
  ShowCadPaisF('0'); // 0 para não encontrar registro e dar append
end;

procedure TPrincipalF.btnUsuarioClick(Sender: TObject);
begin
  ShowCadUsuarioF('0'); // 0 para não encontrar registro e dar append
end;

procedure TPrincipalF.FormShow(Sender: TObject);
begin
  LoginF := TLoginF.Create(Self);
  try
    LoginF.ShowModal;
    if LoginF.ModalResult <> mrOk then
      Application.Terminate;
  finally
    LoginF.Free;
  end;
end;

end.
