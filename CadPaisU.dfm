inherited CadPaisF: TCadPaisF
  Caption = 'Cadastro de Pais'
  ClientHeight = 186
  ClientWidth = 450
  ExplicitWidth = 466
  ExplicitHeight = 224
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 143
    Width = 448
    ExplicitTop = 143
    ExplicitWidth = 448
    inherited btnFechar: TBitBtn
      Left = 355
      ExplicitLeft = 355
    end
    inherited btnSalvar: TBitBtn
      Left = 171
      OnClick = btnSalvarClick
      ExplicitLeft = 171
    end
    inherited btnCancelar: TBitBtn
      Left = 263
      ExplicitLeft = 263
    end
  end
  inherited pnlConteudo: TPanel
    Width = 352
    Height = 142
    ExplicitWidth = 352
    ExplicitHeight = 142
    inherited pnlPrincipal: TPanel
      Width = 350
      Height = 140
      ExplicitWidth = 350
      ExplicitHeight = 140
      object lblDescricao: TLabel [1]
        Left = 19
        Top = 54
        Width = 53
        Height = 13
        Caption = 'Descri'#231#227'o: '
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
        DataField = 'DESCRICAO'
        DataSource = dsCadastro
        TabOrder = 1
      end
    end
  end
  inherited pnlArvore: TPanel
    Height = 142
    ExplicitHeight = 142
    inherited tvMenu: TTreeView
      Height = 140
      ExplicitHeight = 140
    end
  end
  inherited qryCadastro: TFDQuery
    AfterInsert = qryCadastroAfterInsert
    BeforePost = qryCadastroBeforePost
    SQL.Strings = (
      'SELECT * FROM PAIS'
      'WHERE CODIGO = :CODIGO')
    Left = 152
    Top = 88
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object qryCadastroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
    end
    object qryCadastroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
  end
  inherited dsCadastro: TDataSource
    Left = 501
    Top = 22
  end
end
