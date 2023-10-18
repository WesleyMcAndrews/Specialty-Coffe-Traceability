unit UnitListarAvaliacoesConcurso;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  IWCompJQueryWidget, IWVCLComponent, IWBaseLayoutComponent,
  IWBaseContainerLayout, IWContainerLayout, IWTemplateProcessorHTML,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWHTMLControls, Data.DB, Data.Win.ADODB, IWBaseComponent, IWBaseHTMLComponent,
  IWBaseHTML40Component, IWCompExtCtrls, Vcl.Forms, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion, IWCompLabel,
  IWCompEdit, IWCompButton, IWDBStdCtrls;

type
  TIWFormListarAvaliacoesConcurso = class(TIWAppForm)
    SairLink: TIWLink;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    Concurso: TADOQuery;
    IWJQueryAmostras: TIWJQueryWidget;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    Amostras: TADOQuery;
    ConcursoIDConcurso: TAutoIncField;
    ConcursoNomeConcurso: TStringField;
    ConcursoNomeEdicao: TStringField;
    ConcursoPtsPreSelecao: TIntegerField;
    ConcursoCategoriaAvaliacao: TStringField;
    ConcursoFaseAtual: TStringField;
    NomeConcurso: TIWDBEdit;
    NomeEdicao: TIWDBEdit;
    FaseAtual: TIWDBEdit;
    CategoriaAvaliacao: TIWDBEdit;
    PtsPreSelecao: TIWDBEdit;
    ConcursoSrc: TDataSource;
    AmostrasIDAmostraConcurso: TAutoIncField;
    AmostrasCategoriaConcurso: TStringField;
    AmostrasDataAvaliacao: TDateTimeField;
    AmostrasAroma: TFloatField;
    AmostrasSabor: TFloatField;
    AmostrasRetrogosto: TFloatField;
    AmostrasAcidez: TFloatField;
    AmostrasCorpo: TFloatField;
    AmostrasUniformidade: TFloatField;
    AmostrasBalanco: TFloatField;
    AmostrasXicaraLimpa: TFloatField;
    AmostrasDocura: TFloatField;
    AmostrasGeral: TFloatField;
    AmostrasXicarasDefeitosLeves: TFloatField;
    AmostrasXicarasDefeitosGraves: TFloatField;
    AmostrasNotaFinal: TFloatField;
    AmostrasAvaliada: TIntegerField;
    AmostrasJson: TMemoField;
    AmostrasQRCODE: TGuidField;
    procedure SairLinkClick(Sender: TObject);
    function VirgulaPorPonto(S:String):String;
    procedure IWAppFormCreate(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure avaliarAmostra(EventParams: TStringList);
  public
  end;

implementation

 uses IWAppCache, IWMimeTypes, IW.CacheStream, Windows, UserSessionUnit,
 UnitEditarAvaliacaoConcurso;

{$R *.dfm}


procedure TIWFormListarAvaliacoesConcurso.avaliarAmostra(EventParams: TStringList);
begin
 //WebApplication.ShowMessage('Amostra ID='+EventParams.Values['id']);
 With TIWFormEditarAvaliacaoConcurso.Create(WebApplication) do
 begin
  with Avaliacao do
  begin
   CommandText:='Select * from ConcursoAvaliacoes'+
   ' Where IDConcurso='+ConcursoIDConcurso.AsString+
   ' and IDJurado='+IntToStr(TIWUserSession(WebApplication.Data).UsuarioAtivo)+
   ' and FaseConcurso='+QuotedStr(ConcursoFaseAtual.AsString);
   Open;
   if EventParams.Values['editar']='false' then
   begin
    Editando:=false;
    Append;
    AvaliacaoIDConcurso.Value:=ConcursoIDConcurso.Value;
    AvaliacaoIDJurado.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
    AvaliacaoFaseConcurso.asString:=ConcursoFaseAtual.AsString;
    AvaliacaoIDAmostraConcurso.value:=StrToInt(EventParams.Values['id']);
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
   end
   else
   begin
    if Locate('IDAmostraConcurso',StrToInt(EventParams.Values['id']),[]) then
    begin
     Editando:=true;
     Edit;
    end
    else
     WebApplication.ShowMessage('Não foi possível exibir avaliação da amostra');
   end;
  end;
  IDAmostra.Text:=formatFloat('0000',StrToInt(EventParams.Values['id']));
  Fase.Text:=ConcursoFaseAtual.Text;
  Categoria.Text:=ConcursoCategoriaAvaliacao.AsString;
  Show;
 end;
end;

procedure TIWFormListarAvaliacoesConcurso.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

function TIWFormListarAvaliacoesConcurso.VirgulaPorPonto(S:String):String;
begin
 S:=StringReplace(S,'.','',[rfReplaceAll]);
 S:=StringReplace(S,',','.',[rfReplaceAll]);
 result:=S;
end;


procedure TIWFormListarAvaliacoesConcurso.IWAppFormCreate(Sender: TObject);
begin
 With Concurso do
 begin
  SQl[SQl.Count-5]:='where C.IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente);
  Open;
 end;
 //Nome do usuário Logado
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
 //Registrar Callback
 WebApplication.RegisterCallBack('avaliarAmostra', avaliarAmostra);
end;

procedure TIWFormListarAvaliacoesConcurso.IWAppFormRender(Sender: TObject);
var
 S, xFileName, xURL:String;
 i:Integer;
 Json:TStringList;
begin
 //Verifica quais campos foram filtrados e monta a consulta
 With Amostras do
 begin
  SQl.Clear;
  if ConcursoFaseAtual.AsString='Pré-seleção' then
  begin
   SQL.Add('Select CA.IDAmostraConcurso, CA.CategoriaConcurso, CA.QRCODE,');
   SQL.Add('A.DataAvaliacao, A.Aroma, A.Sabor, A.Retrogosto, A.Acidez, A.Corpo, A.Uniformidade, A.Balanco,');
   SQL.Add('A.XicaraLimpa, A.Docura, A.Geral, A.XicarasDefeitosLeves, A.XicarasDefeitosGraves,');
   SQL.Add('(A.Aroma+A.Sabor+A.Retrogosto+A.Acidez+A.Corpo+(A.Uniformidade*2)+A.Balanco+(A.XicaraLimpa*2)+(A.Docura*2)+A.Geral)-(A.XicarasDefeitosLeves*2)-(A.XicarasDefeitosGraves*4) as NotaFinal,');
   SQL.Add('case when A.DataAvaliacao is null then 0 else 1 end as Avaliada, R.Json');
   SQL.Add('from concursoAmostras CA');
   SQL.Add('left join ConcursoAvaliacoes A on A.IDConcurso=CA.IDConcurso and A.IDAmostraConcurso=CA.IDAmostraConcurso');
   SQL.Add('and FaseConcurso='+QuotedStr(ConcursoFaseAtual.AsString));
   SQL.Add('and A.IDJurado='+IntToStr(TIWUserSession(WebApplication.Data).UsuarioAtivo));
   SQL.Add('left Join ConcursoRosasSabores R on R.IDAvaliacaoConcurso=A.IDAvaliacaoConcurso');
   SQL.Add('where CA.IDConcurso='+ConcursoIDConcurso.AsString);
   SQL.Add('and CA.CategoriaConcurso='+QuotedStr(ConcursoCategoriaAvaliacao.AsString));
   SQL.Add('and CA.Status=''Classificada''');
   SQL.Add('order by NotaFinal Desc, CA.IDAmostraConcurso');
  end
  else
  if ConcursoFaseAtual.AsString='Seleção' then
  begin
   SQL.Add('Select CA.IDAmostraConcurso, CA.CategoriaConcurso, CA.QRCODE,');
   SQL.Add('A.DataAvaliacao, A.Aroma, A.Sabor, A.Retrogosto, A.Acidez, A.Corpo, A.Uniformidade, A.Balanco,');
   SQL.Add('A.XicaraLimpa, A.Docura, A.Geral, A.XicarasDefeitosLeves, A.XicarasDefeitosGraves,');
   SQL.Add('(A.Aroma+A.Sabor+A.Retrogosto+A.Acidez+A.Corpo+(A.Uniformidade*2)+A.Balanco+(A.XicaraLimpa*2)+(A.Docura*2)+A.Geral)-(A.XicarasDefeitosLeves*2)-(A.XicarasDefeitosGraves*4) as NotaFinal,');
   SQL.Add('case when A.DataAvaliacao is null then 0 else 1 end as Avaliada, R.Json');
   SQL.Add('from concursoAmostras CA');
   SQL.Add('left join ConcursoAvaliacoes A on A.IDConcurso=CA.IDConcurso and A.IDAmostraConcurso=CA.IDAmostraConcurso');
   SQL.Add('and FaseConcurso='+QuotedStr(ConcursoFaseAtual.AsString));
   SQL.Add('and A.IDJurado='+IntToStr(TIWUserSession(WebApplication.Data).UsuarioAtivo));
   SQL.Add('left Join ConcursoRosasSabores R on R.IDAvaliacaoConcurso=A.IDAvaliacaoConcurso');
   SQL.Add('where CA.IDConcurso='+ConcursoIDConcurso.AsString); //Concurso
   SQL.Add('and CA.CategoriaConcurso='+QuotedStr(ConcursoCategoriaAvaliacao.AsString));//Categoria
   SQL.Add('and CA.Status=''Classificada'''); //Só Classificadas
   SQL.Add('and CA.IDAmostraConcurso in ');

   SQL.Add('(Select IDAmostraConcurso from ConcursoAvaliacoes');
   SQL.Add('where FaseConcurso=''Pré-seleção'''); //Fase
   SQL.Add('and IDConcurso='+ConcursoIDConcurso.AsString); //Concurso
   SQL.Add('group by IDConcurso, IDAmostraConcurso');
   SQL.Add('having Avg((Aroma+Sabor+Retrogosto+Acidez+Corpo+(Uniformidade*2)+');
   SQL.Add('Balanco+(XicaraLimpa*2)+(Docura*2)+Geral)-(XicarasDefeitosLeves*2)-');
   SQL.Add('(XicarasDefeitosGraves*4))>='+ConcursoPtsPreSelecao.AsString+')'); //Nota de Corte da Pré-seleção

   SQL.Add('order by NotaFinal Desc, CA.IDAmostraConcurso');
  end;
  Open;
  if RecordCount>0 then
  begin
    Json:=TStringList.Create;
    //Direcionar QRCODE
    if (WebApplication.RunParams.Values['act']='eval') and (WebApplication.RunParams.Values['qr']<>'') then
    begin
     if locate('QRCODE',WebApplication.RunParams.Values['qr'],[]) then
      Json.Add('id='+AmostrasIDAmostraConcurso.AsString); //usando o stringlist local para passar parametro.
      Json.Add('editar=false');
      Close;
      avaliarAmostra(json);
    end
    else
     WebApplication.ShowMessage('Este QR Code não pertence a este concurso categoria.');
    Json.Clear;
    Json.Add('{"data": [');
    First; //Posiciona o ponteiro para criar o Json
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
     IWJQueryAmostras.OnReady.Strings[61]:='   			"ajax": '+QuotedStr(xURL)+',';
    finally
     Json.Free;
    end;
  end
  else
   IWJQueryAmostras.OnReady.Strings[61]:='/*   			"ajax": */';
  Close;
 end;
end;

procedure TIWFormListarAvaliacoesConcurso.SairLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

end.
