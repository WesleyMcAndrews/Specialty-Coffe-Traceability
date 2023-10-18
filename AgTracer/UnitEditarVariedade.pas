unit UnitEditarVariedade;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWHTMLControls, Data.DB, Data.Win.ADODB,
  IWCompButton, IWDBStdCtrls, IWCompListbox, IWCompEdit, IWCompJQueryWidget,
  IWCompExtCtrls, IWDBExtCtrls, System.Variants, IWCompLabel, IWCompCheckbox;

type
  TIWFormEditarVariedade = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    VoltarLink: TIWLink;
    SalvarBtn: TIWButton;
    CancelarBtn: TIWButton;
    CadastradoPor: TIWDBLabel;
    EditadoPor: TIWDBLabel;
    Variedades: TADODataSet;
    VariedadesSrc: TDataSource;
    NomeVariedade: TIWDBEdit;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    VariedadesIDVariedade: TAutoIncField;
    VariedadesIDCultura: TIntegerField;
    VariedadesNomeVariedade: TStringField;
    VariedadesIDUsuarioCadastro: TIntegerField;
    VariedadesDataCadastro: TDateTimeField;
    VariedadesIDUsuarioEdicao: TIntegerField;
    VariedadesDataEdicao: TDateTimeField;
    UsuariosSrc: TDataSource;
    Usuarios: TADOQuery;
    UsuariosUsuarioCadastro: TStringField;
    UsuariosUsuarioEdicao: TStringField;
    NomeCulturaCliente: TIWLabel;
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


procedure TIWFormEditarVariedade.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
end;

procedure TIWFormEditarVariedade.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

procedure TIWFormEditarVariedade.SalvarBtnClick(Sender: TObject);
begin
 //gravar
 try
  if Editando then
  begin
   VariedadesIDUsuarioEdicao.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
   VariedadesDataEdicao.Value:=Now();
  end
  else
   VariedadesIDUsuarioCadastro.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
  Variedades.Post;
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

procedure TIWFormEditarVariedade.UsuariosCalcFields(DataSet: TDataSet);
begin
 //UsuariosCadastradoPor.AsString:='Cadastrado por '+UsuariosUsuarioCadastro.AsString+' em '+FormatDateTime('dd/mm/yyyy hh:nn',UsuariosDataCadastro.Value);
 //UsuariosEditadoPor.AsString:='Editado por '+UsuariosUsuarioEdicao.AsString+' em '+FormatDateTime('dd/mm/yyyy hh:nn',UsuariosDataEdicao.Value);
end;

procedure TIWFormEditarVariedade.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;

end.
