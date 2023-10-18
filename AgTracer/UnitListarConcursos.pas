unit UnitListarConcursos;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  IWCompJQueryWidget, IWVCLComponent, IWBaseLayoutComponent,
  IWBaseContainerLayout, IWContainerLayout, IWTemplateProcessorHTML,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWHTMLControls, Data.DB, Data.Win.ADODB, IWCompLabel, System.Variants,
  IWCompCheckbox, IWCompEdit, IWCompListbox, IWDBStdCtrls, IWCompButton;

type
  TIWFormListarConcursos = class(TIWAppForm)
    VoltarLink: TIWLink;
    IncluirLink: TIWLink;
    EditarLink: TIWLink;
    ExcluirLink: TIWLink;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    IWJQueryWidget1: TIWJQueryWidget;
    Concursos: TADOQuery;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    ConcursosIDConcurso: TAutoIncField;
    ConcursosNomeConcurso: TStringField;
    ConcursosCategorias: TStringField;
    ConcursosArquivoRegulamento: TStringField;
    ConcursosDtPremiacao: TDateTimeField;
    ConcursosFaseAtual: TStringField;
    IWJQueryJurados: TIWJQueryWidget;
    JuradosConcurso: TADOQuery;
    JuradosConcursoIDJurado: TAutoIncField;
    JuradosConcursoNomeJurado: TStringField;
    JuradosConcursoNacionalidade: TStringField;
    JuradosConcursoInstituicao: TStringField;
    JuradosConcursoEmail: TStringField;
    ExcluirJurado: TIWLink;
    EditarJurado: TIWLink;
    IncluirJurado: TIWLink;
    JuradosConcursoJuriOficial: TBooleanField;
    Jurados: TADOQuery;
    JuradosJSON: TMemoField;
    JuradosConcursoPreSelecao: TBooleanField;
    JuradosConcursoSelecao: TBooleanField;
    procedure IncluirLinkClick(Sender: TObject);
    procedure VoltarLinkClick(Sender: TObject);
    function VirgulaPorPonto(S:String):String;
    procedure IWAppFormRender(Sender: TObject);
    procedure EditarLinkClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
    procedure ExcluirLinkClick(Sender: TObject);
    procedure MyAjaxHandler(EventParams: TStringList);
    procedure adicionarJurado(EventParams: TStringList);
    procedure popularComboJurados(EventParams: TStringList);
    procedure popularComboCategorias(EventParams: TStringList);
    procedure abrirCategoria(EventParams: TStringList);
    procedure resetarSenha(EventParams: TStringList);
    procedure IncluirJuradoClick(Sender: TObject);
    procedure EditarJuradoClick(Sender: TObject);
    procedure ExcluirJuradoAsyncClick(Sender: TObject;
      EventParams: TStringList);
    Procedure EnviarEmail(idJurado:Integer);
  public
   NovaSenha:String;
   ArquivoJsonConcurso:String;
  end;

implementation

 uses IWAppCache, IWMimeTypes, IW.CacheStream, Windows,
 UserSessionUnit, UnitEditarConcurso, UnitEditarJurado, MD5,
 IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
 IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
 IdSMTP, idMessage;

{$R *.dfm}

Procedure TIWFormListarConcursos.EnviarEmail(idJurado:integer);
var
   SMTP: TidSMTP;
   MailMessage: TidMessage;
begin
  //Localizar Jurado
  Concursos.Open;
  JuradosConcurso.Open;
  If JuradosConcurso.Locate('IDJurado', idJurado, []) then
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
       MailMessage.Recipients.EMailAddresses :=JuradosConcursoEmail.AsString;
       //Assunto
       MailMessage.Subject := ConcursosNomeConcurso.AsString;
       //Body
       MailMessage.Body.Add(JuradosConcursoNomeJurado.AsString+',');
       MailMessage.Body.Add(' ');
       MailMessage.Body.Add('Você foi confirmado como Jurado do '+ConcursosNomeConcurso.AsString+'.');
       MailMessage.Body.Add(' ');
       MailMessage.Body.Add('Seu login é: '+JuradosConcursoEmail.AsString);
       MailMessage.Body.Add('Sua senha é: '+NovaSenha);
       MailMessage.Body.Add(' ');
       MailMessage.Body.Add('Você terá acesso ao sistema de avaliação na(s) fase(s) de:');
       if JuradosConcursoPreSelecao.AsBoolean then
         MailMessage.Body.Add('Pré-seleção');
       if JuradosConcursoSelecao.AsBoolean then
         MailMessage.Body.Add('Seleção');
       //Oficial ou Extra-oficial
       if JuradosConcursoJuriOficial.AsBoolean then
         MailMessage.Body.Add('Na condição de Jurado Oficial.')
       else
         MailMessage.Body.Add('Na condição de Jurado Extra-oficial.');

       //TIdAttachmentFile.Create(MailMessage.MessageParts,'c:\tmp\whatever.pdf');
       try
         SMTP.Connect;
         SMTP.Send(MailMessage)
       finally
         if SMTP.Connected then SMTP.Disconnect;
       end
     finally
       MailMessage.Free;
     end
   finally
     SMTP.Free
   end;
  end
  else
   WebApplication.ShowMessage('Não foi possível enviar a senha deste jurado.\n');
  JuradosConcurso.Close;
  Concursos.Close;
end;

procedure TIWFormListarConcursos.adicionarJurado(EventParams: TStringList);
 var
  Parametros:TStringList;
begin
 NovaSenha:=TIWUserSession(WebApplication.Data).RandomPassword(7);
 With TIWUserSession(WebApplication.Data).ADOQuery1 do
 begin
  SQl.Clear;
  SQl.Add('Insert Into ConcursoJuradosConcurso');
  SQl.Add('(IDConcurso, IDJurado, PreSelecao, Selecao, JuriOficial, Senha)');
  SQl.Add('Values('+EventParams.Values['id']+',');
  SQl.Add(EventParams.Values['idJurado']+',');
  SQl.Add(EventParams.Values['preselecao']+',');
  SQl.Add(EventParams.Values['selecao']+',');
  SQl.Add(EventParams.Values['oficial']+',');
  SQl.Add(QuotedStr(MD5DigestToStr(MD5String(NovaSenha)))+')');
  try
   ExecSQL;
   //Atualiza a lista de jurados do concurso
   Parametros:=TStringList.Create;
   Parametros.Add('id='+EventParams.Values['id']);
   MyAjaxHandler(Parametros);
   Parametros.Free;
   WebApplication.ShowMessage('Jurado Adicionado');
   //Enviar Email com senha
   EventParams.Add('Senha='+NovaSenha);
   EnviarEmail(StrToInt(EventParams.Values['idJurado']));
  Except
   on E : Exception do
   begin
    WebApplication.ShowMessage('Este Jurado já está foi incluído neste concurso.'+#13+E.Message);
    Exit;
   end;
  end;
 end;
end;

procedure TIWFormListarConcursos.resetarSenha(EventParams: TStringList);
 var
  Parametros:TStringList;
begin
 NovaSenha:=TIWUserSession(WebApplication.Data).RandomPassword(7);
 With TIWUserSession(WebApplication.Data).ADOQuery1 do
 begin
  SQl.Clear;
  SQl.Add('Update ConcursoJuradosConcurso');
  Sql.Add('set Senha='+QuotedStr(MD5DigestToStr(MD5String(NovaSenha))));
  SQl.Add('where IDConcurso='+EventParams.Values['id']);
  SQl.Add('and IDJurado='+EventParams.Values['idJurado']);
  try
   ExecSQL;
   //Enviar Email com senha
   EnviarEmail(StrToInt(EventParams.Values['idJurado']));
   WebApplication.ShowMessage('Senha alterada. O Jurado receberá um e-mail com a nova senha.');
  Except
   on E : Exception do
   begin
    WebApplication.ShowMessage('Não foi possível resetar a senha deste jurado.\n'+E.Message);
    Exit;
   end;
  end;
 end;
end;

procedure TIWFormListarConcursos.MyAjaxHandler(EventParams: TStringList);
var
 S, xFileName, xURL:String;
 i: Integer;
 Json:TStringList;
begin
 //Verifica quais campos foram filtrados e monta a consulta
 With JuradosConcurso do
 begin
  SQl[sql.count-2]:='where IDConcurso='+QuotedStr(EventParams.Values['id']);
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
       if Fields[i].AsString<>'' then
       case Fields[i].DataType of
        ftInteger:
         S:=S+'"'+Fields[i].DisplayLabel+'":'+'"'+FormatFloat('00', Fields[i].Value)+'",' ;
        ftFloat:
          S:=S+'"'+Fields[i].DisplayLabel+'":'+'"'+FormatFloat((Fields[i] as TNumericField).DisplayFormat, Fields[i].Value)+'",' ;
        else
         S:=S+'"'+Fields[i].DisplayLabel+'":'+'"'+Fields[i].AsString+'",';
       end
       else
        S:=S+'"'+Fields[i].DisplayLabel+'":'+'"'+Fields[i].AsString+'",';
     S[Length(S)]:='}';//substituir ultima virgula
     JSon.Add(S+',');
     Next;
    end;
    //Retirar ultima virgula
    S:=Json.Strings[JSon.Count-1]; System.delete(S,Length(S),1); Json.Strings[JSon.Count-1]:=S;
    Json.Add(']}');
    try
     JSon.SaveToFile(GGetWebApplicationThreadVar.UserCacheDir+'Arquivo.txt', TEncoding.UTF8);
     xFileName := TIWAppCache.NewTempFileName;
     Windows.CopyFile(PChar(GGetWebApplicationThreadVar.UserCacheDir+'Arquivo.txt'), PChar(xFileName), True);
     xURL := TIWAppCache.AddFileToCache(Self, xFileName,TIWMimeTypes.GetAsString(mtUnknown), ctSession);
     //IWJQueryPremios.OnReady.Strings[2]:='   			"ajax": '+QuotedStr(xURL)+',';
     //IWJQueryPropriedades.OnReady.Strings[2]:='   			"ajax": '+QuotedStr(xURL)+',';
     //WebApplication.CallBackResponse.AddJavaScriptToExecute(  IWJQueryPremios.OnReady.Text );
     WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$(''#jurados'').DataTable().ajax.url( '+QuotedStr(xURL)+').load();' );
     //WebApplication.CallBackResponse.AddJavaScriptToExecute(  'alert( '+QuotedStr(xURL)+');' );
    finally
     Json.Free;
    end;
  end
  else
   WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$(''#jurados'').DataTable().clear().draw();' );
  Close;
 end;
 WebApplication.CallBackResponse.AddJavaScriptToExecute('ShowBusy(false);'); //Hide Intraweb Loading Animation
end;

procedure TIWFormListarConcursos.popularComboCategorias(EventParams: TStringList);
var
 ListaCategorias: TStringList;
 I:Integer;
 S:String;
begin
 //Passa a lista de categorias do concurso
 //Separar Categorias em uma StringList
 ListaCategorias:=TStringList.Create;
 ListaCategorias.Delimiter:=',';
 ListaCategorias.StrictDelimiter:=true;
 ListaCategorias.DelimitedText:=EventParams.Values['Categs'];
 //Preencher Combo Categoria
 S:='[';
 For I:=0 to ListaCategorias.Count-1 do
  S:=S+'{''id'':'''+ListaCategorias[I]+''',''text'':'''+ListaCategorias[I]+'''},';
 S[length(S)]:=']'; //Substitui ultima virgula por ']'
 //Monta o combo
 ListaCategorias.Free;
 WebApplication.CallBackResponse.AddJavaScriptToExecute('$("#COMBOCATEGORIAS").attr("names","'+S+'"); modalconcurso.encherComboCategorias();');
end;

procedure TIWFormListarConcursos.abrirCategoria(EventParams: TStringList);
begin
 With TIWUserSession(WebApplication.Data).ADOQuery1 do
 begin
  if EventParams.Values['id']='' then
  begin
   WebApplication.ShowMessage('Selecione um concurso.');
   Exit;
  end;
  Sql.Clear;
  SQl.Add('Update Concursos');
  SQl.Add('Set CategoriaAvaliacao='+QuotedStr(EventParams.Values['Categoria']));
  SQl.Add('where IDConcurso='+EventParams.Values['id']);
  try
   ExecSql;
   //Listar Concursos novamente
   IWAppFormRender(self);
   //Atualizar Listagem
   WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$("#concursos").DataTable().ajax.url( '+QuotedStr(ArquivoJsonConcurso)+').load();'+
   '$("#HIDDEN_IDTOEDIT").val(null); $("#JURADOSDIV").hide()');
  except
   on E : Exception do
    WebApplication.ShowMessage('Não foi possível abrir a categoria.'+#13+E.Message);
  end;
 end;
end;

procedure TIWFormListarConcursos.popularComboJurados(EventParams: TStringList);
begin
 with Jurados do
 begin
  //Selecionar Jurados do Cliente q não estão no concurso
  SQl[SQl.Count-6]:='  where C.IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente);
  SQl[SQl.Count-3]:='  where IDConcurso='+EventParams.Values['id']+')';
  Jurados.Open;
  //Ajustar switch para off
  WebApplication.CallBackResponse.AddJavaScriptToExecute('$("#CHKJURADOOFICIAL").bootstrapSwitch("state", false);');
  //Destruir Combo
		WebApplication.CallBackResponse.AddJavaScriptToExecute('$("#COMBOJURADOS").val(null).trigger("change"); $("#COMBOJURADOS").select2("destroy");');
  //Criar Combo com as opções
  WebApplication.CallBackResponse.AddJavaScriptToExecute(  'var options='+JuradosJSON.AsString+';'+
    '$("#COMBOJURADOS").select2({data:{ results: options, text: "text", id: "id"}});');
  Jurados.Close;
 end;
end;

function TIWFormListarConcursos.VirgulaPorPonto(S:String):String;
begin
 S:=StringReplace(S,'.','',[rfReplaceAll]);
 S:=StringReplace(S,',','.',[rfReplaceAll]);
 result:=S;
end;


procedure TIWFormListarConcursos.ExcluirJuradoAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
 With TIWUserSession(WebApplication.Data).ADOQuery1 do
 begin
  Sql.Clear;
  SQl.Add('Delete from ConcursoJuradosConcurso');
  Sql.Add('Where IDConcurso='+EventParams.Values['IdToEdit']);
  Sql.Add('And IDJurado='+EventParams.Values['IdJuradoToEdit']);
  Try
   ExecSQl;
   WebApplication.ShowMessage('Jurado removido do concurso com sucesso.');
  Except
   on E : Exception do
    WebApplication.ShowMessage('Este jurado tem avaliações neste concurso e não pode ser excluído.'+#13+E.Message);
  End;
 end;
end;

procedure TIWFormListarConcursos.ExcluirLinkClick(Sender: TObject);
begin
 //Testar se o usuário está se desativando
end;

procedure TIWFormListarConcursos.EditarJuradoClick(Sender: TObject);
begin
 if Self.HiddenFields.Values['IdJuradoToEdit']<>'' then
 With TIWFormEditarJurado.Create(WebApplication) do
 begin
  Jurados.Open;
  Editando:=true;
  Usuarios.Open; //Exibir auditoria
  if Jurados.Locate('IDCliente; IDJurado',VarArrayOf([TIWUserSession(WebApplication.Data).IDCliente, StrToInt(Self.HiddenFields.Values['IdJuradoToEdit'])]),[]) then
  begin
   //Editar o registro
   Jurados.Edit;
   Show;
  end
  else
  begin
   WebApplication.ShowMessage('Não foi possível editar este registro.');
   Jurados.Close;
   Usuarios.Close;
  end;
 end
 else
  WebApplication.ShowMessage('Selecione um registro para editar.');
end;

procedure TIWFormListarConcursos.EditarLinkClick(Sender: TObject);
begin
 if Self.HiddenFields.Values['IdToEdit']<>'' then
 With TIWFormEditarConcurso.Create(WebApplication) do
 begin
  Concursos.Open;
  Editando:=true;
  Usuarios.Open; //Exibir auditoria
  if Concursos.Locate('IDCliente; IDConcurso',VarArrayOf([TIWUserSession(WebApplication.Data).IDCliente, StrToInt(Self.HiddenFields.Values['IdToEdit'])]),[]) then
  begin
   //Editar o registro
   Concursos.Edit;
   Show;
  end
  else
   WebApplication.ShowMessage('Não foi possível editar este registro.');
 end
 else
  WebApplication.ShowMessage('Selecione um registro para editar.');
end;

procedure TIWFormListarConcursos.IncluirJuradoClick(Sender: TObject);
begin
 With TIWFormEditarJurado.Create(WebApplication) do
 begin
  Jurados.Open;
  Editando:=false;
  Jurados.Append;
  //Setar Cliente
  JuradosIDCliente.Value:=TIWUserSession(WebApplication.Data).IDCliente;
  //Setar senha inicial
  Show;
 end;
end;

procedure TIWFormListarConcursos.IncluirLinkClick(Sender: TObject);
begin
 //TIWUserSession(WebApplication.Data).EditarPropriedade:=0;
 With TIWFormEditarConcurso.Create(WebApplication) do
 begin
  Concursos.Open;
  Editando:=false;
  Concursos.Append;
  //Setar Cliente
  ConcursosIDCliente.Value:=TIWUserSession(WebApplication.Data).IDCliente;
  //Setar senha inicial
  Show;
 end;
end;

procedure TIWFormListarConcursos.IWAppFormCreate(Sender: TObject);
var
 S, xFileName, xURL:String;
 i :Integer;
 Json:TStringList;
begin
 //Gerar JSON de Jurados
 {json:=TStringList.Create;
 with Jurados do
 begin
  SQl[SQl.Count-4]:='  where C.IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente);
  Jurados.Open;
  json.Add( JuradosJSON.AsString );
  Jurados.Close;
 end;
 json.SaveToFile(GGetWebApplicationThreadVar.UserCacheDir+'Arquivo.txt', TEncoding.UTF8);
 xFileName := TIWAppCache.NewTempFileName;
 Windows.CopyFile(PChar(GGetWebApplicationThreadVar.UserCacheDir+'Arquivo.txt'), PChar(xFileName), True);
 xURL := TIWAppCache.AddFileToCache(Self, xFileName,TIWMimeTypes.GetAsString(mtUnknown), ctSession);
 IWJQueryListarJurados.OnReady[0]:='var arquivo = '+QuotedStr(xURL)+';';
 json.free;}
 //Nome do Usuário
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
 //Callbacks
 WebApplication.RegisterCallBack('MyAjaxHandler', MyAjaxHandler);
 WebApplication.RegisterCallBack('adicionarJurado', adicionarJurado);
 WebApplication.RegisterCallBack('popularComboJurados', popularComboJurados);
 WebApplication.RegisterCallBack('popularComboCategorias', popularComboCategorias);
 WebApplication.RegisterCallBack('abrirCategoria', abrirCategoria);
 WebApplication.RegisterCallBack('resetarSenha', resetarSenha);
end;

procedure TIWFormListarConcursos.IWAppFormRender(Sender: TObject);
var
 S, xFileName, xURL:String;
 i :Integer;
 Json:TStringList;
begin
 //Verifica quais campos foram filtrados e monta a consulta
 With Concursos do
 begin
  SQl[SQl.Count-2]:='Where C.IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente);
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
     JSon.SaveToFile(GGetWebApplicationThreadVar.UserCacheDir+'Arquivo.txt', TEncoding.UTF8);
     xFileName := TIWAppCache.NewTempFileName;
     Windows.CopyFile(PChar(GGetWebApplicationThreadVar.UserCacheDir+'Arquivo.txt'), PChar(xFileName), True);
     xURL := TIWAppCache.AddFileToCache(Self, xFileName,TIWMimeTypes.GetAsString(mtUnknown), ctSession);
     ArquivoJsonConcurso:=xURL;
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

procedure TIWFormListarConcursos.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

procedure TIWFormListarConcursos.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;


end.
