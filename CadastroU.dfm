inherited CadastroF: TCadastroF
  Caption = 'CadastroF'
  ClientHeight = 507
  ClientWidth = 754
  ExplicitTop = -92
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRodape: TPanel
    Left = 1
    Top = 464
    Width = 752
    Height = 42
    Align = alBottom
    TabOrder = 0
    object btnFechar: TBitBtn
      Left = 659
      Top = 1
      Width = 92
      Height = 40
      Align = alRight
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
    end
    object btnSalvar: TBitBtn
      Left = 475
      Top = 1
      Width = 92
      Height = 40
      Align = alRight
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = btnSalvarClick
    end
    object btnCancelar: TBitBtn
      Left = 567
      Top = 1
      Width = 92
      Height = 40
      Align = alRight
      Caption = 'Cancelar'
      TabOrder = 2
    end
  end
  object pnlConteudo: TPanel
    Left = 97
    Top = 1
    Width = 656
    Height = 463
    Align = alClient
    TabOrder = 1
    object pnlPrincipal: TPanel
      Left = 1
      Top = 1
      Width = 654
      Height = 461
      Align = alClient
      TabOrder = 0
      object lblCodigo: TLabel
        Left = 19
        Top = 27
        Width = 27
        Height = 13
        Caption = 'C'#243'd.:'
      end
      object edtCodigo: TDBEdit
        Left = 78
        Top = 24
        Width = 110
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object pnlArvore: TPanel
    Left = 1
    Top = 1
    Width = 96
    Height = 463
    Align = alLeft
    TabOrder = 2
    object tvMenu: TTreeView
      Left = 1
      Top = 1
      Width = 94
      Height = 461
      Align = alClient
      Indent = 19
      TabOrder = 0
      Items.NodeData = {
        0301000000300000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        000000000001095000720069006E0063006900700061006C00}
    end
  end
  object qryCadastro: TFDQuery
    AfterOpen = qryCadastroAfterOpen
    CachedUpdates = True
    Connection = DmF.Conexao
    Left = 640
    Top = 16
  end
  object dsCadastro: TDataSource
    DataSet = qryCadastro
    Left = 600
    Top = 16
  end
end
