unit UnitLogin;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompEdit, IWCompCheckbox, IWCompButton,
  ServerController, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, idMessage,
  Data.DB, Data.Win.ADODB, Vcl.Forms, IWVCLBaseContainer, IWContainer,
  IWHTMLContainer, IWHTML40Container, IWRegion, IWHTMLControls;

type
  TIWFormLogin = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    Login: TIWEdit;
    Password: TIWEdit;
    EntrarBtn: TIWButton;
    ADOQuery1: TADOQuery;
    Email: TIWEdit;
    Reset: TIWButton;
    procedure EntrarBtnClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure ResetClick(Sender: TObject);
    function RandomPassword(PLen: Integer): string;
    procedure EnviarEmail;
    procedure PasswordAsyncKeyPress(Sender: TObject; EventParams: TStringList);
  public
   NovaSenha:String;
  end;

implementation

{$R *.dfm}

Uses UserSessionUnit, UnitDashboard, MD5, UnitListarAvaliacoesConcurso;


Procedure TIWFormLogin.EnviarEmail;
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
       MailMessage.Recipients.EMailAddresses :=Email.Text;
       MailMessage.Subject := 'Sistema AMSC';
       MailMessage.Body.Add('Você solicitou a recuperação da sua senha.');
       MailMessage.Body.Add('Sua nova senha é: '+NovaSenha);
       MailMessage.Body.Add(' ');
       MailMessage.Body.Add('Troque sua senha no próximo acesso ao sistema.');

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

function TIWFormLogin.RandomPassword(PLen: Integer): string;
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


procedure TIWFormLogin.IWAppFormRender(Sender: TObject);
 {Alterando a tag Body}
begin
  inherited;
  pagecontext.BodyTag.AddClassParam('loginPage');
end;

procedure TIWFormLogin.PasswordAsyncKeyPress(Sender: TObject;
  EventParams: TStringList);
begin
  if EventParams.Values['Which'] = '13' then
  begin
  //WebApplication.ShowMessage(EventParams.Text);
    EntrarBtnClick(Sender);  //change this to the procedure you wish to call
  end;
end;

procedure TIWFormLogin.ResetClick(Sender: TObject);
begin
 if Email.Text='' then
 begin
  WebApplication.ShowMessage('Digite um e-mail válido.');
  Exit;
 end;
 //Verificar se usuário existe, Criar nova senha, alterar cadastro e enviar e-mail
 With ADOQuery1 do
 begin
  SQl.Clear;
  //Using sp_executesql to avoid sql injection exploit
  SQl.Add('EXECUTE sp_executesql');
  SQl.Add('N''Select Top 1 IDCliente, IDUsuario, NomeUsuario, Administrador,');
  SQl.Add('Administrativo, Avaliador, Comercial, Jurado');
  SQl.Add('from UsuariosPossiveis');
  SQl.Add('WHERE (Email = @Email)'',');
  SQl.Add('N''@Email varchar(100)'',');
  SQl.Add('@Email='+QuotedStr(Email.Text)+',');
  Open;
  if RecordCount>0 then //Criar nova Senha
  begin
   if FieldByName('Jurado').AsBoolean then //Se for jurado
   begin
    WebApplication.ShowMessage('Solicite nova senha à organização do concurso.');
    Close;
    Exit;
   end;
   NovaSenha:=RandomPassword(7);
   //Atualizar cadastro
   Close;
   Sql.Clear;
   Sql.Add('Update Usuarios');
   Sql.Add('Set Senha='+QuotedStr(MD5DigestToStr(MD5String(NovaSenha))));
   SQl.Add('where Email='+QuotedStr(Email.Text));
   try
    ExecSQL;
   except
    WebApplication.ShowMessage('Não foi possível alterar sua senha.');
    Exit;
   end;
   //Enviar Email
   try
    EnviarEmail;
   except
    WebApplication.ShowMessage('A senha foi alterada. Não foi possível enviar e-mail com sua nova senha.'+NovaSenha);
    Exit;
   end;
  end
  else
   WebApplication.ShowMessage('Usuário não encontrado.');//end RecordCount
 end;
 Email.Text:='';
 WebApplication.ShowMessage('Você receberá um e-mail com sua nova senha em instantes.');
end;

procedure TIWFormLogin.EntrarBtnClick(Sender: TObject);
begin
 if (Login.Text='')or(Password.Text='') then
 begin
  WebApplication.ShowMessage('Digite um Login e uma Senha válidos.');
  Exit;
 end;
 If IWServerController.IWAutherEvent1Check(Login.Text,Password.Text) then
 begin
  if TIWUserSession(WebApplication.Data).isJurado then
   //Mostar form da Avaliacao do concurso
   TIWFormListarAvaliacoesConcurso.Create(WebApplication).Show
  else
   //mostrar Dashboard
   TIWFormDashboard.Create(WebApplication).Show
 end
 else
  WebApplication.ShowMessage('Você não é um usuário deste sistema.');
end;

initialization
 TIWFormLogin.SetAsMainForm;
 //TIWFormLogin.SetURL('/', 'login.html');

end.
