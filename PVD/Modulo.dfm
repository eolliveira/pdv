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
    Left = 336
    Top = 112
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\lib\libmySQL.dll'
    Left = 752
    Top = 48
  end
  object query_cargos: TFDQuery
    Active = True
    Connection = fd_cenecction
    SQL.Strings = (
      'SELECT * FROM cargos')
    Left = 264
    Top = 296
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
  object tb_cargos: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = fd_cenecction
    TableName = 'pvd.cargos'
    Left = 264
    Top = 208
    object tb_cargosid: TFDAutoIncField
      DisplayWidth = 3
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tb_cargoscargo: TStringField
      DisplayWidth = 36
      FieldName = 'cargo'
      Origin = 'cargo'
      Required = True
      Size = 25
    end
  end
  object ds_cargos: TDataSource
    DataSet = query_cargos
    Left = 264
    Top = 376
  end
end
