object frm_cargos: Tfrm_cargos
  Left = 0
  Top = 0
  BiDiMode = bdRightToLeftNoAlign
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
  ParentBiDiMode = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lb_nome: TLabel
    Left = 8
    Top = 8
    Width = 29
    Height = 13
    Caption = 'Cargo'
  end
  object gd_cargos: TDBGrid
    Left = 8
    Top = 99
    Width = 289
    Height = 337
    DataSource = dm.ds_cargos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnCellClick = gd_cargosCellClick
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
    OnClick = btn_editarClick
  end
  object btn_remover: TButton
    Left = 317
    Top = 379
    Width = 91
    Height = 57
    Caption = 'Remover'
    Enabled = False
    TabOrder = 3
    OnClick = btn_removerClick
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
    Width = 289
    Height = 21
    TabOrder = 5
    OnChange = txt_nomeChange
  end
end
