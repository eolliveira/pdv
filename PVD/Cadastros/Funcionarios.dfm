object frm_funcionarios: Tfrm_funcionarios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Funcionarios'
  ClientHeight = 621
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 632
    Top = 27
    Width = 32
    Height = 13
    Caption = 'Buscar'
  end
  object lb_nome: TLabel
    Left = 184
    Top = 269
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object lb_cpf: TLabel
    Left = 456
    Top = 269
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object lb_telefone: TLabel
    Left = 633
    Top = 269
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object lb_endereco: TLabel
    Left = 184
    Top = 325
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label2: TLabel
    Left = 608
    Top = 325
    Width = 29
    Height = 13
    Caption = 'Cargo'
  end
  object txt_busca_nome: TEdit
    Left = 799
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object txt_busca_cpf: TMaskEdit
    Left = 799
    Top = 51
    Width = 120
    Height = 21
    EditMask = '000.000.000-00;1;_'
    MaxLength = 14
    TabOrder = 1
    Text = '   .   .   -  '
  end
  object RadioButton1: TRadioButton
    Left = 689
    Top = 26
    Width = 48
    Height = 17
    Caption = 'Nome'
    TabOrder = 2
  end
  object RadioButton2: TRadioButton
    Left = 752
    Top = 26
    Width = 41
    Height = 17
    Caption = 'CPF'
    TabOrder = 3
  end
  object txt_nome: TEdit
    Left = 184
    Top = 288
    Width = 249
    Height = 21
    TabOrder = 4
  end
  object txt_telefone: TEdit
    Left = 632
    Top = 288
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object Edit4: TEdit
    Left = 184
    Top = 344
    Width = 305
    Height = 21
    TabOrder = 6
  end
  object ComboBox1: TComboBox
    Left = 608
    Top = 344
    Width = 145
    Height = 21
    TabOrder = 7
  end
  object txt_cpf: TMaskEdit
    Left = 456
    Top = 288
    Width = 145
    Height = 21
    TabOrder = 8
    Text = ''
  end
  object btn_salvar: TButton
    Left = 184
    Top = 392
    Width = 75
    Height = 25
    Caption = 'btn_salvar'
    TabOrder = 9
  end
  object btn_editar: TButton
    Left = 320
    Top = 392
    Width = 75
    Height = 25
    Caption = 'btn_editar'
    TabOrder = 10
  end
  object btn_remover: TButton
    Left = 480
    Top = 392
    Width = 75
    Height = 25
    Caption = 'btn_remover'
    TabOrder = 11
  end
  object Button4: TButton
    Left = 616
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Button4'
    TabOrder = 12
  end
end
