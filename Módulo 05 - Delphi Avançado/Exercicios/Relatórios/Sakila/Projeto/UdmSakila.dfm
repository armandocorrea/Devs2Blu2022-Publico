object dmSakila: TdmSakila
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 228
  Width = 309
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=sakila'
      'User_Name=root'
      'Password=root'
      'Server=localhost'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 56
    Top = 32
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'D:\FURB\Aulas\M'#243'dulo 05 - Delphi Avan'#231'ado\Exercicios\Relat'#243'rios\' +
      'Sakila\Projeto\libmysql.dll'
    Left = 136
    Top = 96
  end
end
