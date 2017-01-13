inherited CadUsuarioF: TCadUsuarioF
  Caption = 'Cadastro de Usu'#225'rio'
  ExplicitTop = 1
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlConteudo: TPanel
    inherited pnlPrincipal: TPanel
      object lblDescricao: TLabel [1]
        Left = 19
        Top = 54
        Width = 43
        Height = 13
        Caption = 'Usu'#225'rio: '
      end
      object Label1: TLabel [2]
        Left = 19
        Top = 78
        Width = 37
        Height = 13
        Caption = 'Senha: '
      end
      inherited edtCodigo: TDBEdit
        DataField = 'CODIGO'
        DataSource = dsCadastro
      end
      object edtDescricao: TDBEdit
        Left = 78
        Top = 51
        Width = 259
        Height = 21
        DataField = 'NOME'
        DataSource = dsCadastro
        TabOrder = 1
      end
      object edtSenha: TDBEdit
        Left = 78
        Top = 75
        Width = 259
        Height = 21
        DataField = 'SENHA'
        DataSource = dsCadastro
        PasswordChar = '*'
        TabOrder = 2
      end
    end
  end
  inherited qryCadastro: TFDQuery
    AfterInsert = qryCadastroAfterInsert
    BeforePost = qryCadastroBeforePost
    SQL.Strings = (
      'SELECT * FROM USUARIO'
      'WHERE CODIGO = :CODIGO')
    ParamData = <
      item
        Name = 'CODIGO'
        ParamType = ptInput
      end>
    object qryCadastroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
    end
    object qryCadastroNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object qryCadastroSENHA: TStringField
      FieldName = 'SENHA'
      Size = 50
    end
  end
end
