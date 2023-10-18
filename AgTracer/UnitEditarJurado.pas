unit UnitEditarJurado;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWHTMLControls, Data.DB, Data.Win.ADODB,
  IWCompButton, IWDBStdCtrls, IWCompListbox, IWCompEdit, IWCompJQueryWidget,
  IWCompExtCtrls, IWDBExtCtrls, System.Variants, IWCompLabel,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, idMessage,
  IWCompMemo;

type
  TIWFormEditarJurado = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    VoltarLink: TIWLink;
    Jurados: TADODataSet;
    NomeJurado: TIWDBEdit;
    Instituicao: TIWDBEdit;
    Nacionalidade: TIWDBEdit;
    JuradosSrc: TDataSource;
    Usuarios: TADOQuery;
    SalvarBtn: TIWButton;
    Identidade: TIWDBEdit;
    CancelarBtn: TIWButton;
    CadastradoPor: TIWDBLabel;
    EditadoPor: TIWDBLabel;
    UsuariosSrc: TDataSource;
    UsuariosUsuarioCadastro: TStringField;
    UsuariosUsuarioEdicao: TStringField;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    Email: TIWDBEdit;
    Endereco: TIWDBEdit;
    Fone: TIWDBEdit;
    JuradosIDCliente: TIntegerField;
    JuradosIDJurado: TAutoIncField;
    JuradosIdentidade: TStringField;
    JuradosNomeJurado: TStringField;
    JuradosNacionalidade: TStringField;
    JuradosInstituicao: TStringField;
    JuradosFone: TStringField;
    JuradosEndereco: TStringField;
    JuradosEmail: TStringField;
    JuradosCurriculo: TMemoField;
    JuradosIDUsuarioCadastro: TIntegerField;
    JuradosDataCadastro: TDateTimeField;
    JuradosIDUsuarioEdicao: TIntegerField;
    JuradosDataEdicao: TDateTimeField;
    Curriculo: TIWDBMemo;
    SalvarENovoBtn: TIWButton;
    procedure VoltarLinkClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure SalvarBtnClick(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
  public
   Editando:Boolean;
  end;

implementation

{$R *.dfm}

uses UserSessionUnit;


procedure TIWFormEditarJurado.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
end;

procedure TIWFormEditarJurado.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

procedure TIWFormEditarJurado.SalvarBtnClick(Sender: TObject);
begin
 //gravar
 try
  if Editando then
  begin
   JuradosIDUsuarioEdicao.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
   JuradosDataEdicao.Value:=Now();
  end
  else
   JuradosIDUsuarioCadastro.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
  Jurados.Post;
  if not Editando then
  try
   //EnviarEmail;
  Except
  end;
  WebApplication.ShowMessage('Dados gravados com sucesso.');
  Release;
 except
  on E : Exception do
  begin
   WebApplication.ShowMessage('Não foi possível gravar. Verifique os valores digitados. '+E.Message);
   Exit;
  end;
 end;
end;

procedure TIWFormEditarJurado.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;

end.
