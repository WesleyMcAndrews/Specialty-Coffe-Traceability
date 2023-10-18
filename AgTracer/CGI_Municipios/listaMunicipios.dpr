program listaMunicipios;

{$APPTYPE CONSOLE}

uses
  WebBroker,
  CGIApp,
  main in 'main.pas' {WebModule1: TWebModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TWebModule1, WebModule1);
  Application.Run;
end.
