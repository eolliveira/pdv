inherited FTeste: TFTeste
  Caption = 'FTeste'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Top = 65
    Height = 479
    inherited tabSearch: TTabSheet
      ExplicitHeight = 451
      inherited DBGrid1: TDBGrid
        Top = 130
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      end
    end
    inherited tabForm: TTabSheet
      ExplicitHeight = 451
      inherited pnlDados: TPanel
        Height = 451
        ExplicitLeft = 0
        ExplicitTop = 25
        ExplicitWidth = 1003
        ExplicitHeight = 422
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
        object DBEdit1: TDBEdit
          Left = 69
          Top = 25
          Width = 233
          Height = 27
          DataField = 'cargo'
          DataSource = dsGeral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
  end
  inherited DBNavigator1: TDBNavigator
    Height = 65
    Anchors = [akLeft, akRight]
    Hints.Strings = ()
    ExplicitHeight = 65
  end
  inherited qryGeral: TFDQuery
    Active = True
    SQL.Strings = (
      'SELECT * FROM tb_cargo')
    Left = 784
    inherited qryGeralid: TFDAutoIncField
      Tag = 1
      DisplayLabel = 'C'#243'digo'
      ReadOnly = True
    end
    inherited qryGeralcargo: TStringField
      Tag = 1
      DisplayLabel = 'Descri'#231#227'o'
    end
  end
end
