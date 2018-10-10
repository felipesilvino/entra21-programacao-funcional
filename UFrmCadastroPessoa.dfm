object FrmCadastroPessoa: TFrmCadastroPessoa
  Left = 0
  Top = 0
  Caption = 'Cadatro de Pessoa'
  ClientHeight = 308
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbInformacoesPessoa: TGroupBox
    Left = 0
    Top = 41
    Width = 664
    Height = 215
    Align = alClient
    Caption = ' Informa'#231#245'es da Pessoa '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitTop = 35
    object lbNome: TLabel
      Left = 112
      Top = 31
      Width = 42
      Height = 19
      Alignment = taRightJustify
      Caption = 'Nome'
    end
    object lbSalario: TLabel
      Left = 106
      Top = 153
      Width = 48
      Height = 19
      Alignment = taRightJustify
      Caption = 'Sal'#225'rio'
    end
    object lbLimiteCredito: TLabel
      Left = 33
      Top = 180
      Width = 121
      Height = 19
      Alignment = taRightJustify
      Caption = 'Limite de Cr'#233'dito'
    end
    object lbInscricaoFederal: TLabel
      Left = 35
      Top = 125
      Width = 119
      Height = 19
      Alignment = taRightJustify
      Caption = 'Inscri'#231#227'o Federal'
    end
    object edNome: TEdit
      Left = 160
      Top = 28
      Width = 368
      Height = 27
      TabOrder = 0
    end
    object edSalario: TFloatEdit
      Left = 160
      Top = 149
      Width = 121
      Height = 27
      TabOrder = 3
      Decimals = 2
    end
    object edLimiteCredito: TFloatEdit
      Left = 160
      Top = 176
      Width = 121
      Height = 27
      TabOrder = 4
      Decimals = 2
    end
    object edInscricaoFederal: TEdit
      Left = 160
      Top = 122
      Width = 121
      Height = 27
      TabOrder = 2
    end
    object rgTipoPessoa: TRadioGroup
      Left = 160
      Top = 61
      Width = 368
      Height = 54
      Caption = ' Tipo Pessoa '
      Columns = 2
      Items.Strings = (
        'Funcionario'
        'Cliente')
      TabOrder = 1
      OnClick = rgTipoPessoaClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 664
    Height = 41
    Align = alTop
    Caption = 'CADASTRO DE PESSOA'
    Color = clActiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 296
    ExplicitTop = 24
    ExplicitWidth = 185
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 256
    Width = 664
    Height = 52
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      664
      52)
    object btnGravar: TButton
      Left = 319
      Top = 9
      Width = 169
      Height = 33
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Gravar'
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnSair: TButton
      Left = 487
      Top = 9
      Width = 169
      Height = 33
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Sair'
      TabOrder = 1
      OnClick = btnSairClick
    end
  end
end
