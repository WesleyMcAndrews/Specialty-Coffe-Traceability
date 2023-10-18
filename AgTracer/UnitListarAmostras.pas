unit UnitListarAmostras;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  IWCompJQueryWidget, IWVCLComponent, IWBaseLayoutComponent,
  IWBaseContainerLayout, IWContainerLayout, IWTemplateProcessorHTML,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWHTMLControls, Data.DB, Data.Win.ADODB, IWBaseComponent, IWBaseHTMLComponent,
  IWBaseHTML40Component, IWCompExtCtrls, Vcl.Forms, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion, IWCompLabel,
  IWDBStdCtrls, IWCompListbox;

type
  TIWFormListarAmostras = class(TIWAppForm)
    VoltarLink: TIWLink;
    IncluirLote: TIWLink;
    EditarLote: TIWLink;
    ExcluirLote: TIWLink;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    Lotes: TADOQuery;
    Amostras: TADOQuery;
    IWJQueryLotes: TIWJQueryWidget;
    IWJQueryAmostras: TIWJQueryWidget;
    IncluirAmostra: TIWLink;
    EditarAmostra: TIWLink;
    ExcluirAmostra: TIWLink;
    LotesIDLote: TAutoIncField;
    LotesNomePropriedade: TStringField;
    LotesNomeAssociado: TStringField;
    LotesSafra: TStringField;
    LotesQtdeKg: TIntegerField;
    LotesDataCadastro: TDateTimeField;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    Associados: TADOQuery;
    AssociadosAssociado: TStringField;
    AssociadosSrc: TDataSource;
    Propriedades: TADOQuery;
    PropriedadesPropriedade: TStringField;
    PropriedadesSrc: TDataSource;
    AssociadosCombo: TIWComboBox;
    PropriedadesCombo: TIWComboBox;
    SafraCombo: TIWComboBox;
    BuscarBtn: TIWLink;
    AssociadosIDAssociado: TAutoIncField;
    PropriedadesIDPropriedade: TStringField;
    AmostrasIDAmostra: TAutoIncField;
    AmostrasDataEntrada: TDateTimeField;
    AmostrasTipoAmostra: TStringField;
    AmostrasEtapaProcesso: TStringField;
    AmostrasQtdeKg: TIntegerField;
    AmostrasDataDevolutiva: TDateTimeField;
    LotesNomesTalhoes: TMemoField;
    LotesJson: TMemoField;
    LotesMetodoPreparo: TStringField;
    FasesProducao: TADOQuery;
    FasesProducaoJson: TMemoField;
    procedure IncluirLoteClick(Sender: TObject);
    procedure VoltarLinkClick(Sender: TObject);
    function VirgulaPorPonto(S:String):String;
    procedure EditarLoteClick(Sender: TObject);
    procedure MyAjaxHandler(EventParams: TStringList);
    procedure IWAppFormCreate(Sender: TObject);
    procedure EditarAmostraClick(Sender: TObject);
    procedure ExcluirAmostraClick(Sender: TObject);
    procedure ExcluirLoteClick(Sender: TObject);
    procedure IncluirAmostraClick(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
    procedure AssociadosComboAsyncChange(Sender: TObject;
      EventParams: TStringList);
    procedure BuscarBtnAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure IWAppFormRender(Sender: TObject);
  public
  end;

implementation

 uses IWAppCache, IWMimeTypes, IW.CacheStream, Windows, UserSessionUnit,
 UnitEditarLoteAmostra, UnitEditarAmostra;

{$R *.dfm}

procedure TIWFormListarAmostras.MyAjaxHandler(EventParams: TStringList);
var
 S, xFileName, xURL:String;
 i: Integer;
 Json:TStringList;
begin
 //WebApplication.ShowMessage(EventParams.Values['id']);
 //Verifica quais campos foram filtrados e monta a consulta
 With Amostras do
 begin
  SQl[sql.count-2]:='Where A.IDLote='+QuotedStr(EventParams.Values['id']);
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
       case Fields[i].DataType of
        ftInteger:
         S:=S+'"'+Fields[i].DisplayLabel+'":'+'"'+FormatFloat((Fields[i] as TNumericField).DisplayFormat, Fields[i].Value)+'",' ;
        ftFloat:
         S:=S+'"'+Fields[i].DisplayLabel+'":'+'"'+FormatFloat((Fields[i] as TNumericField).DisplayFormat, Fields[i].Value)+'",' ;
        ftMemo:
         S:=S+'"'+Fields[i].DisplayLabel+'":'+'"'+Fields[i].AsString+'",';
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
end;

procedure TIWFormListarAmostras.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

function TIWFormListarAmostras.VirgulaPorPonto(S:String):String;
begin
 S:=StringReplace(S,'.','',[rfReplaceAll]);
 S:=StringReplace(S,',','.',[rfReplaceAll]);
 result:=S;
end;

procedure TIWFormListarAmostras.AssociadosComboAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
 //Preencher Combo Propriedades
 if AssociadosCombo.SelectedValue<>'' then
 with propriedades do
 begin
  PropriedadesCombo.Items.Clear;
  Sql[sql.Count-2]:='Where P.IDAssociado='+AssociadosCombo.SelectedValue;
  Open;
  while not eof do
  begin
   PropriedadesCombo.Items.Values[PropriedadesPropriedade.AsString]:=PropriedadesIDPropriedade.AsString;
   Next;
  end;
  Close;
 end;
 PropriedadesCombo.Enabled:=AssociadosCombo.SelectedValue<>'';
 PropriedadesCombo.RepaintControl;
end;

procedure TIWFormListarAmostras.BuscarBtnAsyncClick(Sender: TObject;
  EventParams: TStringList);
var
 S, xFileName, xURL:String;
 i: Integer;
 Json:TStringList;
begin
  //Verifica quais campos foram filtrados e monta a consulta
  With Lotes do
  begin
   SQl.Clear;
   Sql.Add('Select L.IDLote, P.NomePropriedade, A.NomeAssociado, L.Safra, L.QtdeKg, L.DataCadastro,');
   Sql.Add('L.MetodoPreparo, N.NomesTalhoes, Case when T.Json is null then ''[]'' else T.Json end as Json');
   Sql.Add('from Lotes L');
   Sql.Add('left join Propriedades P on P.IDPropriedade=L.IDPropriedade');
   Sql.Add('left join Associados A on A.IDAssociado=P.IDAssociado');
   Sql.Add('left join NomesTalhoesLote N on N.IDLote=L.IDLote');
   Sql.Add('left join Timeline T on T.IDLote=L.IDLote');
   //Parâmetros da Busca
   SQl.Add('where A.IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente));
   if AssociadosCombo.SelectedValue<>'' then
    Sql.Add('and L.IDAssociado='+QuotedStr(AssociadosCombo.SelectedValue))
   else
    Sql.Add('and L.IDAssociado is not null');
   if PropriedadesCombo.SelectedValue<>'' then
    Sql.Add('and L.IDPropriedade='+QuotedStr(PropriedadesCombo.SelectedValue));
   if SafraCombo.SelectedValue<>'' then
    Sql.Add('and L.Safra='+QuotedStr(SafraCombo.SelectedValue));
   Sql.Add('order by L.DataCadastro desc');
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
        ftDateTime:
         S:=S+'"'+Fields[i].DisplayLabel+'":'+'"'+FormatDateTime((Fields[i] as TDateTimeField).DisplayFormat, Fields[i].Value)+'",' ;
        ftMemo: //JSON
          if Fields[i].FieldName='Json' then
           S:=S+'"'+Fields[i].DisplayLabel+'":'+Fields[i].AsString+','
          else
           S:=S+'"'+Fields[i].DisplayLabel+'":'+'"'+Fields[i].AsString+'",';
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
      WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$("#lotes").DataTable().ajax.url( '+QuotedStr(xURL)+').load();' );
     finally
      Json.Free;
     end;
   end
   else
    WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$("#lotes").DataTable().clear().draw();' );
   Close;
  end;
end;

procedure TIWFormListarAmostras.EditarLoteClick(Sender: TObject);
begin
 if Self.HiddenFields.Values['IDLOTETOEDIT']<>'' then
 With TIWFormEditarLoteAmostra.Create(WebApplication) do
 begin
  Lotes.Open;
  Usuarios.Open; //Exibir usuários do cadastro e edição
  if Lotes.Locate('IDLote',Self.HiddenFields.Values['IDLOTETOEDIT'],[]) then
  begin
   with Associados do
   begin
    SQl[SQl.Count-3]:='where IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente);
    SQl[SQl.Count-2]:='and IDAssociado='+LotesIDAssociado.AsString;
    Open;
   end;
   with propriedades do
   begin
    Sql[sql.Count-3]:='Where P.IDAssociado='+LotesIDAssociado.AsString;
    Sql[sql.Count-2]:='and P.IDPropriedade='+QuotedStr(LotesIDPropriedade.AsString);
    Open;
   end;
   Editando:=true;
   //Editar o registro
   Lotes.Edit;
   Show;
  end
  else
   WebApplication.ShowMessage('Não foi possível editar este registro.');
 end
 else
  WebApplication.ShowMessage('Selecione um registro para editar.');
end;

procedure TIWFormListarAmostras.EditarAmostraClick(Sender: TObject);
begin
 if Self.HiddenFields.Values['IDAMOSTRATOEDIT']<>'' then
 With TIWFormEditarAmostra.Create(WebApplication) do
 begin
  Amostras.Open;
  if Amostras.Locate('IDAmostra',StrToInt(Self.HiddenFields.Values['IDAMOSTRATOEDIT']),[]) then
  begin
   Editando:=true;
   //Editar o registro
   Amostras.Edit;
   Show;
  end
  else
   WebApplication.ShowMessage('Não há Amostra a Editar.');
 end
 else
  WebApplication.ShowMessage('Não foi possível editar esta Amostra.');
end;

procedure TIWFormListarAmostras.ExcluirLoteClick(Sender: TObject);
begin
 if Self.HiddenFields.Values['IDLOTETOEDIT']<>'' then
 With TIWUserSession(WebApplication.Data).ADOQuery1 do
 begin
  Sql.Clear;
  SQl.Add('Delete from Lotes');
  Sql.Add('Where IDLote='+Self.HiddenFields.Values['IdLoteToEdit']);
  Try
   ExecSQl;
   WebApplication.ShowMessage('Lote Excluído com Sucesso.');
  Except
   WebApplication.ShowMessage('Para excluir este Lote, exclua primeiro as Amostras.');
  End;
 end
 else
  WebApplication.ShowMessage('Selecione um Lote para ser excluído.');
end;

procedure TIWFormListarAmostras.ExcluirAmostraClick(Sender: TObject);
begin
 if Self.HiddenFields.Values['IDAMOSTRATOEDIT']<>'' then
 With TIWUserSession(WebApplication.Data).ADOQuery1 do
 begin
  Sql.Clear;
  SQl.Add('Delete from AmostrasLotes');
  Sql.Add('Where IDAmostra='+Self.HiddenFields.Values['IdAmostraToEdit']);
  Try
   ExecSQl;
   WebApplication.ShowMessage('Amostra excluída com sucesso.');
  Except
   WebApplication.ShowMessage('Para excluir esta Amostra, exclua suas provas e QrCodes.');
  End;
 end
 else
  WebApplication.ShowMessage('Selecione uma Amostra para ser excluída.');
end;

procedure TIWFormListarAmostras.IncluirLoteClick(Sender: TObject);
begin
 //TIWUserSession(WebApplication.Data).EditarPropriedade:=0;
 if (Self.AssociadosCombo.SelectedValue='')and(Self.PropriedadesCombo.SelectedValue='') then
 begin
  WebApplication.ShowMessage('Selecione um Associado e uma Propriedade antes de incluir um novo Lote.');
  Exit;
 end;
 With TIWFormEditarLoteAmostra.Create(WebApplication) do
 begin
  //Localizar o associado e propriedades filtrado
  Editando:=false;
  Lotes.Open;
  Lotes.Append;
  LotesIDAssociado.AsString:=Self.AssociadosCombo.SelectedValue;
  LotesIDPropriedade.AsString:=Self.PropriedadesCombo.SelectedValue;
  with Associados do
  begin
   SQl[SQl.Count-3]:='where IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente);
   SQl[SQl.Count-2]:='and IDAssociado='+Self.AssociadosCombo.SelectedValue;
   Open;
  end;
  with propriedades do
  begin
   Sql[sql.Count-3]:='Where P.IDAssociado='+Self.AssociadosCombo.SelectedValue;
   Sql[sql.Count-2]:='and P.IDPropriedade='+QuotedStr(Self.PropriedadesCombo.SelectedValue);
   Open;
  end;
  Show;
 end;
end;

procedure TIWFormListarAmostras.IncluirAmostraClick(Sender: TObject);
begin
 With TIWFormEditarAmostra.Create(WebApplication) do
 begin
  Editando:=false;
  Amostras.Open;
  Amostras.Append;
  //ID do Lote
  AmostrasIDLote.AsString:=Self.HiddenFields.Values['IdLoteToEdit'];
  //Data da Entrada
  AmostrasDataEntrada.Value:=Date();
  //Data da Devolutiva
  AmostrasDataDevolutiva.Value:=Date()+3;
  //Login Avulso
  AmostrasLoginAvulso.AsString:=RandomPassword(6);
  //Senha Avulsa
  AmostrasSenhaAvulsa.AsString:=RandomPassword(6);
  Show;
 end;
end;

procedure TIWFormListarAmostras.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
 WebApplication.RegisterCallBack('MyAjaxHandler', MyAjaxHandler);
 //Preencher Combo Associados
 With Associados do
 begin
  SQL[SQL.Count-2]:='where IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente);
  Open;
  while not eof do
  begin
   AssociadosCombo.Items.Values[AssociadosAssociado.AsString]:=AssociadosIDAssociado.AsString;
   Next;
  end;
  Close;
 end;
end;

procedure TIWFormListarAmostras.IWAppFormRender(Sender: TObject);
var
 j:TStringList;
 xFileName, xURL:String;
begin
 j:=TStringList.Create;
 //Carregar o Json com as Fases da Produção desta Cultura
 With FasesProducao do
 begin
  SQL[sql.Count-1]:='where idCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente);
  Open;
  j.Add( FasesProducao.FieldByName('json').AsString ); //Recebe json
 end;
 j.SaveToFile(GGetWebApplicationThreadVar.UserCacheDir+'Arquivo.txt', TEncoding.UTF8);
 xFileName := TIWAppCache.NewTempFileName;
 Windows.CopyFile(PChar(GGetWebApplicationThreadVar.UserCacheDir+'Arquivo.txt'), PChar(xFileName), True);
 xURL := TIWAppCache.AddFileToCache(Self, xFileName,TIWMimeTypes.GetAsString(mtUnknown), ctSession);
 IWJQueryLotes.OnReady[0]:='var jsonFasesCultura = '+QuotedStr(xURL)+';';
 j.free;
end;
procedure TIWFormListarAmostras.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;



end.
