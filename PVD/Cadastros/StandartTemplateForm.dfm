object FStandartTemplateForm: TFStandartTemplateForm
  Left = 0
  Top = 0
  Caption = 'FStandartTemplateForm'
  ClientHeight = 544
  ClientWidth = 1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 65
    Width = 1088
    Height = 479
    ActivePage = tabSearch
    Align = alClient
    TabOrder = 0
    object tabSearch: TTabSheet
      Caption = 'Consulta'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 104
        Width = 1080
        Height = 347
        Align = alBottom
        DataSource = dsGeral
        Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
      end
      object pnlConsulta: TPanel
        Left = 0
        Top = 0
        Width = 1080
        Height = 104
        Align = alClient
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        object lb_filtra: TLabel
          Left = 16
          Top = 37
          Width = 51
          Height = 13
          Caption = 'Filtrar por:'
        end
        object cbbColunas: TComboBox
          Left = 16
          Top = 56
          Width = 145
          Height = 21
          TabOrder = 0
          Items.Strings = (
            'Preenchido')
        end
        object edtConsulta: TEdit
          Left = 167
          Top = 56
          Width = 266
          Height = 21
          TabOrder = 1
        end
        object btnConsultar: TButton
          Left = 464
          Top = 45
          Width = 81
          Height = 44
          Caption = 'btnConsultar'
          TabOrder = 2
          OnClick = btnConsultarClick
        end
      end
    end
    object tabForm: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 1
      object pnlDados: TPanel
        Left = 0
        Top = 0
        Width = 1080
        Height = 451
        Align = alClient
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
      end
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 1088
    Height = 65
    Cursor = crSQLWait
    DataSource = dsGeral
    VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
    Align = alTop
    Ctl3D = True
    ParentCtl3D = False
    ConfirmDelete = False
    TabOrder = 1
  end
  object qryGeral: TFDQuery
    BeforeDelete = qryGeralBeforeDelete
    Connection = dm.fd_cenecction
    Left = 800
    Top = 96
    object qryGeralid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryGeralcargo: TStringField
      FieldName = 'cargo'
      Origin = 'cargo'
      Required = True
      Size = 50
    end
  end
  object dsGeral: TDataSource
    DataSet = qryGeral
    OnStateChange = dsGeralStateChange
    Left = 752
    Top = 96
  end
end
