unit UnitRastreamento;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompLabel,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWHTMLControls, IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML;

type
  TIWFormRastreamento = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    VoltarLink: TIWLink;
    procedure IWAppFormCreate(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}

uses UserSessionUnit;


procedure TIWFormRastreamento.IWAppFormCreate(Sender: TObject);
begin
 if TIWUserSession(WebApplication.Data).NomeUsuario <> '' then
  UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario
 else
  UserName.Caption:='Visitante';
end;

procedure TIWFormRastreamento.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

end.
