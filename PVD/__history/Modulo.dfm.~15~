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
    LoginPrompt = False
    Left = 416
    Top = 56
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\lib\libmySQL.dll'
    Left = 680
    Top = 64
  end
  object query_cargos: TFDQuery
    Connection = fd_cenecction
    SQL.Strings = (
      'SELECT * FROM cargos')
    Left = 416
    Top = 240
    object query_cargosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_cargoscargo: TStringField
      FieldName = 'cargo'
      Origin = 'cargo'
      Required = True
      Size = 200
    end
  end
  object tb_cargos: TFDTable
    IndexFieldNames = 'id'
    Connection = fd_cenecction
    TableName = 'pvd.cargos'
    Left = 416
    Top = 152
    object tb_cargosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object tb_cargoscargo: TStringField
      FieldName = 'cargo'
      Origin = 'cargo'
      Required = True
      Size = 25
    end
  end
end
