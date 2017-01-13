program Turismo;

uses
  Vcl.Forms,
  PrincipalU in 'PrincipalU.pas' {PrincipalF},
  DmU in 'DmU.pas' {DmF: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  TelaU in 'TelaU.pas' {TelaF},
  ConsultaU in 'ConsultaU.pas' {ConsultaF},
  CadastroU in 'CadastroU.pas' {CadastroF},
  LoginU in 'LoginU.pas' {LoginF},
  CadLogradouroU in 'CadLogradouroU.pas' {CadLogradouroF},
  UtilU in 'UtilU.pas',
  CadCidadeU in 'CadCidadeU.pas' {CadCidadeF},
  CadPaisU in 'CadPaisU.pas' {CadPaisF},
  CadEstadoU in 'CadEstadoU.pas' {CadEstadoF},
  CadUsuarioU in 'CadUsuarioU.pas' {CadUsuarioF},
  ConfigIniU in 'ConfigIniU.pas' {ConfigIniF};

{$R *.res}
begin
  Application.Initialize;
  TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TPrincipalF, PrincipalF);
  Application.CreateForm(TDmF, DmF);
  Application.CreateForm(TConfigIniF, ConfigIniF);
  Application.Run;
end.
