object IWUserSession: TIWUserSession
  OldCreateOrder = False
  OnCreate = IWUserSessionBaseCreate
  Height = 405
  Width = 873
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=agtraceruser;Persist Security Info=' +
      'True;User ID=AgTracerUser;Initial Catalog=AMSC;Data Source=lab-d' +
      'b'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 32
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 168
    Top = 24
  end
end
