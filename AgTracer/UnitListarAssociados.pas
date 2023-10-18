unit UnitListarAssociados;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  IWCompJQueryWidget, IWVCLComponent, IWBaseLayoutComponent,
  IWBaseContainerLayout, IWContainerLayout, IWTemplateProcessorHTML,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWHTMLControls, Data.DB, Data.Win.ADODB, IWCompLabel, System.Variants;

type
  TIWFormListarAssociados = class(TIWAppForm)
    VoltarLink: TIWLink;
    IncluirDiretoLink: TIWLink;
    EditarDiretoLink: TIWLink;
    ExcluirDiretoLink: TIWLink;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    IWJQueryDiretos: TIWJQueryWidget;
    Associados: TADOQuery;
    AssociadosNomeAssociado: TStringField;
    AssociadosNomeMunicipio: TStringField;
    AssociadosNomeResponsavel: TStringField;
    AssociadosTipoAssociado: TStringField;
    IWJQueryIndiretos: TIWJQueryWidget;
    AssociadosTipoEntidade: TStringField;
    Indiretos: TADOQuery;
    IndiretosNomeAssociado: TStringField;
    IndiretosNomeMunicipio: TStringField;
    IndiretosTipoEntidade: TStringField;
    IndiretosTipoAssociado: TStringField;
    IndiretosNomeResponsavel: TStringField;
    IncluirIndiretoLink: TIWLink;
    EditarIndiretoLink: TIWLink;
    ExcluirIndireto: TIWLink;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    AssociadosIDAssociado: TAutoIncField;
    AssociadosCNPJAssociado: TStringField;
    IndiretosIDAssociado: TAutoIncField;
    procedure IncluirDiretoLinkClick(Sender: TObject);
    procedure VoltarLinkClick(Sender: TObject);
    function VirgulaPorPonto(S:String):String;
    procedure IWAppFormRender(Sender: TObject);
    procedure EditarDiretoLinkClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure MyAjaxHandler(EventParams: TStringList);
    procedure IncluirIndiretoLinkClick(Sender: TObject);
    procedure EditarIndiretoLinkClick(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
    procedure ExcluirDiretoLinkClick(Sender: TObject);
    procedure ExcluirIndiretoClick(Sender: TObject);
  public
  end;

implementation

 uses IWAppCache, IWMimeTypes, IW.CacheStream, Windows, UserSessionUnit,
 UnitEditarAssociado;

{$R *.dfm}

procedure TIWFormListarAssociados.MyAjaxHandler(EventParams: TStringList);
var
 S, xFileName, xURL:String;
 i: Integer;
 Json:TStringList;
begin
 //WebApplication.ShowMessage(EventParams.Values['id']);
 //Verifica quais campos foram filtrados e monta a consulta
 With Indiretos do
 begin
  SQL[SQL.Count-3]:='and A.IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente);
  SQl[sql.count-2]:='And AssociadoDireto='+EventParams.Values['id'];
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
     //IWJQueryPremios.OnReady.Strings[2]:='   			"ajax": '+QuotedStr(xURL)+',';
     //IWJQueryPropriedades.OnReady.Strings[2]:='   			"ajax": '+QuotedStr(xURL)+',';
     //WebApplication.CallBackResponse.AddJavaScriptToExecute(  IWJQueryPremios.OnReady.Text );
     WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$(''#indiretos'').DataTable().ajax.url( '+QuotedStr(xURL)+').load();' );
     //WebApplication.CallBackResponse.AddJavaScriptToExecute(  'alert( '+QuotedStr(xURL)+');' );
    finally
     Json.Free;
    end;
  end
  else
   WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$(''#indiretos'').DataTable().clear().draw();' );
  Close;
 end;
end;

procedure TIWFormListarAssociados.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

function TIWFormListarAssociados.VirgulaPorPonto(S:String):String;
begin
 S:=StringReplace(S,'.','',[rfReplaceAll]);
 S:=StringReplace(S,',','.',[rfReplaceAll]);
 result:=S;
end;


procedure TIWFormListarAssociados.EditarDiretoLinkClick(Sender: TObject);
begin
 if Self.HiddenFields.Values['IdToEdit']<>'' then
 With TIWFormEditarAssociado.Create(WebApplication) do
 begin
  Usuarios.Open; //Exibir usuários do cadastro e edição
  Editando:=true;
  Associados.Open;
  if Associados.Locate('IDCliente; IDAssociado',VarArrayOf([TIWUserSession(WebApplication.Data).IDCliente, Self.HiddenFields.Values['IdToEdit']]),[]) then
  begin
   {//Exibir municípios da uf cadastrada
   With MunicipiosAssociado do
   begin
    Close;
    SQL[SQL.Count-2]:='where UF='+QuotedStr(AssociadosUF.AsString);
    Open;
   end;
   //Exibir municípios da uf cadastrada
   With MunicipiosResponsavel do
   begin
    Close;
    SQL[SQL.Count-2]:='where UF='+QuotedStr(AssociadosUFResp.AsString);
    Open;
   end;}
   //AssociadoDireto.Enabled:=AssociadosTipoAssociado.AsString='I';
   //Editar o registro
   Associados.Edit;
   Show;
  end
  else
   WebApplication.ShowMessage('Não foi possível editar este registro.');
 end
 else
  WebApplication.ShowMessage('Selecione um registro para editar.');
end;

procedure TIWFormListarAssociados.EditarIndiretoLinkClick(Sender: TObject);
begin
 if Self.HiddenFields.Values['IdIndiretoToEdit']<>'' then
 With TIWFormEditarAssociado.Create(WebApplication) do
 begin
  Usuarios.Open; //Exibir usuários do cadastro e edição
  Editando:=true;
  TipoAssociado.Items.Clear;
  TipoAssociado.Items.Add('Indireto');
  //AssociadoDireto.Enabled:=true;
  Associados.Open;
  if Associados.Locate('IDCliente; IDAssociado',VarArrayOf([TIWUserSession(WebApplication.Data).IDCliente, Self.HiddenFields.Values['IdIndiretoToEdit']]),[]) then
  begin
   //Exibir municípios da uf cadastrada
   {With MunicipiosAssociado do
   begin
    Close;
    SQL[SQL.Count-2]:='where UF='+QuotedStr(AssociadosUF.AsString);
    Open;
   end;
   //Exibir municípios da uf cadastrada
   With MunicipiosResponsavel do
   begin
    Close;
    SQL[SQL.Count-2]:='where UF='+QuotedStr(AssociadosUFResp.AsString);
    Open;
   end;}
   //Editar o registro
   Associados.Edit;
   Show;
  end
  else
   WebApplication.ShowMessage('Não foi possível editar este registro.');
 end
 else
  WebApplication.ShowMessage('Selecione um registro para editar.');
end;

procedure TIWFormListarAssociados.ExcluirDiretoLinkClick(Sender: TObject);
begin
 With TIWUserSession(WebApplication.Data).ADOQuery1 do
 begin
  Sql.Clear;
  SQl.Add('Delete from Associados');
  Sql.Add('Where IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente));
  Sql.Add('And IDAssociado='+Self.HiddenFields.Values['IdToEdit']);
  Try
   ExecSQl;
   WebApplication.ShowMessage('Associado Direto excluído com sucesso.');
  Except
   WebApplication.ShowMessage('Para excluir este Associado, exclua primeiro as Propriedades e Associados Indiretos.');
  End;
 end;
end;

procedure TIWFormListarAssociados.ExcluirIndiretoClick(Sender: TObject);
begin
 With TIWUserSession(WebApplication.Data).ADOQuery1 do
 begin
  Sql.Clear;
  SQl.Add('Delete from Associados');
  Sql.Add('Where IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente));
  Sql.Add('And IDAssociado='+Self.HiddenFields.Values['IdIndiretoToEdit']);
  Try
   ExecSQl;
   WebApplication.ShowMessage('Associado Indireto excluído com sucesso.');
  Except
   WebApplication.ShowMessage('Para excluir este Associado, exclua primeiro as Propriedades.');
  End;
 end;
end;

procedure TIWFormListarAssociados.IncluirDiretoLinkClick(Sender: TObject);
begin
 With TIWFormEditarAssociado.Create(WebApplication) do
 begin
  Associados.Open;
  Editando:=false;
  Associados.Append;
  AssociadosIDCliente.Value:=TIWUserSession(WebApplication.Data).IDCliente;
  Show;
 end;
end;

procedure TIWFormListarAssociados.IncluirIndiretoLinkClick(Sender: TObject);
begin
 With TIWFormEditarAssociado.Create(WebApplication) do
 begin
  Associados.Open;
  Editando:=false;
  Associados.Append;
  //Atribuir AssociadoDireto
  AssociadosAssociadoDireto.AsString:=Self.HiddenFields.Values['IdToEdit'];
  AssociadoDireto.Required:=true;
  //Atribuir Tipo Associado
  AssociadosTipoAssociado.Value:='Indireto';
  TipoAssociado.Items.Clear;
  TipoAssociado.Items.Add('Indireto');
  //Atribuir Cliente
  AssociadosIDCliente.Value:=TIWUserSession(WebApplication.Data).IDCliente;
  Show;
 end;
end;

procedure TIWFormListarAssociados.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
 WebApplication.RegisterCallBack('MyAjaxHandler', MyAjaxHandler);
end;

procedure TIWFormListarAssociados.IWAppFormRender(Sender: TObject);
var
 S, xFileName, xURL:String;
 i, variaveis:Integer;
 Json:TStringList;
begin
 Variaveis:=0;
 //Verifica quais campos foram filtrados e monta a consulta
 With Associados do
 begin
  SQL[SQL.Count-2]:='and A.IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente);
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
     JSon.SaveToFile(GGetWebApplicationThreadVar.UserCacheDir+'Associados.txt', TEncoding.UTF8);
     xFileName := TIWAppCache.NewTempFileName;
     Windows.CopyFile(PChar(GGetWebApplicationThreadVar.UserCacheDir+'Associados.txt'), PChar(xFileName), True);
     xURL := TIWAppCache.AddFileToCache(Self, xFileName,TIWMimeTypes.GetAsString(mtUnknown), ctSession);
     IWJQueryDiretos.OnReady.Strings[2]:='   			"ajax": '+QuotedStr(xURL)+',';
    finally
     Json.Free;
    end;
  end
  else
   IWJQueryDiretos.OnReady.Strings[2]:='/*   			"ajax": */';
  Close;
 end;
end;

procedure TIWFormListarAssociados.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;


end.
