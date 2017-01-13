object ConfigIniF: TConfigIniF
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Configura'#231#245'es'
  ClientHeight = 469
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 459
    Height = 430
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 449
    ExplicitHeight = 420
    object Memo1: TMemo
      Left = 1
      Top = 1
      Width = 457
      Height = 428
      Align = alClient
      Lines.Strings = (
        'Memo1')
      TabOrder = 0
      ExplicitWidth = 447
      ExplicitHeight = 418
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 430
    Width = 459
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 420
    ExplicitWidth = 449
    object Button1: TButton
      Left = 369
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 288
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
