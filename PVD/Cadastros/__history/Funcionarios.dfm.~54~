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
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 35
    Width = 36
    Height = 13
    Caption = 'Buscar:'
  end
  object txt_busca_nome: TEdit
    Left = 228
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = txt_busca_nomeChange
  end
  object txt_busca_cpf: TMaskEdit
    Left = 228
    Top = 32
    Width = 120
    Height = 21
    EditMask = '000.000.000-00;1;_'
    MaxLength = 14
    TabOrder = 1
    Text = '   .   .   -  '
    Visible = False
    OnChange = txt_busca_cpfChange
  end
  object rb_nome: TRadioButton
    Left = 127
    Top = 34
    Width = 48
    Height = 17
    Caption = 'Nome'
    Checked = True
    TabOrder = 2
    TabStop = True
    OnClick = rb_nomeClick
  end
  object rb_cpf: TRadioButton
    Left = 181
    Top = 34
    Width = 41
    Height = 17
    Caption = 'CPF'
    TabOrder = 3
    OnClick = rb_cpfClick
  end
  object btn_novo: TButton
    Left = 64
    Top = 496
    Width = 105
    Height = 57
    Caption = 'Novo'
    TabOrder = 4
    OnClick = btn_novoClick
  end
  object DBGrid1: TDBGrid
    Left = 64
    Top = 113
    Width = 817
    Height = 377
    DataSource = dm.ds_funcionario
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cpf'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telefone'
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endereco'
        Width = 188
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cargo'
        Width = 150
        Visible = True
      end>
  end
end
