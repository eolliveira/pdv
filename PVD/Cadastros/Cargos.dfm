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
    OnDblClick = gd_cargosDblClick
    Columns = <
      item
        DropDownRows = 2
        Expanded = False
        FieldName = 'id'
        Width = 35
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cargo'
        Width = 232
        Visible = True
      end>
  end
  object btn_novo: TButton
    Left = 317
    Top = 99
    Width = 91
    Height = 57
    Caption = 'Novo'
    TabOrder = 1
    OnClick = btn_novoClick
  end
end
