unit UnitEditarSenha;

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
  TIWFormEditarSenha = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    VoltarLink: TIWLink;
    SalvarBtn: TIWButton;
    CancelarBtn: TIWButton;
    SenhaAtual: TIWEdit;
    Senha: TIWEdit;
    ConfirmaSenha: TIWEdit;
    Usuarios: TADODataSet;
    UsuariosIDUsuario: TAutoIncField;
    UsuariosCPF: TStringField;
    UsuariosNomeUsuario: TStringField;
    UsuariosEmail: TStringField;
    UsuariosSenha: TStringField;
    UsuariosAtivo: TBooleanField;
    UsuariosAdministrador: TBooleanField;
    UsuariosAdministrativo: TBooleanField;
    UsuariosAvaliador: TBooleanField;
    UsuariosComercial: TBooleanField;
    UsuariosIDusuarioCadastro: TIntegerField;
    UsuariosDtCadastro: TDateTimeField;
    UsuariosIDUsuarioEdicao: TIntegerField;
    UsuariosDtEdicao: TDateTimeField;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    procedure VoltarLinkClick(Sender: TObject);
    procedure SalvarBtnClick(Sender: TObject);
    function RandomPassword(PLen: Integer): string;
    procedure IWAppFormCreate(Sender: TObject);
    procedure UsuariosAfterPost(DataSet: TDataSet);
    procedure IWAppFormDestroy(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
  public
   Editando:Boolean;
  end;

implementation

{$R *.dfm}

uses UserSessionUnit, MD5;


procedure TIWFormEditarSenha.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
 Usuarios.Open;
 If not Usuarios.Locate('IDUsuario',TIWUserSession(WebApplication.Data).UsuarioAtivo,[]) then
 begin
  Release;
  WebApplication.ShowMessage('Não foi possível alterar a senha deste usuário.');
 end
 else
 Usuarios.Edit;
end;

procedure TIWFormEditarSenha.IWAppFormDestroy(Sender: TObject);
begin
 if Usuarios.State<>dsbrowse then
  Usuarios.Cancel;
 Usuarios.Close;
end;

procedure TIWFormEditarSenha.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

function TIWFormEditarSenha.RandomPassword(PLen: Integer): string;
var
  str: string;
begin
  Randomize;
  str    := '1234567890abcdefghijklmnopqrstuvwxyzçABCDEFGHIJKLMNOPQRSTUVWXYZÇ!@#$%&*+=?';
  Result := '';
  repeat
    Result := Result + str[Random(Length(str)-1)];
  until (Length(Result) = PLen)
end;

procedure TIWFormEditarSenha.SalvarBtnClick(Sender: TObject);
begin
 //gravar
 try
  //Verificar Confirmação
  If (ConfirmaSenha.Enabled)and(ConfirmaSenha.Text<>Senha.Text) then
  begin
   WebApplication.ShowMessage('A Senha não confere com a Confirmação da Senha. Verifique.');
   Exit;
  end;
  //Verificar se senha atual coincide
  if MD5DigestToStr(MD5String(SenhaAtual.Text))<>UsuariosSenha.AsString then
  begin
   WebApplication.ShowMessage('A Senha atual não confere.');
   Exit;
  end;
  UsuariosSenha.AsString:=MD5DigestToStr(MD5String(Senha.Text));
  Usuarios.Post;
  Release;
  WebApplication.ShowMessage('Senha alterada com sucesso. Você receberá um e-mail com a sua nova senha.');
 except
  on E : Exception do
  begin
   WebApplication.ShowMessage('Não foi possível gravar. Verifique os dados digitados. '+E.Message);
   Exit;
  end;
 end;
end;


procedure TIWFormEditarSenha.UsuariosAfterPost(DataSet: TDataSet);
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
       MailMessage.Recipients.EMailAddresses :=UsuariosEmail.AsString;
       MailMessage.Subject := 'Sistema AMSC';
       MailMessage.Body.Add('Sua senha foi alterada com sucesso.');
       MailMessage.Body.Add('Sua nova senha é: '+Senha.Text);


       //TIdAttachmentFile.Create(MailMessage.MessageParts,'c:\tmp\whatever.pdf');
       try
         SMTP.Connect;
         SMTP.Authenticate;
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

procedure TIWFormEditarSenha.VoltarLinkClick(Sender: TObject);
begin
 if Usuarios.State<>dsbrowse then
  Usuarios.Cancel;
 Release;
end;

end.
