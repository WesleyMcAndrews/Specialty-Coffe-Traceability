unit UnitListarPropriedades;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  IWCompJQueryWidget, IWVCLComponent, IWBaseLayoutComponent,
  IWBaseContainerLayout, IWContainerLayout, IWTemplateProcessorHTML,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWHTMLControls, Data.DB, Data.Win.ADODB, IWBaseComponent, IWBaseHTMLComponent,
  IWBaseHTML40Component, IWCompExtCtrls, Vcl.Forms, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion, IWCompLabel;

type
  TIWFormListarPropriedades = class(TIWAppForm)
    VoltarLink: TIWLink;
    IncluirPropriedade: TIWLink;
    EditarPropriedade: TIWLink;
    ExcluirPropriedade: TIWLink;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    Propriedades: TADOQuery;
    PropriedadesIDPropriedade: TStringField;
    PropriedadesNomePropriedade: TStringField;
    PropriedadesNomeMunicipio: TStringField;
    PropriedadesNomeAssociado: TStringField;
    Premios: TADOQuery;
    Talhoes: TADOQuery;
    PremiosSafra: TStringField;
    PremiosPremio: TStringField;
    TalhoesIDTalhao: TAutoIncField;
    TalhoesNomeTalhao: TStringField;
    TalhoesIrrigado: TBooleanField;
    IWJQueryPropriedades: TIWJQueryWidget;
    IWJQueryPremios: TIWJQueryWidget;
    IWJQueryTalhoes: TIWJQueryWidget;
    IncluirPremio: TIWLink;
    EditarPremio: TIWLink;
    ExcluirPremio: TIWLink;
    EditarTalhoes: TIWLink;
    PremiosIDPremio: TAutoIncField;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    TalhoesArea: TFloatField;
    PropriedadesArea: TFloatField;
    procedure IncluirPropriedadeClick(Sender: TObject);
    procedure VoltarLinkClick(Sender: TObject);
    function VirgulaPorPonto(S:String):String;
    procedure IWAppFormRender(Sender: TObject);
    procedure EditarPropriedadeClick(Sender: TObject);
    procedure MyAjaxHandler(EventParams: TStringList);
    procedure IWAppFormCreate(Sender: TObject);
    procedure EditarTalhoesClick(Sender: TObject);
    procedure ExcluirPremioClick(Sender: TObject);
    procedure IncluirPremioClick(Sender: TObject);
    procedure EditarPremioClick(Sender: TObject);
    procedure ExcluirPropriedadeClick(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
  public
  end;

implementation

 uses IWAppCache, IWMimeTypes, IW.CacheStream, Windows, UserSessionUnit,
 UnitEditarPropriedade, UnitEditarTalhoes, UnitEditarPremio;

{$R *.dfm}

procedure TIWFormListarPropriedades.MyAjaxHandler(EventParams: TStringList);
var
 S, xFileName, xURL:String;
 i: Integer;
 Json:TStringList;
begin
 //WebApplication.ShowMessage(EventParams.Values['id']);
 //Verifica quais campos foram filtrados e monta a consulta
 With Premios do
 begin
  SQl[sql.count-2]:='where IDPropriedade='+QuotedStr(EventParams.Values['id']);
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
     WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$(''#premios'').DataTable().ajax.url( '+QuotedStr(xURL)+').load();' );
     //WebApplication.CallBackResponse.AddJavaScriptToExecute(  'alert( '+QuotedStr(xURL)+');' );
    finally
     Json.Free;
    end;
  end
  else
   WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$(''#premios'').DataTable().clear().draw();' );
  Close;
 end;
 //Verifica quais campos foram filtrados e monta a consulta
 With Talhoes do
 begin
  SQl[sql.count-2]:='where IDPropriedade='+QuotedStr(EventParams.Values['id']);
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
     WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$(''#talhoes'').DataTable().ajax.url( '+QuotedStr(xURL)+').load();' );
     //WebApplication.CallBackResponse.AddJavaScriptToExecute(  'alert( '+QuotedStr(xURL)+');' );
    finally
     Json.Free;
    end;
  end
  else
   WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$(''#talhoes'').DataTable().clear().draw();' );
  Close;
 end;
 WebApplication.CallBackResponse.AddJavaScriptToExecute('ShowBusy(false);'); //Hide Intraweb Loading Animation
end;

procedure TIWFormListarPropriedades.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

function TIWFormListarPropriedades.VirgulaPorPonto(S:String):String;
begin
 S:=StringReplace(S,'.','',[rfReplaceAll]);
 S:=StringReplace(S,',','.',[rfReplaceAll]);
 result:=S;
end;


procedure TIWFormListarPropriedades.EditarPremioClick(Sender: TObject);
begin
 if Self.HiddenFields.Values['IDPREMIOTOEDIT']<>'' then
 With TIWFormEditarPremio.Create(WebApplication) do
 begin
  Premios.Open;
  if Premios.Locate('IDPremio',StrToInt(Self.HiddenFields.Values['IDPREMIOTOEDIT']),[]) then
  begin
   Editando:=true;
   //Editar o registro
   Premios.Edit;
   Show;
  end
  else
   WebApplication.ShowMessage('Não foi possível editar este prêmio.');
 end
 else
  WebApplication.ShowMessage('Selecione um prêmio para editar.');
end;

procedure TIWFormListarPropriedades.EditarPropriedadeClick(Sender: TObject);
begin
 if Self.HiddenFields.Values['IdToEdit']<>'' then
 With TIWFormEditarPropriedade.Create(WebApplication) do
 begin
  Municipios.Open;//Exibir Município
  Propriedades.Open;
  Usuarios.Open; //Exibir usuários do cadastro e edição
  if Propriedades.Locate('IDPropriedade',Self.HiddenFields.Values['IdToEdit'],[]) then
  begin
   Editando:=true;
   //Exibir municípios da uf cadastrada
   With Municipios do
   begin
    Close;
    SQL[SQL.Count-2]:='where UF='+QuotedStr(PropriedadesUF.AsString);
    Open;
   end;
   //Editar o registro
   Propriedades.Edit;
   Show;
  end
  else
   WebApplication.ShowMessage('Não foi possível editar este registro.');
 end
 else
  WebApplication.ShowMessage('Selecione um registro para editar.');
end;

procedure TIWFormListarPropriedades.EditarTalhoesClick(Sender: TObject);
var
 S, SQL:String;
begin
 With TIWFormEditarTalhoes.Create(WebApplication) do
 begin

  mIDPropriedade:=Self.HiddenFields.Values['IdToEdit'];
  SQL:='Select * from Talhoes '+
       'where IDPropriedade='+QuotedStr(Self.HiddenFields.Values['IdToEdit']);
  Talhoes.CommandText:=SQL;
  Talhoes.Open;
  Show;
 end;
 {if Self.HiddenFields.Values['IDTALHAOTOEDIT']<>'' then
 With TIWFormEditarTalhoes.Create(WebApplication) do
 begin
  Talhoes.Open;
  if Talhoes.Locate('IDTalhao',StrToInt(Self.HiddenFields.Values['IDTALHAOTOEDIT']),[]) then
  begin
   //Carregar o polígono cadastrado
   Poligono.Open;
   if PoligonoPoligono.AsString<>'' then
    WKT.Text:=PoligonoPoligono.AsString;
   Editando:=true;
   //Variedades do talhão a editar
   with VariedadesTalhao do
   begin
    Open;
    if RecordCount>0 then
    begin
     while not eof do
     begin
      S:=S+'"'+VariedadesTalhaoIDVariedade.AsString+'",';
      Next;
     end;
     Close;
     System.delete(S,Length(S),1);//Remover última vírgula
     AddToInitProc('$("#MULTICOMBOVARIEDADES").val(['+S+']).trigger("change");');//Setar Multicombo
    end;
   end;
   //Editar o registro
   Talhoes.Edit;
   Show;
  end
  else
   WebApplication.ShowMessage('Não foi possível editar este talhão.');
 end
 else
  WebApplication.ShowMessage(Self.HiddenFields.Values['IdTalhaoToEdit']);}
end;

procedure TIWFormListarPropriedades.ExcluirPremioClick(Sender: TObject);
begin
 With TIWUserSession(WebApplication.Data).ADOQuery1 do
 begin
  Sql.Clear;
  SQl.Add('Delete from PremiosPropriedades');
  Sql.Add('Where IDPremio='+Self.HiddenFields.Values['IdPremioToEdit']);
  Try
   ExecSQl;
   WebApplication.ShowMessage('Premio Excluído com Sucesso.');
  Except
   WebApplication.ShowMessage('Não foi possível excluir este Prêmio.');
  End;
 end;
end;

procedure TIWFormListarPropriedades.ExcluirPropriedadeClick(Sender: TObject);
begin
 With TIWUserSession(WebApplication.Data).ADOQuery1 do
 begin
  Sql.Clear;
  SQl.Add('Delete from Propriedades');
  Sql.Add('Where IDPropriedade='+QuotedStr(Self.HiddenFields.Values['IdToEdit']));
  Try
   ExecSQl;
   WebApplication.ShowMessage('Propriedade Excluída com Sucesso.');
  Except
   WebApplication.ShowMessage('Para excluir esta Propriedade, exclua primeiro os Talhões, Prêmios e Lotes de Amostras.');
  End;
 end;
end;

procedure TIWFormListarPropriedades.IncluirPremioClick(Sender: TObject);
begin
 With TIWFormEditarPremio.Create(WebApplication) do
 begin
  Editando:=false;
  Premios.Open;
  Premios.Append;
  PremiosIDPropriedade.AsString:=Self.HiddenFields.Values['IdToEdit'];
  Show;
 end;
end;

procedure TIWFormListarPropriedades.IncluirPropriedadeClick(Sender: TObject);
begin
 //TIWUserSession(WebApplication.Data).EditarPropriedade:=0;
 With TIWFormEditarPropriedade.Create(WebApplication) do
 begin
  Propriedades.Open;
  Editando:=false;
  Propriedades.Append;
  Show;
 end;
end;

procedure TIWFormListarPropriedades.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
 WebApplication.RegisterCallBack('MyAjaxHandler', MyAjaxHandler);
end;

procedure TIWFormListarPropriedades.IWAppFormRender(Sender: TObject);
var
 S, xFileName, xURL:String;
 i, variaveis:Integer;
 Json:TStringList;
begin
 Variaveis:=0;
 //Verifica quais campos foram filtrados e monta a consulta
 With Propriedades do
 begin
  SQl[Sql.Count-2]:='where A.IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente);
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
     IWJQueryPropriedades.OnReady.Strings[2]:='   			"ajax": '+QuotedStr(xURL)+',';
    finally
     Json.Free;
    end;
  end
  else
   IWJQueryPropriedades.OnReady.Strings[2]:='/*   			"ajax": */';
  Close;
 end;
end;


procedure TIWFormListarPropriedades.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;



end.
