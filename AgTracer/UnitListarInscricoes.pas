unit UnitListarInscricoes;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  IWCompJQueryWidget, IWVCLComponent, IWBaseLayoutComponent,
  IWBaseContainerLayout, IWContainerLayout, IWTemplateProcessorHTML,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWHTMLControls, Data.DB, Data.Win.ADODB, IWBaseComponent, IWBaseHTMLComponent,
  IWBaseHTML40Component, IWCompExtCtrls, Vcl.Forms, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion, IWCompLabel,
  frxClass, frxExportPDF, frxDBSet, DelphiZXIngQRCode, Vcl.Graphics;

type
  TIWFormListarInscricoes = class(TIWAppForm)
    VoltarLink: TIWLink;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    Amostras: TADOQuery;
    IWJQueryConcursos: TIWJQueryWidget;
    IWJQueryAmostras: TIWJQueryWidget;
    IncluirAmostra: TIWLink;
    EditarAmostra: TIWLink;
    ExcluirAmostra: TIWLink;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    Concursos: TADOQuery;
    ConcursosIDConcurso: TAutoIncField;
    ConcursosNomeConcurso: TStringField;
    ConcursosCategorias: TStringField;
    ConcursosArquivoRegulamento: TStringField;
    ConcursosDtPremiacao: TDateTimeField;
    ConcursosFaseAtual: TStringField;
    AmostrasIDAmostraConcurso: TAutoIncField;
    AmostrasNomeAssociado: TStringField;
    AmostrasNomePropriedade: TStringField;
    AmostrasNomeMunicipio: TStringField;
    AmostrasCategoriaConcurso: TStringField;
    AmostrasVariedadeCafe: TStringField;
    AmostrasQtdeSacas: TIntegerField;
    AmostrasDataCadastro: TDateTimeField;
    AmostrasStatus: TStringField;
    frxReport1: TfrxReport;
    ConcursoDataSet: TfrxDBDataset;
    AmostrasDataSet: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    ConcursosNomeEdicao: TStringField;
    AmostrasQRCODE: TGuidField;
    procedure VoltarLinkClick(Sender: TObject);
    function VirgulaPorPonto(S:String):String;
    procedure MyAjaxHandler(EventParams: TStringList);
    procedure ImprimirInscricao(EventParams: TStringList);
    procedure IWAppFormCreate(Sender: TObject);
    procedure IncluirAmostraClick(Sender: TObject);
    procedure EditarAmostraClick(Sender: TObject);
    procedure ExcluirAmostraClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
    procedure frxReport1BeforePrint(Sender: TfrxReportComponent);
  public
    QRCodeBitmap: Vcl.Graphics.TBitmap;
    Construido:Boolean;
  end;

implementation

 uses IWAppCache, IWMimeTypes, IW.CacheStream, Windows, UserSessionUnit,
 UnitEditarInscricao;

{$R *.dfm}

procedure TIWFormListarInscricoes.ImprimirInscricao(EventParams: TStringList);
var
  xFileName, xURL:string;
  QRCode: TDelphiZXingQRCode;
  Row, Column: Integer;
begin
  Concursos.SQl[Concursos.sql.count-2]:='and C.IDConcurso='+EventParams.Values['concurso'];
  Concursos.Open;
  Amostras.SQl[Amostras.sql.count-2]:='and C.IDAmostraConcurso='+EventParams.Values['amostra'];
  Amostras.Open;
  try
    //Gerar QRCODE
    QRCodeBitmap := Vcl.Graphics.TBitmap.Create;
    QRCode := TDelphiZXingQRCode.Create;
    try
      QRCode.Data := 'http://sistema.amsc.com.br/$/?act=eval&qr='+AmostrasQRCODE.AsString;
      //Auto, Numeric, Alphanumeric, ISO-8859-1, UTF-8 without BOM, UTF-8 with BOM
      QRCode.Encoding := qrAuto;
      QRCode.QuietZone := 4;
      //QRCodeBitmap.Width:=QRCode.Rows;
      //QRCodeBitmap.Height:=QRCode.Columns;
      QRCodeBitmap.SetSize(QRCode.Rows, QRCode.Columns);
      for Row := 0 to QRCode.Rows - 1 do
      begin
        for Column := 0 to QRCode.Columns - 1 do
        begin
          if (QRCode.IsBlack[Row, Column]) then
          begin
            QRCodeBitmap.Canvas.Pixels[Column, Row] := clBlack;
          end else
          begin
            QRCodeBitmap.Canvas.Pixels[Column, Row] := clWhite;
          end;
        end;
      end;
    finally
      QRCode.Free;
    end;
    frxReport1.PrepareReport(true);
    frxPDFExport1.FileName      := GGetWebApplicationThreadVar.UserCacheDir+'inscricao.pdf';
    frxPDFExport1.ShowDialog    := false;
    frxPDFExport1.ShowProgress  := False;
    frxReport1.Export(frxPDFExport1);
    xFileName := TIWAppCache.NewTempFileName;
    Windows.CopyFile(PChar(GGetWebApplicationThreadVar.UserCacheDir+'inscricao.pdf'), PChar(xFileName), True);
    xURL := TIWAppCache.AddFileToCache(Self, xFileName,TIWMimeTypes.GetAsString(mtPDF), ctSession);
    AddToInitProc('window.open("'+xURL+'");');
    QRCodeBitmap.Free;
  except
    webapplication.ShowMessage('falha ao exibir relatório');
  end;
  Concursos.Close;
  Amostras.Close;
end;

procedure TIWFormListarInscricoes.frxReport1BeforePrint(
  Sender: TfrxReportComponent);
 var
  Scale: Double;
begin
 if sender is TfrxPictureView then
 begin
  //Exibir QRCODE
  if (Sender as TfrxPictureView).TagStr='qr' then
   (Sender as TfrxPictureView).Picture.Bitmap:=QRCodeBitmap;
  //Exibir Logo
  {if (Sender as TfrxPictureView).TagStr='logo' then
   (Sender as TfrxPictureView).Picture.LoadFromFile(ExtractFilePath(ParamStr(0))+'clientes/'+IntToStr(TIWUserSession(WebApplication.Data).IDCliente)+'.png');}
 end;
end;

procedure TIWFormListarInscricoes.MyAjaxHandler(EventParams: TStringList);
var
 S, xFileName, xURL:String;
 i: Integer;
 Json:TStringList;
begin
 //WebApplication.ShowMessage(EventParams.Values['id']);
 //Verifica quais campos foram filtrados e monta a consulta
 With Amostras do
 begin
  SQl[sql.count-3]:='where C.IDConcurso='+EventParams.Values['id'];
  SQl[sql.count-2]:='and C.IDAmostraConcurso is not null';
  Open;
  if RecordCount>0 then
  begin
    Json:=TStringList.Create;
    Json.Clear;
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
         ftDateTime:
           S:=S+'"'+Fields[i].DisplayLabel+'":'+'"'+FormatDateTime((Fields[i] as TDateTimeField).DisplayFormat, Fields[i].Value)+'",' ;
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
     WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$(''#amostras'').DataTable().ajax.url( '+QuotedStr(xURL)+').load();' );
    finally
     Json.Free;
    end;
  end
  else
   WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$(''#amostras'').DataTable().clear().draw();' );
  Close;
 end;
 WebApplication.CallBackResponse.AddJavaScriptToExecute('ShowBusy(false);'); //Hide Intraweb Loading Animation
end;

procedure TIWFormListarInscricoes.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

function TIWFormListarInscricoes.VirgulaPorPonto(S:String):String;
begin
 S:=StringReplace(S,'.','',[rfReplaceAll]);
 S:=StringReplace(S,',','.',[rfReplaceAll]);
 result:=S;
end;

procedure TIWFormListarInscricoes.EditarAmostraClick(Sender: TObject);
var
 ListaCategorias:TStringList;
 S:String;
 i:Integer;
begin
 if Self.HiddenFields.Values['IdAmostraToEdit']<>'' then
 With TIWFormEditarInscricao.Create(WebApplication) do
 begin
  //Passa a lista de categorias do concurso
  //Separar Categorias em uma StringList
  ListaCategorias:=TStringList.Create;
  ListaCategorias.Delimiter:=',';
  ListaCategorias.StrictDelimiter:=true;
  ListaCategorias.DelimitedText:=Self.HiddenFields.Values['Categorias'];
  //Preencher Combo Categoria
  S:='names=[';
  For I:=0 to ListaCategorias.Count-1 do
   S:=S+'{''id'':'''+ListaCategorias[I]+''',''text'':'''+ListaCategorias[I]+'''},';
  S[length(S)]:=']'; //Substitui ultima virgula por ']'
  ComboCategoria.ExtraTagParams.Add(S);

  Municipios.Open;//Exibir Município
  Amostras.Open;
  Usuarios.Open; //Exibir usuários do cadastro e edição
  if Amostras.Locate('IDAmostraConcurso',Self.HiddenFields.Values['IdAmostraToEdit'],[]) then
  begin
   Editando:=true;
   //Exibir municípios da uf cadastrada
   With Municipios do
   begin
    Close;
    SQL[SQL.Count-2]:='where UF='+QuotedStr(AmostrasUF.AsString);
    Open;
   end;
   //Editar o registro
   Amostras.Edit;
   Show;
  end
  else
   WebApplication.ShowMessage('Não foi possível editar este registro.');
 end
 else
  WebApplication.ShowMessage('Selecione um registro para editar.');
end;

procedure TIWFormListarInscricoes.ExcluirAmostraClick(Sender: TObject);
begin
 With TIWUserSession(WebApplication.Data).ADOQuery1 do
 begin
  Sql.Clear;
  SQl.Add('Delete from ConcursoAmostras');
  Sql.Add('Where IDAmostraConcurso='+Self.HiddenFields.Values['IdAmostraToEdit']);
  Try
   ExecSQl;
   WebApplication.ShowMessage('Amostra excluída com sucesso.');
  Except
   WebApplication.ShowMessage('Para excluir esta Amostra, exclua suas Avaliações.');
  End;
 end;
end;

procedure TIWFormListarInscricoes.IncluirAmostraClick(Sender: TObject);
var
 ListaCategorias:TStringList;
 S:String;
 i:Integer;
begin
 //TIWUserSession(WebApplication.Data).EditarPropriedade:=0;
 With TIWFormEditarInscricao.Create(WebApplication) do
 begin
  //Passa a lista de categorias do concurso
  //Separar Categorias em uma StringList
  ListaCategorias:=TStringList.Create;
  ListaCategorias.Delimiter:=',';
  ListaCategorias.StrictDelimiter:=true;
  ListaCategorias.DelimitedText:=Self.HiddenFields.Values['Categorias'];
  //Preencher Combo Categoria
  S:='names=[';
  For I:=0 to ListaCategorias.Count-1 do
   S:=S+'{''id'':'''+ListaCategorias[I]+''',''text'':'''+ListaCategorias[I]+'''},';
  S[length(S)]:=']'; //Substitui ultima virgula por ']'
  ComboCategoria.ExtraTagParams.Add(S);
  //Append
  Amostras.Open;
  Editando:=false;
  Amostras.Append;
  AmostrasIDConcurso.Value:=StrToInt(Self.HiddenFields.Values['IdToEdit']);
  Show;
 end;
end;

procedure TIWFormListarInscricoes.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
 WebApplication.RegisterCallBack('MyAjaxHandler', MyAjaxHandler);
 WebApplication.RegisterCallBack('ImprimirInscricao', ImprimirInscricao);
end;

procedure TIWFormListarInscricoes.IWAppFormRender(Sender: TObject);
var
 S, xFileName, xURL:String;
 i, variaveis:Integer;
 Json:TStringList;
begin
 WebApplication.RegisterCallBack('MyAjaxHandler', MyAjaxHandler);
 Variaveis:=0;
 //Verifica quais campos foram filtrados e monta a consulta
 With Concursos do
 begin
  SQl[sql.count-3]:='where C.IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente);
  SQl[sql.count-2]:='and C.IDConcurso is not null';
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

procedure TIWFormListarInscricoes.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;



end.
