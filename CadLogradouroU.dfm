inherited CadLogradouroF: TCadLogradouroF
  Caption = 'Cadastro de Logradouro'
  ClientHeight = 211
  ClientWidth = 450
  ExplicitTop = 8
  ExplicitWidth = 466
  ExplicitHeight = 249
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodape: TPanel
    Top = 168
    Width = 448
    ExplicitTop = 168
    ExplicitWidth = 448
    inherited btnFechar: TBitBtn
      Left = 355
      ExplicitLeft = 355
    end
    inherited btnSalvar: TBitBtn
      Left = 171
      ExplicitLeft = 171
    end
    inherited btnCancelar: TBitBtn
      Left = 263
      ExplicitLeft = 263
    end
  end
  inherited pnlConteudo: TPanel
    Width = 352
    Height = 167
    ExplicitWidth = 352
    ExplicitHeight = 167
    inherited pnlPrincipal: TPanel
      Width = 350
      Height = 165
      ExplicitWidth = 350
      ExplicitHeight = 165
      object lblDescricao: TLabel [1]
        Left = 19
        Top = 54
        Width = 53
        Height = 13
        Caption = 'Descri'#231#227'o: '
      end
      object lblBairro: TLabel [2]
        Left = 19
        Top = 81
        Width = 35
        Height = 13
        Caption = 'Bairro: '
      end
      object lblPais: TLabel [3]
        Left = 19
        Top = 108
        Width = 40
        Height = 13
        Caption = 'Cidade: '
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
      object edtBairro: TDBEdit
        Left = 78
        Top = 78
        Width = 259
        Height = 21
        DataField = 'BAIRRO'
        DataSource = dsCadastro
        TabOrder = 2
      end
      object edtCodCidade: TDBEdit
        Left = 78
        Top = 105
        Width = 51
        Height = 21
        DataField = 'CODIGOCIDADE'
        DataSource = dsCadastro
        TabOrder = 3
      end
    end
  end
  inherited pnlArvore: TPanel
    Height = 167
    ExplicitHeight = 167
    inherited tvMenu: TTreeView
      Height = 165
      ExplicitHeight = 165
    end
  end
  object cmbDescCidade: TDBLookupComboBox [3]
    Left = 227
    Top = 107
    Width = 208
    Height = 21
    DataField = 'CODIGOCIDADE'
    DataSource = dsCadastro
    KeyField = 'CODIGO'
    ListField = 'DESCRICAO'
    ListSource = dsCidade
    TabOrder = 3
  end
  inherited qryCadastro: TFDQuery
    AfterInsert = qryCadastroAfterInsert
    BeforePost = qryCadastroBeforePost
    SQL.Strings = (
      'SELECT * FROM LOGRADOURO'
      'WHERE CODIGO = :CODIGO')
    Left = 32
    Top = 104
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
    object qryCadastroBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 50
    end
    object qryCadastroCODIGOCIDADE: TIntegerField
      FieldName = 'CODIGOCIDADE'
      Origin = 'CODIGOCIDADE'
    end
    object qryCadastroCIDADE: TStringField
      FieldKind = fkLookup
      FieldName = 'CIDADE'
      LookupDataSet = qryCidade
      LookupKeyFields = 'CODIGO'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'CODIGO'
      Size = 50
      Lookup = True
    end
  end
  inherited dsCadastro: TDataSource
    Left = 501
    Top = 22
  end
  object qryCidade: TFDQuery
    Connection = DmF.Conexao
    SQL.Strings = (
      'SELECT CODIGO,DESCRICAO FROM CIDADE')
    Left = 32
    Top = 152
    object qryCidadeCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
    end
    object qryCidadeDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
  end
  object dsCidade: TDataSource
    DataSet = qryCidade
    Left = 56
    Top = 152
  end
end
