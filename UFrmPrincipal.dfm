object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Projeto Programa'#231#227'o Funcional'
  ClientHeight = 506
  ClientWidth = 593
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmCadastroPessoa
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 23
  object sbProgramacaoFuncional: TStatusBar
    Left = 0
    Top = 472
    Width = 593
    Height = 34
    Panels = <
      item
        Text = 'Total de pessoas cadastradas: 0'
        Width = 50
      end>
  end
  object mmCadastroPessoa: TMainMenu
    Left = 352
    Top = 64
    object miCadastro: TMenuItem
      Caption = 'Cadastro'
      object miPessoa: TMenuItem
        Caption = 'Pessoa'
        OnClick = miPessoaClick
      end
    end
  end
end
