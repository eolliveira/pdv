object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 661
  Width = 886
  object fd_cenecction: TFDConnection
    Params.Strings = (
      'Database=pvd'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 152
    Top = 112
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\lib\libmysql.dll'
    Left = 752
    Top = 48
  end
  object query_cargos: TFDQuery
    Connection = fd_cenecction
    SQL.Strings = (
      'SELECT * FROM tb_cargo')
    Left = 72
    Top = 368
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
  object tb_cargo: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = fd_cenecction
    TableName = 'pvd.tb_cargo'
    Left = 80
    Top = 208
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
    Left = 72
    Top = 288
  end
  object tb_funcionario: TFDTable
    IndexFieldNames = 'id'
    Connection = fd_cenecction
    TableName = 'pvd.tb_funcionario'
    Left = 216
    Top = 208
    object tb_funcionarioid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tb_funcionarionome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object tb_funcionariocpf: TStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      Required = True
      Size = 30
    end
    object tb_funcionariotelefone: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 30
    end
    object tb_funcionarioendereco: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'endereco'
      Origin = 'endereco'
      Size = 100
    end
    object tb_funcionariocargo_id: TIntegerField
      FieldName = 'cargo_id'
      Origin = 'cargo_id'
      Required = True
    end
  end
  object query_funcionario: TFDQuery
    Connection = fd_cenecction
    SQL.Strings = (
      'SELECT * FROM tb_funcionario')
    Left = 224
    Top = 368
  end
  object ds_funcionario: TDataSource
    DataSet = query_funcionario
    Left = 216
    Top = 288
  end
  object query_funcionario_cargo: TFDQuery
    Connection = fd_cenecction
    SQL.Strings = (
      'SELECT'
      ' f.id,'
      ' f.nome,'
      ' f.cpf,'
      ' f.telefone,'
      ' f.endereco,'
      ' c.cargo'
      'FROM '
      ' tb_funcionario f'
      'JOIN tb_cargo c ON c.id = f.cargo_id'
      'WHERE f.id = 4 ')
    Left = 392
    Top = 368
  end
end
