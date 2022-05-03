object frm_menu: Tfrm_menu
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Menu'
  ClientHeight = 540
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 200
    Top = 32
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object PRODUTOS1: TMenuItem
        Caption = 'Produtos'
      end
      object Fornecedores1: TMenuItem
        Caption = 'Fornecedores'
      end
      object Fornecedores2: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = Fornecedores2Click
      end
      object Cargos1: TMenuItem
        Caption = 'Cargos'
      end
      object Funcionarios1: TMenuItem
        Caption = 'Funcionarios'
        OnClick = Funcionarios1Click
      end
    end
    object Estoque1: TMenuItem
      Caption = 'Estoque'
    end
    object Cadastro2: TMenuItem
      Caption = 'Movimenta'#231#245'es'
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
    end
  end
end
