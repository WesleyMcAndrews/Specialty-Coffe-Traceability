unit UnitListarLotes;

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
  TIWFormListarLotes = class(TIWAppForm)
    VoltarLink: TIWLink;
    IncluirLote: TIWLink;
    EditarLote: TIWLink;
    ExcluirLote: TIWLink;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    Lotes: TADOQuery;
    Talhoes: TADOQuery;
    IWJQueryLotes: TIWJQueryWidget;
    IWJQueryTalhoes: TIWJQueryWidget;
    IncluirTalhao: TIWLink;
    EditarTalhao: TIWLink;
    ExcluirTalhao: TIWLink;
    LotesIDLote: TAutoIncField;
    LotesNomePropriedade: TStringField;
    LotesNomeAssociado: TStringField;
    LotesSafra: TStringField;
    LotesQtdeKg: TIntegerField;
    LotesDataCadastro: TDateTimeField;
    TalhoesIDTalhaoLote: TAutoIncField;
    TalhoesNomeTalhao: TStringField;
    TalhoesIrrigado: TBooleanField;
    TalhoesMetodoPreparo: TStringField;
    TalhoesArea: TFloatField;
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
    procedure IncluirLoteClick(Sender: TObject);
    procedure VoltarLinkClick(Sender: TObject);
    function VirgulaPorPonto(S:String):String;
    procedure EditarLoteClick(Sender: TObject);
    procedure MyAjaxHandler(EventParams: TStringList);
    procedure IWAppFormCreate(Sender: TObject);
    procedure EditarTalhaoClick(Sender: TObject);
    procedure ExcluirTalhaoClick(Sender: TObject);
    procedure ExcluirLoteClick(Sender: TObject);
    procedure IncluirTalhaoClick(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
    procedure AssociadosComboAsyncChange(Sender: TObject;
      EventParams: TStringList);
    procedure BuscarBtnAsyncClick(Sender: TObject; EventParams: TStringList);
  public
  end;

implementation

 uses IWAppCache, IWMimeTypes, IW.CacheStream, Windows, UserSessionUnit,
 UnitEditarLoteAmostra, UnitEditarTalhaoLote;

{$R *.dfm}

procedure TIWFormListarLotes.MyAjaxHandler(EventParams: TStringList);
var
 S, xFileName, xURL:String;
 i: Integer;
 Json:TStringList;
begin
 //WebApplication.ShowMessage(EventParams.Values['id']);
 //Verifica quais campos foram filtrados e monta a consulta
 With Talhoes do
 begin
  SQl[sql.count-2]:='Where L.IDLote='+QuotedStr(EventParams.Values['id']);
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
     WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$(''#talhoes'').DataTable().ajax.url( '+QuotedStr(xURL)+').load();' );
    finally
     Json.Free;
    end;
  end
  else
   WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$(''#talhoes'').DataTable().clear().draw();' );
  Close;
 end;
end;

procedure TIWFormListarLotes.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

function TIWFormListarLotes.VirgulaPorPonto(S:String):String;
begin
 S:=StringReplace(S,'.','',[rfReplaceAll]);
 S:=StringReplace(S,',','.',[rfReplaceAll]);
 result:=S;
end;

procedure TIWFormListarLotes.AssociadosComboAsyncChange(Sender: TObject;
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

procedure TIWFormListarLotes.BuscarBtnAsyncClick(Sender: TObject;
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
   Sql.Add('Select L.IDLote, P.NomePropriedade, A.NomeAssociado, L.Safra, L.QtdeKg, L.DataCadastro');
   Sql.Add('from Lotes L');
   Sql.Add('left join Propriedades P on P.IDPropriedade=L.IDPropriedade');
   Sql.Add('left join Associados A on A.IDAssociado=P.IDAssociado');
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

procedure TIWFormListarLotes.EditarLoteClick(Sender: TObject);
begin
 if Self.HiddenFields.Values['IDLOTETOEDIT']<>'' then
 With TIWFormEditarLoteAmostra.Create(WebApplication) do
 begin
  Lotes.Open;
  Usuarios.Open; //Exibir usuários do cadastro e edição
  if Lotes.Locate('IDLote',Self.HiddenFields.Values['IDLOTETOEDIT'],[]) then
  begin
   Associados.Locate('IDAssociado', LotesIDAssociado.AsInteger,[]);
   with propriedades do
   begin
    Sql[sql.Count-2]:='Where P.IDAssociado='+LotesIDAssociado.AsString;
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

procedure TIWFormListarLotes.EditarTalhaoClick(Sender: TObject);
begin
 if Self.HiddenFields.Values['IDTALHAOTOEDIT']<>'' then
 With TIWFormEditarTalhaoLote.Create(WebApplication) do
 begin
  //Exibir Dados do Lote e Talhões da Propriedade
  With Lote do
  begin
   SQl[SQl.Count-1]:='Where L.IDLote='+Self.HiddenFields.Values['IdLoteToEdit'];
   Open;
   Talhoes.Open; //Subdetail
  end;
  TalhoesLotes.Open;
  if TalhoesLotes.Locate('IDTalhaoLote',StrToInt(Self.HiddenFields.Values['IDTALHAOTOEDIT']),[]) then
  begin
   Editando:=true;
   //Editar o registro
   TalhoesLotes.Edit;
   Show;
  end
  else
   WebApplication.ShowMessage('Não foi possível editar este talhão.');
 end;

end;

procedure TIWFormListarLotes.ExcluirLoteClick(Sender: TObject);
begin
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
 end;
end;

procedure TIWFormListarLotes.ExcluirTalhaoClick(Sender: TObject);
begin
 With TIWUserSession(WebApplication.Data).ADOQuery1 do
 begin
  Sql.Clear;
  SQl.Add('Delete from TalhoesLotes');
  Sql.Add('Where IDLote='+Self.HiddenFields.Values['IdLoteToEdit']);
  Sql.Add('And IDTalhao='+Self.HiddenFields.Values['IdTalhaoToEdit']);
  Try
   ExecSQl;
   WebApplication.ShowMessage('Talhão Excluído com Sucesso.');
  Except
   WebApplication.ShowMessage('Não foi possível excluir este Talhão.');
  End;
 end;
end;

procedure TIWFormListarLotes.IncluirLoteClick(Sender: TObject);
begin
 //TIWUserSession(WebApplication.Data).EditarPropriedade:=0;
 With TIWFormEditarLoteAmostra.Create(WebApplication) do
 begin
  Editando:=false;
  Lotes.Open;
  Lotes.Append;
  Show;
 end;
end;

procedure TIWFormListarLotes.IncluirTalhaoClick(Sender: TObject);
begin
 With TIWFormEditarTalhaoLote.Create(WebApplication) do
 begin
  //Exibir Dados do Lote e Talhões da Propriedade
  With Lote do
  begin
   SQl[SQl.Count-1]:='Where L.IDLote='+Self.HiddenFields.Values['IdLoteToEdit'];
   Open;
   Talhoes.Open; //Subdetail
  end;
  //Cadastrar Talhão no lote
  Editando:=false;
  With TalhoesLotes do
  begin
   Open;
   Append;
  end;
  TalhoesLotesIDLote.Value:=StrToInt(Self.HiddenFields.Values['IdLoteToEdit']);
  Show;
 end;
end;

procedure TIWFormListarLotes.IWAppFormCreate(Sender: TObject);
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

procedure TIWFormListarLotes.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;



end.
