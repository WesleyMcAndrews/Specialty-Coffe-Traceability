unit UnitListarUsuarios;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  IWCompJQueryWidget, IWVCLComponent, IWBaseLayoutComponent,
  IWBaseContainerLayout, IWContainerLayout, IWTemplateProcessorHTML,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWHTMLControls, Data.DB, Data.Win.ADODB, IWCompLabel, System.Variants;

type
  TIWFormListarUsuarios = class(TIWAppForm)
    VoltarLink: TIWLink;
    IncluirLink: TIWLink;
    EditarLink: TIWLink;
    DesativarLink: TIWLink;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    IWJQueryWidget1: TIWJQueryWidget;
    Usuarios: TADOQuery;
    UsuariosIDUsuario: TAutoIncField;
    UsuariosCPF: TStringField;
    UsuariosNomeUsuario: TStringField;
    UsuariosAdministrativo: TBooleanField;
    UsuariosAdministrador: TBooleanField;
    UsuariosAvaliador: TBooleanField;
    UsuariosComercial: TBooleanField;
    UsuariosUsuarioCadastro: TStringField;
    UsuariosDtCadastro: TDateTimeField;
    UsuariosUsuarioEdicao: TStringField;
    UsuariosDtEdicao: TDateTimeField;
    UsuariosAtivo: TBooleanField;
    UsuariosEmail: TStringField;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    procedure IncluirLinkClick(Sender: TObject);
    procedure VoltarLinkClick(Sender: TObject);
    function VirgulaPorPonto(S:String):String;
    procedure IWAppFormRender(Sender: TObject);
    procedure EditarLinkClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
    procedure DesativarLinkClick(Sender: TObject);
  public
  end;

implementation

 uses IWAppCache, IWMimeTypes, IW.CacheStream, Windows, UserSessionUnit,
 UnitEditarUsuario, MD5;

{$R *.dfm}

function TIWFormListarUsuarios.VirgulaPorPonto(S:String):String;
begin
 S:=StringReplace(S,'.','',[rfReplaceAll]);
 S:=StringReplace(S,',','.',[rfReplaceAll]);
 result:=S;
end;


procedure TIWFormListarUsuarios.DesativarLinkClick(Sender: TObject);
begin
 //Testar se o usuário está se desativando
 if Self.HiddenFields.Values['IdToEdit']=IntToStr(TIWUserSession(WebApplication.Data).UsuarioAtivo) then
 begin
  WebApplication.ShowMessage('O usuário não pode desativar a si mesmo.');
  Exit;
 end;
 With TIWUserSession(WebApplication.Data).ADOQuery1 do
 begin
  Sql.Clear;
  SQl.Add('Update Usuarios');
  SQl.Add('Set Ativo=0');
  Sql.Add('Where IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente));
  Sql.Add('And IDUsuario='+Self.HiddenFields.Values['IdToEdit']);
  Try
   ExecSQl;
   WebApplication.ShowMessage('Usuário desativado com sucesso.');
  Except
   WebApplication.ShowMessage('Não foi possível desativar este usuario.');
  End;
 end;
end;

procedure TIWFormListarUsuarios.EditarLinkClick(Sender: TObject);
begin
 if Self.HiddenFields.Values['IdToEdit']<>'' then
 With TIWFormEditarUsuario.Create(WebApplication) do
 begin
  Users.Open; //Exibir usuários do cadastro e edição
  Editando:=true;
  Users.Open;
  Usuarios.Open; //Exibir auditoria
  if Users.Locate('IDCliente; IDUsuario',VarArrayOf([TIWUserSession(WebApplication.Data).IDCliente, StrToInt(Self.HiddenFields.Values['IdToEdit'])]),[]) then
  begin
   //Editar o registro
   Users.Edit;
   Show;
  end
  else
   WebApplication.ShowMessage('Não foi possível editar este registro.');
 end
 else
  WebApplication.ShowMessage('Selecione um registro para editar.');
end;

procedure TIWFormListarUsuarios.IncluirLinkClick(Sender: TObject);
begin
 //TIWUserSession(WebApplication.Data).EditarPropriedade:=0;
 With TIWFormEditarUsuario.Create(WebApplication) do
 begin
  Users.Open;
  Editando:=false;
  Users.Append;
  //Setar Cliente
  UsersIDCliente.Value:=TIWUserSession(WebApplication.Data).IDCliente;
  //Setar senha inicial
  NovaSenha:=TIWUserSession(WebApplication.Data).RandomPassword(7);
  UsersSenha.AsString:=MD5DigestToStr(MD5String(NovaSenha));
  UsersIDusuarioCadastro.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
  Show;
 end;
end;

procedure TIWFormListarUsuarios.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
end;

procedure TIWFormListarUsuarios.IWAppFormRender(Sender: TObject);
var
 S, xFileName, xURL:String;
 i, variaveis:Integer;
 Json:TStringList;
begin
 Variaveis:=0;
 //Verifica quais campos foram filtrados e monta a consulta
 With Usuarios do
 begin
  SQl[SQl.Count-2]:='Where U.IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente);
  Open;
  if RecordCount>0 then
  begin
    Json:=TStringList.Create;
    Json.Add('{"data": [');
    while not Eof do
    begin
     S:='{';
     for I := 0 to Fields.Count-1 do
      if Fields[i].Visible then //Apenas Campos visíveis
       S:=S+'"'+Fields[i].DisplayLabel+'":'+'"'+Fields[i].AsString+'",';
     S[Length(S)]:='}';//substituir ultima virgula
     JSon.Add(S+',');
     Next;
    end;
    //Retirar ultima virgula
    S:=Json.Strings[JSon.Count-1]; System.delete(S,Length(S),1); Json.Strings[JSon.Count-1]:=S;
    Json.Add(']}');
    try
     JSon.SaveToFile(GGetWebApplicationThreadVar.UserCacheDir+'Usuarios.txt', TEncoding.UTF8);
     xFileName := TIWAppCache.NewTempFileName;
     Windows.CopyFile(PChar(GGetWebApplicationThreadVar.UserCacheDir+'Usuarios.txt'), PChar(xFileName), True);
     xURL := TIWAppCache.AddFileToCache(Self, xFileName,TIWMimeTypes.GetAsString(mtUnknown), ctSession);
     IWJQueryWidget1.OnReady.Strings[2]:='   			"ajax": '+QuotedStr(xURL)+',';
    finally
     Json.Free;
    end;
  end
  else
   IWJQueryWidget1.OnReady.Strings[2]:='/*   			"ajax": */';
  Close;
 end;
end;

procedure TIWFormListarUsuarios.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

procedure TIWFormListarUsuarios.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;


end.
