unit ServerController;

interface

uses
  SysUtils, Classes, IWServerControllerBase, IWBaseForm, HTTPApp,
  // For OnNewSession Event
  UserSessionUnit, IWApplication, IWAppForm, IW.Browser.Browser, IWAutherBase,
  IWAutherEvent;

type
  TIWServerController = class(TIWServerControllerBase)
    IWAutherEvent1: TIWAutherEvent;
    procedure IWServerControllerBaseNewSession(ASession: TIWApplication);
    function IWAutherEvent1Check(const aUser, aPass: string): Boolean;
  private
    
  public
  end;


  function UserSession: TIWUserSession;
  function IWServerController: TIWServerController;

implementation

{$R *.dfm}

uses
  IWInit, IWGlobal;

function IWServerController: TIWServerController;
begin
  Result := TIWServerController(GServerController);
end;



function UserSession: TIWUserSession;
begin
  Result := TIWUserSession(WebApplication.Data);
end;

function TIWServerController.IWAutherEvent1Check(const aUser,
  aPass: string): Boolean;
begin
  Result := TIWUserSession(WebApplication.Data).CheckUser(aUser, aPass);
end;

procedure TIWServerController.IWServerControllerBaseNewSession(
  ASession: TIWApplication);
begin
  ASession.Data := TIWUserSession.Create(nil, ASession);
end;


initialization
  TIWServerController.SetServerControllerClass;

end.

