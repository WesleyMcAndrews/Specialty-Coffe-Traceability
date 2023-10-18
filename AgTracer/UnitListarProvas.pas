unit UnitListarProvas;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  IWCompJQueryWidget, IWVCLComponent, IWBaseLayoutComponent,
  IWBaseContainerLayout, IWContainerLayout, IWTemplateProcessorHTML,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWHTMLControls, Data.DB, Data.Win.ADODB, IWBaseComponent, IWBaseHTMLComponent,
  IWBaseHTML40Component, IWCompExtCtrls, Vcl.Forms, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion, IWCompCheckbox,
  IWCompLabel;

type
  TIWFormListarProvas = class(TIWAppForm)
    VoltarLink: TIWLink;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    Classificacao: TADOQuery;
    Amostras: TADOQuery;
    IWJQueryAmostras: TIWJQueryWidget;
    IWJQueryClassificacao: TIWJQueryWidget;
    IncluirClassificacao: TIWLink;
    EditarClassificacao: TIWLink;
    ExcluirClassificacao: TIWLink;
    AmostrasIDAmostra: TAutoIncField;
    AmostrasIDLote: TIntegerField;
    AmostrasTipoAmostra: TStringField;
    AmostrasEtapaProcesso: TStringField;
    AmostrasQtdeKg: TIntegerField;
    AmostrasDataEntrada: TDateTimeField;
    AmostrasDataDevolutiva: TDateTimeField;
    AmostrasQtdeLote: TIntegerField;
    AmostrasSafra: TStringField;
    AmostrasNomeAssociado: TStringField;
    AmostrasNomeResponsavel: TStringField;
    AmostrasNomePropriedade: TStringField;
    Avaliacao: TADOQuery;
    ClassificacaoIDClassificacao: TAutoIncField;
    ClassificacaoNomeProvador: TStringField;
    ClassificacaoDataProva: TDateTimeField;
    ClassificacaoDefeitos: TIntegerField;
    ClassificacaoColoracao: TStringField;
    ClassificacaoTipo: TStringField;
    ClassificacaoAspecto: TStringField;
    AvaliacaoIDAvaliacao: TAutoIncField;
    AvaliacaoNomeProvador: TStringField;
    AvaliacaoDataAvaliacao: TDateTimeField;
    AvaliacaoTempoTorra: TSmallintField;
    AvaliacaoAroma: TFloatField;
    AvaliacaoUniformidade: TFloatField;
    AvaliacaoXicaraLimpa: TFloatField;
    AvaliacaoDocura: TFloatField;
    AvaliacaoSabor: TFloatField;
    AvaliacaoAcidez: TFloatField;
    AvaliacaoCorpo: TFloatField;
    AvaliacaoRetrogosto: TFloatField;
    AvaliacaoBalanco: TFloatField;
    AvaliacaoGeral: TFloatField;
    AvaliacaoNotaFinal: TFloatField;
    IncluirAvaliacao: TIWLink;
    EditarAvaliacao: TIWLink;
    ExcluirAvaliacao: TIWLink;
    IWJQueryAvaliador: TIWJQueryWidget;
    AmostrasQRCode: TGuidField;
    NaoAvaliadas: TIWCheckBox;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    IWJQueryAvaliacao: TIWJQueryWidget;
    AvaliacaoJson: TMemoField;
    AvaliacaoColoracaoTorra: TFloatField;
    procedure VoltarLinkClick(Sender: TObject);
    function VirgulaPorPonto(S:String):String;
    procedure MyAjaxHandler(EventParams: TStringList);
    procedure IWAppFormCreate(Sender: TObject);
    procedure IncluirClassificacaoClick(Sender: TObject);
    procedure EditarClassificacaoClick(Sender: TObject);
    procedure ExcluirClassificacaoClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure IncluirAvaliacaoClick(Sender: TObject);
    procedure EditarAvaliacaoClick(Sender: TObject);
    procedure NaoAvaliadasAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure ProfileLogoutLinkClick(Sender: TObject);
    procedure ExcluirAvaliacaoClick(Sender: TObject);
  public
    Construido:Boolean;
  end;

implementation

 uses IWAppCache, IWMimeTypes, IW.CacheStream, Windows, UserSessionUnit,
 UnitEditarClassificacao, UnitEditarAvaliacao;

{$R *.dfm}

procedure TIWFormListarProvas.MyAjaxHandler(EventParams: TStringList);
var
 S, xFileName, xURL:String;
 i: Integer;
 Json:TStringList;
begin
 //WebApplication.ShowMessage(EventParams.Values['id']);
 //Verifica quais campos foram filtrados e monta a consulta
 With Classificacao do
 begin
  SQl[sql.count-2]:='where C.IDAmostra='+QuotedStr(EventParams.Values['id']);
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
     WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$(''#classificacao'').DataTable().ajax.url( '+QuotedStr(xURL)+').load();' );
    finally
     Json.Free;
    end;
  end
  else
   WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$(''#classificacao'').DataTable().clear().draw();' );
  Close;
 end;
  //Verifica quais campos foram filtrados e monta a consulta
 With Avaliacao do
 begin
  SQl[sql.count-2]:='where A.IDAmostra='+QuotedStr(EventParams.Values['id']);
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
     WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$(''#avaliacao'').DataTable().ajax.url( '+QuotedStr(xURL)+').load();' );
    finally
     Json.Free;
    end;
  end
  else
   WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$(''#avaliacao'').DataTable().clear().draw();' );
  Close;
 end;
end;

procedure TIWFormListarProvas.NaoAvaliadasAsyncClick(Sender: TObject;
  EventParams: TStringList);
var
 S, xFileName, xURL:String;
 i: Integer;
 Json:TStringList;
begin
 With Amostras do
 begin
  if NaoAvaliadas.Checked then
   SQL[SQL.Count-2]:='where (A.IDAmostra not in (Select IDAmostra from Classificacao) or A.IDAmostra not in (Select IDAmostra from Avaliacao))'
  else
   SQL[SQL.Count-2]:='where A.IDAmostra is not null';
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
     WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$(''#amostras'').DataTable().ajax.url( '+QuotedStr(xURL)+').load();' );
    finally
     Json.Free;
    end;
  end
  else
   WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$(''#amostras'').DataTable().clear().draw();' );
  Close;
 end;
end;

procedure TIWFormListarProvas.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

function TIWFormListarProvas.VirgulaPorPonto(S:String):String;
begin
 S:=StringReplace(S,'.','',[rfReplaceAll]);
 S:=StringReplace(S,',','.',[rfReplaceAll]);
 result:=S;
end;

procedure TIWFormListarProvas.EditarAvaliacaoClick(Sender: TObject);
begin
 if Self.HiddenFields.Values['IDAVALIACAOTOEDIT']<>'' then
 With TIWFormEditarAvaliacao.Create(WebApplication) do
 begin
  Avaliacao.Open;
  if Avaliacao.Locate('IDAvaliacao',StrToInt(Self.HiddenFields.Values['IDAVALIACAOTOEDIT']),[]) then
  begin
   Editando:=true;
   //NotaAromaAsyncChange(NotaAroma,nil); //Atualizar NotaFinal
   //Editar o registro
   Avaliacao.Edit;
   Show;
  end
  else
   WebApplication.ShowMessage('Não há Avaliação a Editar.');
 end
 else
  WebApplication.ShowMessage('Selecione uma Avaliação para editar.');
end;

procedure TIWFormListarProvas.EditarClassificacaoClick(Sender: TObject);
begin
 if Self.HiddenFields.Values['IDCLASSIFICACAOTOEDIT']<>'' then
 With TIWFormEditarClassificacao.Create(WebApplication) do
 begin
  Classificacao.Open;
  if Classificacao.Locate('IDClassificacao',StrToInt(Self.HiddenFields.Values['IDCLASSIFICACAOTOEDIT']),[]) then
  begin
   Editando:=true;
   PercTotal.Text:=ClassificacaoTotal.AsString;
   TipoBebidaComercial.Enabled:=ClassificacaoBebidaComercial.AsBoolean;
   QtdeDefeitos.OnAsyncChange(QtdeDefeitos,nil);
   //Editar o registro
   Classificacao.Edit;
   Show;
  end
  else
   WebApplication.ShowMessage('Não há Classificação a Editar.');
 end
 else
  WebApplication.ShowMessage('Não foi possível editar esta Classificação.');
end;

procedure TIWFormListarProvas.ExcluirAvaliacaoClick(Sender: TObject);
begin
 With TIWUserSession(WebApplication.Data).ADOQuery1 do
 begin
  Sql.Clear;
  SQl.Add('Delete from Avaliacoes');
  Sql.Add('Where IDAvaliacao='+Self.HiddenFields.Values['IDAVALIACAOTOEDIT']);
  Try
   ExecSQl;
   WebApplication.ShowMessage('Avaliacao Excluída com Sucesso.');
  Except
   WebApplication.ShowMessage('Não foi possível excluir esta Avaliação.');
  End;
 end;
end;

procedure TIWFormListarProvas.ExcluirClassificacaoClick(Sender: TObject);
begin
 With TIWUserSession(WebApplication.Data).ADOQuery1 do
 begin
  Sql.Clear;
  SQl.Add('Delete from Classificacoes');
  Sql.Add('Where IDClassificacao='+Self.HiddenFields.Values['IDCLASSIFICACAOTOEDIT']);
  Try
   ExecSQl;
   WebApplication.ShowMessage('Classificação Excluída com Sucesso.');
  Except
   WebApplication.ShowMessage('Não foi possível excluir esta Classificação.');
  End;
 end;
end;

procedure TIWFormListarProvas.IncluirAvaliacaoClick(Sender: TObject);
begin
 With TIWFormEditarAvaliacao.Create(WebApplication) do
 begin
  Editando:=false;
  Avaliacao.Open;
  Avaliacao.Append;
  AvaliacaoIDAmostra.AsString:=Self.HiddenFields.Values['IDAMOSTRATOEDIT'];
  AvaliacaoIDProvador.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
  AvaliacaoColoracaoTorra.Value:=0;
  AvaliacaoAroma.Value:=6;
  AvaliacaoSabor.Value:=6;
  AvaliacaoRetrogosto.Value:=6;
  AvaliacaoAcidez.Value:=6;
  AvaliacaoAcidezIntensidade.Value:=2.5;
  AvaliacaoCorpo.Value:=6;
  AvaliacaoCorpoNivel.Value:=2.5;
  AvaliacaoUniformidade.Value:=0;
  AvaliacaoBalanco.Value:=6;
  AvaliacaoXicaraLimpa.Value:=0;
  AvaliacaoDocura.Value:=0;
  AvaliacaoGeral.Value:=6;
  AvaliacaoXicarasDefeitosLeves.Value:=0;
  AvaliacaoXicarasDefeitosGraves.Value:=0;
  Show;
 end;
end;

procedure TIWFormListarProvas.IncluirClassificacaoClick(Sender: TObject);
begin
 With TIWFormEditarClassificacao.Create(WebApplication) do
 begin
  Editando:=false;
  Classificacao.Open;
  Classificacao.Append;
  ClassificacaoIDAmostra.AsString:=Self.HiddenFields.Values['IDAMOSTRATOEDIT'];
  ClassificacaoIDProvador.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
  TipoBebidaComercial.Enabled:=false;
  Show;
 end;
end;

procedure TIWFormListarProvas.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
 WebApplication.RegisterCallBack('MyAjaxHandler', MyAjaxHandler);
 //Ocultar as amostras do Avaliador - Prova Cega
 IWJQueryAvaliador.Enabled:=TIWUserSession(WebApplication.Data).isAvaliador;
 IWJQueryAmostras.Enabled:=not TIWUserSession(WebApplication.Data).isAvaliador;
 ExcluirClassificacao.Enabled:=not TIWUserSession(WebApplication.Data).isAvaliador;
 ExcluirAvaliacao.Enabled:=not TIWUserSession(WebApplication.Data).isAvaliador;
end;

procedure TIWFormListarProvas.IWAppFormRender(Sender: TObject);
var
 S, xFileName, xURL:String;
 i, variaveis:Integer;
 Json:TStringList;
begin
 WebApplication.RegisterCallBack('MyAjaxHandler', MyAjaxHandler);
 Variaveis:=0;
 //Verifica quais campos foram filtrados e monta a consulta
 With Amostras do
 begin
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
     if IWJQueryAmostras.Enabled then
      IWJQueryAmostras.OnReady.Strings[22]:='   			"ajax": '+QuotedStr(xURL)+','
     else
      IWJQueryAvaliador.OnReady.Strings[22]:='   			"ajax": '+QuotedStr(xURL)+','
    finally
     Json.Free;
    end;
  end
  else
   if IWJQueryAmostras.Enabled then
    IWJQueryAmostras.OnReady.Strings[22]:='/*   			"ajax": */'
   else
      IWJQueryAvaliador.OnReady.Strings[22]:='/*   			"ajax": */';
  Close;
 end;
end;

procedure TIWFormListarProvas.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;



end.
