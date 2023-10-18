unit UnitEditarAssociado;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWHTMLControls, Data.DB, Data.Win.ADODB,
  IWCompButton, IWDBStdCtrls, IWCompListbox, IWCompEdit, IWCompJQueryWidget,
  IWCompExtCtrls, IWDBExtCtrls, System.Variants, IWCompLabel,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, idMessage;

type
  TIWFormEditarAssociado = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    VoltarLink: TIWLink;
    Associados: TADODataSet;
    AssociadosNomeAssociado: TStringField;
    AssociadosUF: TStringField;
    AssociadosCodigoMunicipio: TStringField;
    AssociadosEndereco: TStringField;
    AssociadosBairro: TStringField;
    AssociadosCEP: TStringField;
    AssociadosEmail: TStringField;
    AssociadosCelular: TStringField;
    AssociadosFone: TStringField;
    AssociadosCPFResponsavel: TStringField;
    AssociadosNomeResponsavel: TStringField;
    AssociadosUFResp: TStringField;
    AssociadosCodigoMunicResp: TStringField;
    AssociadosEnderecoResp: TStringField;
    AssociadosBairroResp: TStringField;
    AssociadosCEPResp: TStringField;
    AssociadosEmailResp: TStringField;
    AssociadosCelularResp: TStringField;
    AssociadosFoneResp: TStringField;
    AssociadosIDUsuarioCadastro: TIntegerField;
    AssociadosDataCadastro: TDateTimeField;
    AssociadosIDUsuarioEdicao: TIntegerField;
    AssociadosDataEdicao: TDateTimeField;
    NomeAssociado: TIWDBEdit;
    EnderecoAssociado: TIWDBEdit;
    BairroAssociado: TIWDBEdit;
    CEPAssociado: TIWDBEdit;
    EmailAssociado: TIWDBEdit;
    CelularAssociado: TIWDBEdit;
    FoneAssociado: TIWDBEdit;
    AssociadoDireto: TIWDBLookupComboBox;
    CPFResponsavel: TIWDBEdit;
    NomeResponsavel: TIWDBEdit;
    EnderecoResponsavel: TIWDBEdit;
    BairroResponsavel: TIWDBEdit;
    CEPResponsavel: TIWDBEdit;
    EmailResponsavel: TIWDBEdit;
    CelularResponsavel: TIWDBEdit;
    FoneResponsavel: TIWDBEdit;
    AssociadosSrc: TDataSource;
    Usuarios: TADOQuery;
    SalvarBtn: TIWButton;
    CNPJAssociado: TIWDBEdit;
    AssociadosList: TADOQuery;
    AssociadosListSrc: TDataSource;
    AssociadosListNomeAssociado: TStringField;
    TipoAssociado: TIWDBComboBox;
    CancelarBtn: TIWButton;
    CadastradoPor: TIWDBLabel;
    EditadoPor: TIWDBLabel;
    UsuariosSrc: TDataSource;
    UsuariosUsuarioCadastro: TStringField;
    UsuariosUsuarioEdicao: TStringField;
    AssociadosTipoEntidade: TStringField;
    AssociadosTipoAssociado: TStringField;
    TipoEntidade: TIWDBComboBox;
    AssociadosSenha: TStringField;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    MunicAssociado: TIWDBEdit;
    AssociadosMunicipio: TStringField;
    AssociadosMunicipioResp: TStringField;
    MunicResponsavel: TIWDBEdit;
    CodigoMunicAssociado: TIWDBEdit;
    CodigoMunicResponsavel: TIWDBEdit;
    UFAssociado: TIWDBEdit;
    UFResponsavel: TIWDBEdit;
    IWJQueryWidget1: TIWJQueryWidget;
    AssociadosIDCliente: TIntegerField;
    AssociadosIDAssociado: TAutoIncField;
    AssociadosCNPJAssociado: TStringField;
    AssociadosAssociadoDireto: TIntegerField;
    AssociadosListIDAssociado: TAutoIncField;
    procedure VoltarLinkClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure AssociadoDiretoAsyncChange(Sender: TObject;
      EventParams: TStringList);
    procedure SalvarBtnClick(Sender: TObject);
    function RandomPassword(PLen: Integer): string;
    procedure AssociadosNewRecord(DataSet: TDataSet);
    Procedure EnviarEmail;
    procedure ProfileLogoutLinkClick(Sender: TObject);
    procedure IWAppFormDestroy(Sender: TObject);
  public
   Editando:Boolean;
   NovaSenha:String;
  end;

implementation

{$R *.dfm}

uses UserSessionUnit, MD5;

Procedure TIWFormEditarAssociado.EnviarEmail;
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
       MailMessage.Recipients.EMailAddresses :=AssociadosEmailResp.AsString;
       MailMessage.Subject := 'Sistema AMSC';
       MailMessage.Body.Add('Bem-vindo ao Sistema de Classificação e Rastreabilidade de Cafés Especiais da Alta Mogiana.');
       MailMessage.Body.Add(' ');
       MailMessage.Body.Add('Você terá acesso aos resultados de Classificação e Avaliação de suas amostras, dados agrometeorológicos e muito mais.');
       MailMessage.Body.Add('Use seu login e senha para acessar o sistema.');
       MailMessage.Body.Add('Seu login é: '+AssociadosCNPJAssociado.AsString);
       MailMessage.Body.Add('Sua senha é: '+NovaSenha);
       MailMessage.Body.Add(' ');
       MailMessage.Body.Add('Guarde este e-mail para futuras referências.');

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

function TIWFormEditarAssociado.RandomPassword(PLen: Integer): string;
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

procedure TIWFormEditarAssociado.AssociadoDiretoAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
 if AssociadoDireto.SelectedValue=CNPJAssociado.Text then
 begin
  WebApplication.ShowMessage('O Associado Direto não pode ser a mesma empresa. Selecione outro.');
  AssociadosAssociadoDireto.Value:=null;
 end;
end;

procedure TIWFormEditarAssociado.AssociadosNewRecord(DataSet: TDataSet);
begin
 NovaSenha:=RandomPassword(7);
 AssociadosSenha.AsString:=MD5DigestToStr(MD5String(NovaSenha));
end;

procedure TIWFormEditarAssociado.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
 with AssociadosList do
 begin
  SQl[sql.Count-3]:='Where IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente);
  Open;
 end;
 //MunicAssociado.Enabled:=not Editando;
 //MunicResponsavel.Enabled:=not Editando;
end;

procedure TIWFormEditarAssociado.IWAppFormDestroy(Sender: TObject);
begin
 AssociadosList.Close;
end;

procedure TIWFormEditarAssociado.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

procedure TIWFormEditarAssociado.SalvarBtnClick(Sender: TObject);
begin
 {if AssociadosIDAssociado.AsString=AssociadosAssociadoDireto.AsString then
 begin
  WebApplication.ShowMessage('O Associado Direto não pode ser a mesma empresa. Selecione outro.');
  exit;
 end;}
 //gravar
 try
  if Editando then
  begin
   AssociadosIDUsuarioEdicao.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
   AssociadosDataEdicao.Value:=Now();
  end
  else
   AssociadosIDUsuarioCadastro.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
  Associados.Post;
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

{procedure TIWFormEditarAssociado.TipoAssociadoAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
 AssociadoDireto.Enabled:=TipoAssociado.SelectedValue='I';
 AssociadosAssociadoDireto.Required:=TipoAssociado.SelectedValue='I';
 //AssociadoDireto.KeyValue:=null;
 AssociadosAssociadoDireto.Value:='';
end;}

{procedure TIWFormEditarAssociado.UFAssociadoAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
 MunicAssociado.Enabled:=UFAssociado.SelectedValue<>'';
 With MunicipiosAssociado do
 begin
  Close;
  SQL[SQL.Count-2]:='where UF='+QuotedStr(UFAssociado.SelectedValue);
  Open;
 end;
 MunicAssociado.RepaintControl;
end;}

{procedure TIWFormEditarAssociado.UFResponsavelAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
 MunicResponsavel.Enabled:=UFResponsavel.SelectedValue<>'';
 With MunicipiosResponsavel do
 begin
  Close;
  SQL[SQL.Count-2]:='where UF='+QuotedStr(UFResponsavel.SelectedValue);
  Open;
 end;
 MunicResponsavel.RepaintControl;
end;}

procedure TIWFormEditarAssociado.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;

end.
