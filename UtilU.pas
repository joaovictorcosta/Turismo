unit UtilU;

interface

uses FireDAC.Comp.Client, DmU, System.SysUtils;

function ProximaOrdem(Const NomeTabela: String): String;

implementation

function ProximaOrdem(Const NomeTabela: String): String;
var
  QryExec: TFDQuery;
begin
  QryExec := TFDQuery.Create(nil);
  try
    with QryExec do
    begin
      Connection := DmF.Conexao;

      Close;
      SQL.Text := 'SELECT * FROM ORDEM WHERE TABELA = '+QuotedStr(UpperCase(NomeTabela));
      Open;

      if IsEmpty then
      begin
        Close;
        SQL.Text := 'INSERT INTO ORDEM(TABELA,ORDEM) VALUES ('+QuotedStr(UpperCase(NomeTabela))+',1)';
        ExecSQL();
        Result   := '1';
      end
      else
      begin
        Result   := IntToStr(FieldByName('ORDEM').AsInteger + 1);
        Close;
        SQL.Text := 'UPDATE ORDEM SET ORDEM = ORDEM + 1 WHERE TABELA = '+QuotedStr(UpperCase(NomeTabela));
        ExecSQL();
      end;
    end;
  finally
    QryExec.Free;
  end;
end;

end.
