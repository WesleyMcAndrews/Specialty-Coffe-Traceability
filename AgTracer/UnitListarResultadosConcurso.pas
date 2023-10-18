unit UnitListarResultadosConcurso;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  IWCompJQueryWidget, IWVCLComponent, IWBaseLayoutComponent,
  IWBaseContainerLayout, IWContainerLayout, IWTemplateProcessorHTML,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWHTMLControls, Data.DB, Data.Win.ADODB, IWCompLabel, System.Variants,
  IWCompCheckbox, IWCompEdit, IWCompListbox, IWDBStdCtrls, IWCompButton,
  frxClass, frxDBSet, frxExportPDF, frxExportHTML, IWCompExtCtrls, fs_ipascal;

type
  TIWFormListarResultadosConcurso = class(TIWAppForm)
    VoltarLink: TIWLink;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    IWJQueryConcursos: TIWJQueryWidget;
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
    JuradosConcursoIDJurado: TIntegerField;
    JuradosConcursoNomeJurado: TStringField;
    JuradosConcursoPreSelecao: TBooleanField;
    JuradosConcursoSelecao: TBooleanField;
    JuradosConcursoInstituicao: TStringField;
    JuradosConcursoJuriOficial: TBooleanField;
    JuradosConcursoPercPreSelecao: TMemoField;
    JuradosConcursoPercSelecao: TMemoField;
    Preselecao: TADOQuery;
    Selecao: TADOQuery;
    PreselecaoClassificacao: TLargeintField;
    PreselecaoIDConcurso: TIntegerField;
    PreselecaoIDAmostraConcurso: TIntegerField;
    PreselecaoFaseConcurso: TStringField;
    PreselecaoCategoriaConcurso: TStringField;
    PreselecaoAvaliacoes: TIntegerField;
    PreselecaoColoracaoTorra: TFloatField;
    PreselecaoAroma: TFloatField;
    PreselecaoAromaSeca: TFloatField;
    PreselecaoAromaUmida: TFloatField;
    PreselecaoSabor: TFloatField;
    PreselecaoRetrogosto: TFloatField;
    PreselecaoAcidez: TFloatField;
    PreselecaoAcidezIntensidade: TFloatField;
    PreselecaoCorpo: TFloatField;
    PreselecaoCorpoNivel: TFloatField;
    PreselecaoUniformidade: TFloatField;
    PreselecaoBalanco: TFloatField;
    PreselecaoXicaraLimpa: TFloatField;
    PreselecaoDocura: TFloatField;
    PreselecaoGeral: TFloatField;
    PreselecaoXicarasDefeitosLeves: TFloatField;
    PreselecaoXicarasDefeitosGraves: TFloatField;
    PreselecaoNotaFinal: TFloatField;
    Preselecaojson: TMemoField;
    SelecaoClassificacao: TLargeintField;
    SelecaoIDConcurso: TIntegerField;
    SelecaoIDAmostraConcurso: TIntegerField;
    SelecaoFaseConcurso: TStringField;
    SelecaoCategoriaConcurso: TStringField;
    SelecaoAvaliacoes: TIntegerField;
    SelecaoColoracaoTorra: TFloatField;
    SelecaoAroma: TFloatField;
    SelecaoAromaSeca: TFloatField;
    SelecaoAromaUmida: TFloatField;
    SelecaoSabor: TFloatField;
    SelecaoRetrogosto: TFloatField;
    SelecaoAcidez: TFloatField;
    SelecaoAcidezIntensidade: TFloatField;
    SelecaoCorpo: TFloatField;
    SelecaoCorpoNivel: TFloatField;
    SelecaoUniformidade: TFloatField;
    SelecaoBalanco: TFloatField;
    SelecaoXicaraLimpa: TFloatField;
    SelecaoDocura: TFloatField;
    SelecaoGeral: TFloatField;
    SelecaoXicarasDefeitosLeves: TFloatField;
    SelecaoXicarasDefeitosGraves: TFloatField;
    SelecaoNotaFinal: TFloatField;
    Selecaojson: TMemoField;
    IWJQueryPreSelecao: TIWJQueryWidget;
    IWJQuerySelecao: TIWJQueryWidget;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    PreselecaoNomePropriedade: TStringField;
    PreselecaoVariedadeCafe: TStringField;
    PreselecaoNomeMunicipio: TStringField;
    PreselecaoNomeAssociado: TStringField;
    SelecaoNomePropriedade: TStringField;
    SelecaoVariedadeCafe: TStringField;
    SelecaoNomeMunicipio: TStringField;
    SelecaoNomeAssociado: TStringField;
    ConcursosNomeEdicao: TStringField;
    ConcursosPtsPreSelecao: TIntegerField;
    ConcursosNroPremiadosPorCategoria: TIntegerField;
    frxPDFExport1: TfrxPDFExport;
    ConcursosIDCliente: TIntegerField;
    SelecaoQtdeSacas: TIntegerField;
    procedure VoltarLinkClick(Sender: TObject);
    function VirgulaPorPonto(S:String):String;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
    procedure MyAjaxHandler(EventParams: TStringList);
    procedure ListarResultados(EventParams: TStringList);
    procedure popularComboCategorias(EventParams: TStringList);
    procedure RelatorioFinalAmostra(EventParams: TStringList);
    procedure ListagemAmostras(EventParams: TStringList);
    procedure frxReport1BeforePrint(Sender: TfrxReportComponent);
  public
   NovaSenha:String;
   ArquivoJsonConcurso:String;
   PolarChart, RosaChart: String;
  end;

implementation

 uses IWAppCache, IWMimeTypes, IW.CacheStream, Windows,
 UserSessionUnit, UnitEditarConcurso, UnitEditarJurado, MD5;

{$R *.dfm}

procedure TIWFormListarResultadosConcurso.ListagemAmostras(EventParams: TStringList);
var
  xFileName, xURL :string;
  Row, Column: Integer;
begin
  With Concursos do
  begin
   Close;
   SQl[SQl.count-2]:='and C.IDConcurso='+EventParams.Values['id'];
   Open;
  end;
  if EventParams.Values['fase']='1' then //Pre-seleção
  begin
   frxDBDataset2.DataSet:=Preselecao;
   Preselecao.Open;
  end
  else
  begin
   frxDBDataset2.DataSet:=Selecao;
   Selecao.Open;
  end;
  try
    frxReport1.Report.LoadFromFile(ExtractFilePath(ParamStr(0))+'ListagemAmostras.fr3');
    frxReport1.PrepareReport(true);
    frxPDFExport1.FileName      := GGetWebApplicationThreadVar.UserCacheDir+'resultado.pdf';
    frxPDFExport1.ShowDialog    := false;
    frxPDFExport1.ShowProgress  := False;
    frxReport1.Export(frxPDFExport1);

    xFileName := TIWAppCache.NewTempFileName;
    Windows.CopyFile(PChar(GGetWebApplicationThreadVar.UserCacheDir+'resultado.pdf'), PChar(xFileName), True);
    xURL := TIWAppCache.AddFileToCache(GGetWebApplicationThreadVar(), xFileName, TIWMimeTypes.GetAsString(mtPDF), ctSession);
    AddToInitProc('window.open("'+xURL+'");');
  except
    webapplication.ShowMessage('falha ao exibir relatório');
  end;
  Preselecao.Close;
  Selecao.Close;
  Concursos.Close;
end;


procedure TIWFormListarResultadosConcurso.RelatorioFinalAmostra(EventParams: TStringList);
var
  xFileName, xURL, S, JSON, RosaData:string;
  Report: TStringList;
  Row, Column, I: Integer;
begin
  Json:='var data=[{';
  With Concursos do
  begin
   Close;
   SQl[SQl.count-2]:='and C.IDConcurso='+EventParams.Values['id'];
   Open;
   for I := 0 to Fields.Count-1 do
    if Fields[i].AsString<>'' then
    case Fields[i].DataType of
     ftInteger:
      S:=S+'"'+LowerCase(Fields[i].FieldName)+'":'+'"'+FormatFloat((Fields[i] as TNumericField).DisplayFormat, Fields[i].Value)+'",' ;
     ftFloat:
       S:=S+'"'+LowerCase(Fields[i].FieldName)+'":'+'"'+FormatFloat((Fields[i] as TNumericField).DisplayFormat, Fields[i].Value)+'",' ;
     else
      S:=S+'"'+LowerCase(Fields[i].FieldName)+'":'+'"'+Fields[i].AsString+'",';
    end
    else
     S:=S+'"'+LowerCase(Fields[i].FieldName)+'":'+'"'+Fields[i].AsString+'",';
  end;
  With Selecao do
  begin
   Open;
   Locate('IDAmostraConcurso',StrToInt(EventParams.Values['idamostra']),[]);
   for I := 0 to Fields.Count-1 do
    if Fields[i].AsString<>'' then
    case Fields[i].DataType of
     ftInteger:
      S:=S+'"'+LowerCase(Fields[i].DisplayLabel)+'":'+'"'+FormatFloat((Fields[i] as TNumericField).DisplayFormat, Fields[i].Value)+'",' ;
     ftFloat:
       S:=S+'"'+LowerCase(Fields[i].DisplayLabel)+'":'+'"'+FormatFloat((Fields[i] as TNumericField).DisplayFormat, Fields[i].Value)+'",' ;
     ftMemo: //Json array
      RosaData:='var rosaData = '+Fields[i].AsString+';';
     else
      S:=S+'"'+LowerCase(Fields[i].DisplayLabel)+'":'+'"'+Fields[i].AsString+'",';
    end
    else
     S:=S+'"'+LowerCase(Fields[i].DisplayLabel)+'":'+'"'+Fields[i].AsString+'",';
   S[Length(S)]:='}';//substituir ultima virgula
   Json:=Json+S+'];';
  end;
  StringReplace(s,',','.',[]);
  S:='var polarData = ['+VirgulaPorPonto(SelecaoAroma.AsString)+','+VirgulaPorPonto(SelecaoSabor.AsString)+','+
  VirgulaPorPonto(SelecaoRetrogosto.AsString)+','+VirgulaPorPonto(SelecaoAcidez.AsString)+','+
  VirgulaPorPonto(SelecaoCorpo.AsString)+','+VirgulaPorPonto(SelecaoBalanco.AsString)+','+
  VirgulaPorPonto(SelecaoGeral.AsString)+'];';
  Report:=TStringList.Create;
  Report.LoadFromFile(ExtractFilePath(ParamStr(0))+'resultadoConcurso.html');
  //Adicionar dados
  Report.Strings[35]:=Json;
  Report.Strings[36]:=RosaData;
  Report.Strings[37]:=S;
  {try
    //Armazenar URL dos gráficos nas variáveis
    //PolarChart:=EventParams.Values['polarChart'];
    frxReport1.PrepareReport(true);
    frxPDFExport1.FileName      := GGetWebApplicationThreadVar.UserCacheDir+'resultado.pdf';
    frxPDFExport1.ShowDialog    := false;
    frxPDFExport1.ShowProgress  := False;
    frxReport1.Export(frxPDFExport1);

    xFileName := TIWAppCache.NewTempFileName;
    //Windows.CopyFile(PChar(GGetWebApplicationThreadVar.UserCacheDir+'resultado.pdf'), PChar(xFileName), True);
    Windows.CopyFile(PChar('C:\Sistemas Delphi\AMSC\AMSC\Win32\Debug\resultadoConcurso.html'), PChar(xFileName), True);
    xURL := TIWAppCache.AddFileToCache(GGetWebApplicationThreadVar(), xFileName, TIWMimeTypes.GetAsString(mtHTML), ctSession);
    AddToInitProc('window.open("'+xURL+'");');
  except
    webapplication.ShowMessage('falha ao exibir relatório');
  end;}
  try
    Report.SaveToFile(GGetWebApplicationThreadVar.UserCacheDir+'resultado.html', TEncoding.UTF8);
    xFileName := TIWAppCache.NewTempFileName;
    Windows.CopyFile(PChar(GGetWebApplicationThreadVar.UserCacheDir+'resultado.html'), PChar(xFileName), True);
    xURL := TIWAppCache.AddFileToCache(GGetWebApplicationThreadVar(), xFileName, TIWMimeTypes.GetAsString(mtHTML), ctSession);
    AddToInitProc('window.open("'+xURL+'");');
  except
    webapplication.ShowMessage('falha ao exibir relatório');
  end;
  Report.Free;
  Selecao.Close;
  Concursos.Close;
end;

procedure TIWFormListarResultadosConcurso.frxReport1BeforePrint(
  Sender: TfrxReportComponent);
begin
 if sender is TfrxPictureView then
 begin
  if (Sender as TfrxPictureView).TagStr='logoCliente' then
   (Sender as TfrxPictureView).Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+'wwwroot\assets\img\'+IntToStr(TIWUserSession(WebApplication.Data).IDCliente)+'.png');
 end;
end;

procedure TIWFormListarResultadosConcurso.ListarResultados(EventParams: TStringList);
var
 S, xFileName, xURL:String;
 i: Integer;
 Json:TStringList;
begin
 WebApplication.CallBackResponse.AddJavaScriptToExecute('ShowBusy(true);'); //Show Intraweb Loading Animation
 //Resultados Pre-Selecao
 With Preselecao do
 begin
  SQl[sql.count-5]:='where R.IDConcurso='+EventParams.Values['id'];
  SQl[sql.count-3]:='and R.CategoriaConcurso='+QuotedStr(EventParams.Values['categoria']);
  SQl[sql.count-2]:='and R.IDAmostraConcurso is not null';
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
         S:=S+'"'+Fields[i].DisplayLabel+'":'+'"'+FormatFloat((Fields[i] as TNumericField).DisplayFormat, Fields[i].Value)+'",' ;
        ftFloat:
          S:=S+'"'+Fields[i].DisplayLabel+'":'+'"'+FormatFloat((Fields[i] as TNumericField).DisplayFormat, Fields[i].Value)+'",' ;
        ftMemo: //Json array
         S:=S+'"'+Fields[i].DisplayLabel+'":'+Fields[i].AsString+',';
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
     WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$("#preselecao").DataTable().ajax.url( '+QuotedStr(xURL)+').load();' );
    finally
     Json.Free;
    end;
  end
  else
   WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$("#preselecao").DataTable().clear().draw();' );
  Close;
 end;
 //Resultados Seleção
 With Selecao do
 begin
  SQl[sql.count-5]:='where R.IDConcurso='+EventParams.Values['id'];
  SQl[sql.count-3]:='and R.CategoriaConcurso='+QuotedStr(EventParams.Values['categoria']);
  SQl[sql.count-2]:='and R.IDAmostraConcurso is not null';
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
         S:=S+'"'+Fields[i].DisplayLabel+'":'+'"'+FormatFloat((Fields[i] as TNumericField).DisplayFormat, Fields[i].Value)+'",' ;
        ftFloat:
          S:=S+'"'+Fields[i].DisplayLabel+'":'+'"'+FormatFloat((Fields[i] as TNumericField).DisplayFormat, Fields[i].Value)+'",' ;
        ftMemo: //Json array
         S:=S+'"'+Fields[i].DisplayLabel+'":'+Fields[i].AsString+',';
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
     WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$("#selecao").DataTable().ajax.url( '+QuotedStr(xURL)+').load();' );
    finally
     Json.Free;
    end;
  end
  else
   WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$("#selecao").DataTable().clear().draw();' );
  Close;
 end;
 WebApplication.CallBackResponse.AddJavaScriptToExecute('$("#RESULTADOSDIV").show();');//Exibir o DIV
 WebApplication.CallBackResponse.AddJavaScriptToExecute('ShowBusy(false);'); //Hide Intraweb Loading Animation
end;

procedure TIWFormListarResultadosConcurso.popularComboCategorias(EventParams: TStringList);
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
 WebApplication.CallBackResponse.AddJavaScriptToExecute('$("#COMBOCATEGORIAS").attr("names","'+S+'"); resultados.encherComboCategorias();');
end;

procedure TIWFormListarResultadosConcurso.MyAjaxHandler(EventParams: TStringList);
var
 S, xFileName, xURL:String;
 i: Integer;
 Json:TStringList;
begin
 //Acompanhamento da Votação por Jurado
 With JuradosConcurso do
 begin
  SQl[sql.count-2]:='where JC.IDConcurso='+QuotedStr(EventParams.Values['id']);
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
     WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$("#jurados").DataTable().ajax.url( '+QuotedStr(xURL)+').load();' );
     //WebApplication.CallBackResponse.AddJavaScriptToExecute(  'alert( '+QuotedStr(xURL)+');' );
    finally
     Json.Free;
    end;
    WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$("#CATEGORIASDIV").show();' );
  end
  else
   WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$("#jurados").DataTable().clear().draw();' );
  Close;
 end;
 WebApplication.CallBackResponse.AddJavaScriptToExecute('ShowBusy(false);'); //Hide Intraweb Loading Animation
end;


function TIWFormListarResultadosConcurso.VirgulaPorPonto(S:String):String;
begin
 S:=StringReplace(S,'.','',[rfReplaceAll]);
 S:=StringReplace(S,',','.',[rfReplaceAll]);
 result:=S;
end;

procedure TIWFormListarResultadosConcurso.IWAppFormCreate(Sender: TObject);
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
 WebApplication.RegisterCallBack('ListarResultados', ListarResultados);
 WebApplication.RegisterCallBack('popularComboCategorias', popularComboCategorias);
 WebApplication.RegisterCallBack('RelatorioFinalAmostra', RelatorioFinalAmostra);
 WebApplication.RegisterCallBack('ListagemAmostras', ListagemAmostras);
end;

procedure TIWFormListarResultadosConcurso.IWAppFormRender(Sender: TObject);
var
 S, xFileName, xURL:String;
 i :Integer;
 Json:TStringList;
begin
 //Verifica quais campos foram filtrados e monta a consulta
 With Concursos do
 begin
  SQl[SQl.Count-3]:='Where C.IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente);
  SQl[SQl.Count-2]:='and C.IDConcurso is not null';
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
     IWJQueryConcursos.OnReady.Strings[2]:='   			"ajax": '+QuotedStr(xURL)+',';
    finally
     Json.Free;
    end;
  end
  else
   IWJQueryConcursos.OnReady.Strings[2]:='/*   			"ajax": */';
  Close;
 end;
end;

procedure TIWFormListarResultadosConcurso.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

procedure TIWFormListarResultadosConcurso.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;


end.
