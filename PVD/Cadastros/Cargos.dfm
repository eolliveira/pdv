object frm_cargos: Tfrm_cargos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cargos'
  ClientHeight = 477
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lb_nome: TLabel
    Left = 8
    Top = 8
    Width = 29
    Height = 13
    Caption = 'Cargo'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 99
    Width = 289
    Height = 337
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btn_salvar: TButton
    Left = 317
    Top = 196
    Width = 91
    Height = 57
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 1
    OnClick = btn_salvarClick
  end
  object btn_editar: TButton
    Left = 317
    Top = 292
    Width = 91
    Height = 57
    Caption = 'Editar'
    Enabled = False
    TabOrder = 2
  end
  object btn_remover: TButton
    Left = 317
    Top = 379
    Width = 91
    Height = 57
    Caption = 'Remover'
    Enabled = False
    TabOrder = 3
  end
  object btn_novo: TButton
    Left = 317
    Top = 99
    Width = 91
    Height = 57
    Caption = 'Novo'
    TabOrder = 4
    OnClick = btn_novoClick
  end
  object txt_nome: TEdit
    Left = 8
    Top = 27
    Width = 249
    Height = 21
    Enabled = False
    TabOrder = 5
  end
end
