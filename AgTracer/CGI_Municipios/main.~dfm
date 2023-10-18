object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'consultar'
      PathInfo = '/consultar'
      OnAction = WebModule1consultarAction
    end>
  Left = 499
  Top = 277
  Height = 266
  Width = 387
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=termopilas;Persist Security Info=Tr' +
      'ue;User ID=sa;Initial Catalog=AMSC;Data Source=My-PC;Use Procedu' +
      're for Prepare=1;Auto Translate=True;Packet Size=4096;Workstatio' +
      'n ID=TOTVSTVVS;Use Encryption for Data=False;Tag with column col' +
      'lation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 8
  end
  object Municipios: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'Select CodigoMunicipio, NomeMunicipio'
      'from MunicipiosIBGE'
      'where UF='#39'GO'#39
      'order by NomeMunicipio')
    Left = 48
    Top = 64
    object MunicipiosCodigoMunicipio: TStringField
      FieldName = 'CodigoMunicipio'
      Size = 7
    end
    object MunicipiosNomeMunicipio: TStringField
      FieldName = 'NomeMunicipio'
      Size = 100
    end
  end
end
