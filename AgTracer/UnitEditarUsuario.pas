unit UnitEditarUsuario;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWHTMLControls, Data.DB, Data.Win.ADODB,
  IWCompButton, IWDBStdCtrls, IWCompListbox, IWCompEdit, IWCompJQueryWidget,
  IWCompExtCtrls, IWDBExtCtrls, System.Variants, IWCompLabel, IWCompCheckbox,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, idMessage;

type
  TIWFormEditarUsuario = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    VoltarLink: TIWLink;
    SalvarBtn: TIWButton;
    CancelarBtn: TIWButton;
    CadastradoPor: TIWDBLabel;
    EditadoPor: TIWDBLabel;
    Users: TADODataSet;
    UsersSrc: TDataSource;
    Usuarios: TADOQuery;
    UsuariosSrc: TDataSource;
    UsuariosUsuarioCadastro: TStringField;
    UsuariosUsuarioEdicao: TStringField;
    UsersIDUsuario: TAutoIncField;
    UsersCPF: TStringField;
    UsersNomeUsuario: TStringField;
    UsersEmail: TStringField;
    UsersSenha: TStringField;
    UsersAdministrador: TBooleanField;
    UsersAdministrativo: TBooleanField;
    UsersAvaliador: TBooleanField;
    UsersComercial: TBooleanField;
    UsersAtivo: TBooleanField;
    UsersIDusuarioCadastro: TIntegerField;
    UsersDtCadastro: TDateTimeField;
    UsersIDUsuarioEdicao: TIntegerField;
    UsersDtEdicao: TDateTimeField;
    CPF: TIWDBEdit;
    NomeUsuario: TIWDBEdit;
    Email: TIWDBEdit;
    ChkAtivo: TIWDBEdit;
    ChkAdministrador: TIWDBEdit;
    ChkAdministrativo: TIWDBEdit;
    ChkComercial: TIWDBEdit;
    ChkAvaliador: TIWDBEdit;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    UsersIDCliente: TIntegerField;
    procedure VoltarLinkClick(Sender: TObject);
    procedure SalvarBtnClick(Sender: TObject);
    procedure EnviarEmail;
    procedure IWAppFormCreate(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
  public
   Editando:Boolean;
   NovaSenha:String;
  end;

implementation

{$R *.dfm}

uses UserSessionUnit;

Procedure TIWFormEditarUsuario.EnviarEmail;
var
   SMTP: TidSMTP;
   MailMessage: TidMessage;
begin
   SMTP := TidSMTP.Create(nil);
   try
     SMTP.Host := TIWUserSession(WebApplication.Data).SMTP_Host;
     SMTP.Port := TIWUserSession(WebApplication.Data).SMTP_Port;
     SMTP.Username := TIWUserSession(WebApplication.Data).SMTP_User;
     SMTP.Password := TIWUserSession(WebApplication.Data).SMTP_Pass;

     MailMessage := TidMessage.Create;
     try
       // setup message
       MailMessage.From.Address := TIWUserSession(WebApplication.Data).SMTP_User;
       MailMessage.Recipients.EMailAddresses :=UsersEmail.AsString;
       MailMessage.Subject := 'Sistema AMSC';
       MailMessage.Body.Add('Alerta de cadastro no sistema AMSC.');
       MailMessage.Body.Add('Seu login é: '+UsersEmail.Text);
       MailMessage.Body.Add('Sua senha é: '+NovaSenha);
       MailMessage.Body.Add(' ');
       MailMessage.Body.Add('Altere sua senha logo no primeiro acesso.');

       //TIdAttachmentFile.Create(MailMessage.MessageParts,'c:\tmp\whatever.pdf');
       try
         SMTP.Connect;
         SMTP.Send(MailMessage)
       finally
         if SMTP.Connected then SMTP.Disconnect
       end
     finally
       MailMessage.Free;
     end
   finally
     SMTP.Free
   end;
end;

procedure TIWFormEditarUsuario.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
end;

procedure TIWFormEditarUsuario.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

procedure TIWFormEditarUsuario.SalvarBtnClick(Sender: TObject);
begin
 //gravar
 try
  if Editando then
  begin
   UsersIDUsuarioEdicao.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
   UsersDtEdicao.Value:=Now();
  end
  else
   UsersIDusuarioCadastro.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
  Users.Post;
  try
   EnviarEmail;
  Except
  end;
  Release;
  WebApplication.ShowMessage('Dados gravados com sucesso. O usuário receberá um e-mail com a senha.');
 except
  on E : Exception do
  begin
   WebApplication.ShowMessage('Não foi possível gravar. Verifique os dados digitados. '+E.Message);
   Exit;
  end;
 end;
end;

procedure TIWFormEditarUsuario.VoltarLinkClick(Sender: TObject);
begin
 Users.Close;
 Release;
end;

end.
