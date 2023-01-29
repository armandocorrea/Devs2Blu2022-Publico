object dmPedidos: TdmPedidos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 267
  Width = 360
  object FDConexao: TFDConnection
    Params.Strings = (
      'Database=devs2blu'
      'User_Name=root'
      'Password=root'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 40
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\kikob\Desktop\Furb\Aulas\M'#243'dulo 05 - Delphi Avan'#231'ado\Ex' +
      'ercicios\Relat'#243'rios\PedidoCompra\libmysql.dll'
    Left = 56
    Top = 120
  end
end
