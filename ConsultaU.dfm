inherited ConsultaF: TConsultaF
  ClientHeight = 507
  ClientWidth = 754
  OnCreate = FormCreate
  ExplicitWidth = 770
  ExplicitHeight = 545
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCabecalho: TPanel
    Left = 1
    Top = 1
    Width = 752
    Height = 50
    Align = alTop
    TabOrder = 0
    object btnInativar: TBitBtn
      Left = 151
      Top = 1
      Width = 75
      Height = 48
      Align = alLeft
      Caption = 'Inativar'
      TabOrder = 0
    end
    object btnAlterar: TBitBtn
      Left = 76
      Top = 1
      Width = 75
      Height = 48
      Align = alLeft
      Caption = 'Alterar'
      TabOrder = 1
    end
    object btnIncluir: TBitBtn
      Left = 1
      Top = 1
      Width = 75
      Height = 48
      Align = alLeft
      Caption = 'Incluir'
      TabOrder = 2
    end
  end
  object pnlRodape: TPanel
    Left = 1
    Top = 481
    Width = 752
    Height = 25
    Align = alBottom
    TabOrder = 1
    object lblQtdRegistros: TLabel
      AlignWithMargins = True
      Left = 659
      Top = 4
      Width = 89
      Height = 17
      Align = alRight
      Caption = 'Qtd. Registro:    '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitHeight = 13
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 50
      Height = 17
      Align = alLeft
      Caption = 'Totais:    '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitHeight = 13
    end
  end
  object pnlConteudo: TPanel
    Left = 1
    Top = 51
    Width = 720
    Height = 430
    Align = alClient
    TabOrder = 2
    object grdConsulta: TDBGrid
      Left = 1
      Top = 1
      Width = 718
      Height = 428
      Align = alClient
      Color = clBtnFace
      DataSource = dsConsulta
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          Visible = True
        end
        item
          Expanded = False
          Visible = True
        end
        item
          Expanded = False
          Visible = True
        end>
    end
    object pnlFiltros: TPanel
      Left = 108
      Top = 79
      Width = 509
      Height = 272
      Align = alCustom
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsSingle
      Ctl3D = True
      DoubleBuffered = False
      ParentCtl3D = False
      ParentDoubleBuffered = False
      TabOrder = 1
      object pnlFiltrosRodape: TPanel
        Left = 1
        Top = 242
        Width = 503
        Height = 25
        Align = alBottom
        TabOrder = 0
        object btnFechar: TBitBtn
          Left = 427
          Top = 1
          Width = 75
          Height = 23
          Align = alRight
          Caption = 'Fechar'
          TabOrder = 0
          OnClick = btnFecharClick
        end
        object btnLimpar: TBitBtn
          Left = 352
          Top = 1
          Width = 75
          Height = 23
          Align = alRight
          Caption = 'Limpar'
          TabOrder = 1
        end
        object btnFiltrar: TBitBtn
          Left = 277
          Top = 1
          Width = 75
          Height = 23
          Align = alRight
          Caption = 'Filtrar'
          TabOrder = 2
        end
      end
    end
  end
  object pnlOpcoes: TPanel
    Left = 721
    Top = 51
    Width = 32
    Height = 430
    Align = alRight
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 1
      Top = 97
      Width = 30
      Height = 24
      Align = alTop
      Caption = 'DT'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 1
      Top = 73
      Width = 30
      Height = 24
      Align = alTop
      Caption = 'MT'
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 1
      Top = 49
      Width = 30
      Height = 24
      Align = alTop
      Caption = 'D'
      TabOrder = 2
    end
    object BitBtn4: TBitBtn
      Left = 1
      Top = 25
      Width = 30
      Height = 24
      Align = alTop
      Caption = 'M'
      TabOrder = 3
    end
    object BitBtn5: TBitBtn
      Left = 1
      Top = 1
      Width = 30
      Height = 24
      Align = alTop
      Caption = 'F'
      TabOrder = 4
      OnClick = BitBtn5Click
    end
  end
  object dsConsulta: TDataSource
    DataSet = cdsConsulta
    Left = 688
    Top = 64
  end
  object cdsConsulta: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspConsulta'
    AfterOpen = cdsConsultaAfterOpen
    Left = 648
    Top = 64
    object cdsConsultaCount: TAggregateField
      FieldName = 'Count'
      DisplayName = ''
      Expression = 'Count(1)'
    end
  end
  object dspConsulta: TDataSetProvider
    DataSet = qryConsulta
    OnDataRequest = dspConsultaDataRequest
    Left = 608
    Top = 64
  end
  object qryConsulta: TFDQuery
    Connection = DmF.Conexao
    Left = 568
    Top = 64
  end
end
