unit DmU;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, IniFiles, Vcl.Forms,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Comp.UI,
  FireDAC.Phys.ODBCDef, FireDAC.Phys.ODBCBase, FireDAC.Phys.ODBC;

type
  TDmF = class(TDataModule)
    Conexao: TFDConnection;
  private
    { Private declarations }
  published
    { Published declarations }
    Ini: TIniFile;
  public
    { Public declarations }
    function ConectarBanco: Boolean;
  end;

var
  DmF: TDmF;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses LoginU;

{$R *.dfm}

function TDmF.ConectarBanco: Boolean;
var
  CaminhoINI:String;
begin
  if not Conexao.Connected then
  begin
    CaminhoINI := ExtractFileDir(Application.ExeName)+'\'+StringReplace(ExtractFileName(Application.ExeName),ExtractFileExt(Application.ExeName),'',[])+'.ini';
    Ini := TIniFile.Create(CaminhoINI);
    if not FileExists(CaminhoINI) then
    begin
      Ini.WriteString('CONFIG','DATABASE','LOCALHOST:'+ExtractFileDir(Application.ExeName)+'\TURISMO.FDB');
      Ini.WriteString('CONFIG','DRIVER','FB');
      Ini.WriteString('CONFIG','USER','SYSDBA');
      Ini.WriteString('CONFIG','SENHA','MASTERKEY');
      Ini.WriteString('CONFIG','PORTA','COM1');
    end;
    try
      if not Conexao.Connected then
      begin
        Conexao.Params.Database := Ini.ReadString('CONFIG','DATABASE','LOCALHOST:'+ExtractFileDir(Application.ExeName)+'\TURISMO.FDB');
        Conexao.DriverName     := Ini.ReadString('CONFIG','DRIVER','FB');
        Conexao.Params.Add('USER "'+Ini.ReadString('CONFIG','USER','SYSDBA')+'"');
        Conexao.Params.Add('PASSWORD "'+Ini.ReadString('CONFIG','SENHA','MASTERKEY')+'"');
        Conexao.Params.Add('PAGE_SIZE = 16384');
        if not FileExists(Conexao.ConnectionName) then
        begin
          //Criar banco dinâmico;
        end;
      end;
      Conexao.Connected := False;
      Conexao.Connected := True;
      Result := Conexao.Connected;
    except on E: Exception do
    begin
      LoginF.ModalResult := 0;
      raise Exception.Create('Falha ao conectar com o banco de dados. '+#13+#13+e.Message);
    end;
    end;
  end
  else
    Result := True;
end;

end.
