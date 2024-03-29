object frm_cargos: Tfrm_cargos
  Left = 0
  Top = 0
  BiDiMode = bdRightToLeftNoAlign
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cargos'
  ClientHeight = 498
  ClientWidth = 639
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tabContatos: TPageControl
    Left = 0
    Top = 0
    Width = 639
    Height = 498
    ActivePage = tabForm
    Align = alClient
    TabOrder = 0
    OnChange = tabContatosChange
    object tabSearch: TTabSheet
      Caption = 'tabSearch'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 631
        Height = 470
        Align = alClient
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object btn_novo: TButton
          Left = 438
          Top = 32
          Width = 91
          Height = 57
          Caption = 'Novo'
          TabOrder = 0
          OnClick = btn_novoClick
        end
        object gd_cargos: TDBGrid
          Left = 16
          Top = 112
          Width = 513
          Height = 337
          DataSource = ds_cargos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 1
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
        object Panel3: TPanel
          Left = 16
          Top = 24
          Width = 393
          Height = 65
          Caption = 'Panel3'
          Color = clHighlight
          ParentBackground = False
          TabOrder = 2
          object ComboBox1: TComboBox
            Left = 8
            Top = 24
            Width = 73
            Height = 21
            TabOrder = 0
            Text = 'ComboBox1'
          end
          object Edit1: TEdit
            Left = 87
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 1
            Text = 'Edit1'
          end
          object Button1: TButton
            Left = 232
            Top = 24
            Width = 75
            Height = 25
            Caption = 'Button1'
            TabOrder = 2
          end
        end
      end
    end
    object tabForm: TTabSheet
      Caption = 'TabForm'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 631
        Height = 470
        Cursor = crIBeam
        Align = alClient
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object lb_cargo: TLabel
          Left = 21
          Top = 28
          Width = 42
          Height = 19
          Caption = 'Cargo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object btn_editar: TButton
          Left = 21
          Top = 82
          Width = 91
          Height = 57
          Caption = 'Editar'
          TabOrder = 0
        end
        object btn_cancelar: TButton
          Left = 334
          Top = 82
          Width = 91
          Height = 57
          Caption = 'Cancelar'
          TabOrder = 1
        end
        object btn_remover: TButton
          Left = 229
          Top = 82
          Width = 91
          Height = 57
          Caption = 'Remover'
          TabOrder = 2
        end
        object btn_salvar: TButton
          Left = 132
          Top = 82
          Width = 91
          Height = 57
          Caption = 'Salvar'
          TabOrder = 3
        end
        object DBEdit1: TDBEdit
          Left = 69
          Top = 30
          Width = 228
          Height = 21
          Cursor = crArrow
          DataField = 'cargo'
          DataSource = ds_cargos
          TabOrder = 4
        end
        object DBNavigator1: TDBNavigator
          Left = 229
          Top = 222
          Width = 240
          Height = 25
          DataSource = ds_cargos
          TabOrder = 5
        end
      end
    end
  end
  object tb_cargo: TFDTable
    IndexFieldNames = 'id'
    Connection = dm.fd_cenecction
    TableName = 'pvd.tb_cargo'
    Left = 576
    Top = 120
    object tb_cargoid: TFDAutoIncField
      DisplayWidth = 3
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tb_cargocargo: TStringField
      DisplayWidth = 36
      FieldName = 'cargo'
      Origin = 'cargo'
      Required = True
      Size = 25
    end
  end
  object ds_cargos: TDataSource
    DataSet = query_cargos
    Left = 576
    Top = 184
  end
  object query_cargos: TFDQuery
    Connection = dm.fd_cenecction
    SQL.Strings = (
      'SELECT * FROM tb_cargo Order by cargo')
    Left = 584
    Top = 248
    object query_cargosid: TFDAutoIncField
      DisplayLabel = 'ID'
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_cargoscargo: TStringField
      DisplayLabel = 'CARGO'
      FieldName = 'cargo'
      Origin = 'cargo'
      Required = True
      Size = 25
    end
  end
  object ActionList1: TActionList
    Left = 576
    Top = 48
    object Action1: TAction
      Caption = 'Action1'
    end
  end
end
