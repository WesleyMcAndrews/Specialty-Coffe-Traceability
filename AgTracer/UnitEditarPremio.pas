unit UnitEditarPremio;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWHTMLControls, Data.DB, Data.Win.ADODB,
  IWCompButton, IWDBStdCtrls, IWCompListbox, IWCompEdit, IWCompJQueryWidget,
  IWCompExtCtrls, IWDBExtCtrls, System.Variants, IWCompLabel, IWCompCheckbox;

type
  TIWFormEditarPremio = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    VoltarLink: TIWLink;
    SalvarBtn: TIWButton;
    IWJQueryWidget1: TIWJQueryWidget;
    CancelarBtn: TIWButton;
    CadastradoPor: TIWDBLabel;
    EditadoPor: TIWDBLabel;
    Premios: TADODataSet;
    PremiosSrc: TDataSource;
    NomePropriedade: TIWLabel;
    PremiosIDPropriedade: TStringField;
    PremiosPremio: TStringField;
    PremiosSafra: TStringField;
    PremioCombo: TIWDBComboBox;
    Safra: TIWDBEdit;
    PremiosIDPremio: TAutoIncField;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    procedure VoltarLinkClick(Sender: TObject);
    procedure SalvarBtnClick(Sender: TObject);
    procedure UsuariosCalcFields(DataSet: TDataSet);
    procedure IWAppFormCreate(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
  public
   Editando:Boolean;
  end;

implementation

{$R *.dfm}

uses UserSessionUnit;


procedure TIWFormEditarPremio.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
end;

procedure TIWFormEditarPremio.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

procedure TIWFormEditarPremio.SalvarBtnClick(Sender: TObject);
begin
 //gravar
 try
  {if Editando then
  begin
   //AssociadosIDUsuarioEdicao.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
   //AssociadosDataEdicao.Value:=Now();
  end
  else
   //AssociadosIDUsuarioCadastro.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;}
  Premios.Post;
  Release;
  WebApplication.ShowMessage('Dados gravados com sucesso.');
 except
  on E : Exception do
  begin
   WebApplication.ShowMessage('Não foi possível gravar. Verifique os dados digitados. '+E.Message);
   Exit;
  end;
 end;
end;

procedure TIWFormEditarPremio.UsuariosCalcFields(DataSet: TDataSet);
begin
 //UsuariosCadastradoPor.AsString:='Cadastrado por '+UsuariosUsuarioCadastro.AsString+' em '+FormatDateTime('dd/mm/yyyy hh:nn',UsuariosDataCadastro.Value);
 //UsuariosEditadoPor.AsString:='Editado por '+UsuariosUsuarioEdicao.AsString+' em '+FormatDateTime('dd/mm/yyyy hh:nn',UsuariosDataEdicao.Value);
end;

procedure TIWFormEditarPremio.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;

end.
