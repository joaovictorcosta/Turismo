inherited LoginF: TLoginF
  Anchors = []
  BorderStyle = bsDialog
  Caption = 'LoginF'
  ClientHeight = 150
  ClientWidth = 350
  DefaultMonitor = dmMainForm
  Position = poDesktopCenter
  PrintScale = poNone
  Visible = False
  WindowState = wsNormal
  ExplicitWidth = 356
  ExplicitHeight = 178
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 1
    Top = 1
    Width = 348
    Height = 148
    Align = alClient
    TabOrder = 0
    object lblUsuario: TLabel
      Left = 33
      Top = 45
      Width = 40
      Height = 13
      Caption = 'Usu'#225'rio:'
      Transparent = True
    end
    object lblSenha: TLabel
      Left = 33
      Top = 72
      Width = 34
      Height = 13
      Caption = 'Senha:'
      Transparent = True
    end
    object edtUsuario: TEdit
      Left = 112
      Top = 42
      Width = 199
      Height = 21
      TabOrder = 0
    end
    object edtSenha: TEdit
      Left = 112
      Top = 69
      Width = 199
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object btnEntrar: TBitBtn
      Left = 155
      Top = 106
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Hint = 'Realizar Login'
      ParentCustomHint = False
      Cancel = True
      Caption = 'Entrar'
      Default = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 1
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnEntrarClick
    end
    object btnFechar: TBitBtn
      Left = 236
      Top = 106
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Hint = 'Fechar Sistema'
      Caption = 'Fechar'
      Kind = bkAbort
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object btnConfiguracao: TBitBtn
      Left = 311
      Top = 11
      Width = 24
      Height = 25
      Cursor = crHandPoint
      Hint = 'Configura'#231#245'es'
      Caption = '&'
      Kind = bkHelp
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnConfiguracaoClick
    end
  end
end
