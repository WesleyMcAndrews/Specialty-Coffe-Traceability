unit UnitEditarTalhoes;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWHTMLControls, Data.DB, Data.Win.ADODB,
  IWCompButton, IWDBStdCtrls, IWCompListbox, IWCompEdit, IWCompJQueryWidget,
  IWCompExtCtrls, IWDBExtCtrls, System.Variants, IWCompLabel, IWCompCheckbox,
  IWCompMemo;

type
  TIWFormEditarTalhoes = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    VoltarLink: TIWLink;
    CancelarBtn: TIWButton;
    CadastradoPor: TIWDBLabel;
    EditadoPor: TIWDBLabel;
    NomeTalhao: TIWDBEdit;
    TalhoesSrc: TDataSource;
    ChkIrrigado: TIWDBEdit;
    NomePropriedade: TIWLabel;
    VariedadesTalhao: TADOQuery;
    VariedadesTalhaoIDVariedade: TIntegerField;
    Variedades: TADOQuery;
    VariedadesIDVariedade: TAutoIncField;
    VariedadesNomeVariedade: TStringField;
    ADOQuery1: TADOQuery;
    Usuarios: TADOQuery;
    UsuariosSrc: TDataSource;
    Poligono: TADOQuery;
    PoligonoPoligono: TWideMemoField;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    IWJQueryWidget1: TIWJQueryWidget;
    JSON: TADOQuery;
    JSONJSON: TMemoField;
    DataPlantio: TIWDBEdit;
    Talhoes: TADODataSet;
    MultiComboVariedades: TIWDBEdit;
    UsuariosUsuarioCadastro: TStringField;
    UsuariosUsuarioEdicao: TStringField;
    TalhoesIDTalhao: TAutoIncField;
    TalhoesIDPropriedade: TStringField;
    TalhoesNomeTalhao: TStringField;
    TalhoesPoligono: TBlobField;
    TalhoesIrrigado: TBooleanField;
    TalhoesDataPlantio: TDateTimeField;
    TalhoesVariedades: TStringField;
    TalhoesIDUsuarioCadastro: TIntegerField;
    TalhoesDataCadastro: TDateTimeField;
    TalhoesIDUsuarioEdicao: TIntegerField;
    TalhoesDataEdicao: TDateTimeField;
    WKTEdit: TIWEdit;
    SalvarBtn: TIWButton;
    Premios: TIWDBMemo;
    TalhoesPremios: TMemoField;
    procedure UsuariosCalcFields(DataSet: TDataSet);
    procedure IWAppFormCreate(Sender: TObject);
    procedure MultiComboVariedadesAsyncChange(Sender: TObject;
      EventParams: TStringList);
    function InvertePoligono(Str:String):String;
    procedure ProfileLogoutLinkClick(Sender: TObject);
    procedure editarShape(EventParams: TStringList);
    function gerarJSON(id: string):String;
    procedure CancelarBtnAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure VoltarLinkClick(Sender: TObject);
    procedure SalvarBtnAsyncClick(Sender: TObject; EventParams: TStringList);
  public
   Editando:Boolean;
   mIDPropriedade:String;
  end;

implementation

{$R *.dfm}

uses IWAppCache, IWMimeTypes, IW.CacheStream, windows, UserSessionUnit;


procedure TIWFormEditarTalhoes.CancelarBtnAsyncClick(Sender: TObject;
  EventParams: TStringList);
  var isNew:String;
begin
  if Editando then
   isNew:='false'
  else
   isNew:='true';
  Talhoes.Cancel;
 //Ocultar editor e desfazer alterações no poligono
 WebApplication.CallBackResponse.AddJavaScriptToExecute( '$("#EDITORDIV").hide(); mapp.cancelEdition('+isNew+'); mapp.onHideDiv();' );
end;

function TIWFormEditarTalhoes.gerarJSON(id: string) : String;
begin
 with JSON do
 begin
  //SQL[SQL.Count-4]:='  where T.IDPropriedade='+QuotedStr(mIDPropriedade);

  Talhoes.CommandText:='Select * from Talhoes '+
       'where IDPropriedade='+QuotedStr('08.025.003/0001-91');
  Talhoes.Open;
  SQL[SQL.Count-4]:='  where T.IDPropriedade='+QuotedStr('08.025.003/0001-91');

  if id='' then //Todos os Registros
   SQL[SQL.Count-3]:='  and T.idTalhao is not null'
  else
   SQL[SQL.Count-3]:='  and T.idTalhao='+id;
  Open;
  result:=fieldByName('JSON').AsString;
 end;
end;

procedure TIWFormEditarTalhoes.editarShape(EventParams: TStringList);
 var
  S: String;
begin
 if EventParams.Values['ID']='' then //Novo Talhão
 begin
  Editando:=false;
  Talhoes.Append;
  TalhoesIDPropriedade.AsString:=mIDPropriedade;
  ChkIrrigado.Text:='off';
 end
 else  //Ediar Talhão
 begin
  Editando:=true;
  If Talhoes.Locate('IDTalhao',EventParams.Values['ID'],[]) then
  begin
   Talhoes.Edit;
  end;
 end;
 //Exibir Formulário e ocultar Intraweb "loading animation"
 WebApplication.CallBackResponse.AddJavaScriptToExecute( '$("#EDITORDIV").show("slow", mapp.onShowDiv()); ShowBusy(false);' );
 ChkIrrigado.RepaintControl;
 MultiComboVariedades.RepaintControl;
end;

function TIWFormEditarTalhoes.InvertePoligono(Str:String):String;
begin
 Delete(Str,1,9);//Retirar 'POLYGON(('
 Delete(Str,Length(Str)-1,2); //Retirar '))'
 while pos(',',Str)>0 do
 begin
  Result:=','+Copy(Str,1,pos(',',Str)-1)+Result;
  Delete(str,1,pos(',',Str));
 end;
 Result:='POLYGON(('+Str+Result+'))';
end;

procedure TIWFormEditarTalhoes.IWAppFormCreate(Sender: TObject);
var
  S:String;
  j:TStringList;
  xFileName, xURL:String;
begin
 //Fases de Produção para esta cultura
 j:=TStringList.Create;
 j.Add( gerarJSON('') ); //Recebe json da função
 j.SaveToFile(GGetWebApplicationThreadVar.UserCacheDir+'Arquivo.txt', TEncoding.UTF8);
 xFileName := TIWAppCache.NewTempFileName;
 Windows.CopyFile(PChar(GGetWebApplicationThreadVar.UserCacheDir+'Arquivo.txt'), PChar(xFileName), True);
 xURL := TIWAppCache.AddFileToCache(Self, xFileName,TIWMimeTypes.GetAsString(mtUnknown), ctSession);
 IWJQueryWidget1.OnReady[0]:='var arquivo = '+QuotedStr(xURL)+';';
 j.free;
 //Nome do Usuário
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
 //Preencher opções do combo variedades
 S:='names=[';
 With Variedades do
 begin
  Open;
  while not eof do
  begin
   S:=S+'{''id'':'''+VariedadesIDVariedade.AsString+''',''text'':'''+VariedadesNomeVariedade.AsString+'''},';
   next;
  end;
   S[length(S)]:=']'; //Substitui ultima virgula por ']'
  Close;
 end;
 MultiComboVariedades.ExtraTagParams.Add(S);
 //Registrar Callbacks
 WebApplication.RegisterCallBack('editarShape', editarShape);
end;

procedure TIWFormEditarTalhoes.UsuariosCalcFields(DataSet: TDataSet);
begin
 //UsuariosCadastradoPor.AsString:='Cadastrado por '+UsuariosUsuarioCadastro.AsString+' em '+FormatDateTime('dd/mm/yyyy hh:nn',UsuariosDataCadastro.Value);
 //UsuariosEditadoPor.AsString:='Editado por '+UsuariosUsuarioEdicao.AsString+' em '+FormatDateTime('dd/mm/yyyy hh:nn',UsuariosDataEdicao.Value);
end;

procedure TIWFormEditarTalhoes.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;

procedure TIWFormEditarTalhoes.MultiComboVariedadesAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
 //WebApplication.ShowMessage(MultiComboVariedades.SelectedValue);
 WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#HIDDEN_VARIEDADES'').val($(''#MULTICOMBOVARIEDADES'').val());' );
end;

procedure TIWFormEditarTalhoes.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

procedure TIWFormEditarTalhoes.SalvarBtnAsyncClick(Sender: TObject;
  EventParams: TStringList);
var
 S,ID, isNew:String;
begin
 //gravar
 S:=EventParams.Text;
 try
  if Editando then
  begin
   isNew:='false';
   TalhoesIDUsuarioEdicao.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
   TalhoesDataEdicao.Value:=Now();
  end
  else
  begin
   isNew:='true';
   TalhoesIDUsuarioCadastro.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
  end;
  Talhoes.Post;
  //Processar Variedades do talhão
  S:=TalhoesVariedades.AsString;
  With ADOQuery1 do
  begin
   if Editando then
   begin
    ID:=TalhoesIDTalhao.AsString;
    Sql.Clear;
    Sql.Add('Delete from VariedadesTalhoes');
    SQl.Add('Where IDTalhao='+ID);
    ExecSQL;
   end
   else //Talhão Novo
   begin
    SQl.Clear;
    SQL.Add('Select @@identity as ID from Talhoes');
    Open;
    ID:=FieldByName('ID').AsString;
    Close;
   end;
   //Cadastrar VariedadesTalhoes
   Sql.Clear;
   SQl.Add('Insert Into VariedadesTalhoes');
   SQl.Add('Values');
   while pos(',',S)>0 do
   begin
    SQl.Add('('+ID+','+Copy(S,1,pos(',',S)-1)+'),');
    System.Delete(S,1,pos(',',S));
   end;
   SQl.Add('('+ID+','+Copy(S,1,length(S))+')');
   S:=SQl.Text;
   ExecSQL;
   //Processar Poligono
   SQl.Clear;
   SQl.Add('Update Talhoes');
   Sql.Add('set Poligono=geography::STGeomFromText('+QuotedStr(WKTEDIT.Text)+', 4326)');
   SQl.Add('Where IDTalhao='+ID);
   Sql.Add('GO');
   //No SQL 2012 é preciso checar se o polígono não está excedendo o hemisfério e corrigir
   SQl.Add('Update Talhoes');
   Sql.Add('Set poligono=poligono.ReorientObject()');
   Sql.Add('where poligono.EnvelopeAngle()>180');
   try
    ExecSQL;
   except
    //No SQL2008 o polígono precisa ser invertido se houver erro.
    //SQl.Strings[SQL.Count-2]:='set Poligono=geography::STGeomFromText('+QuotedStr(InvertePoligono(WKTEDIT.Text))+', 4326)';
    WebApplication.ShowMessage('Não foi possível atualizar o Polígono. Verifique.');
    WebApplication.CallBackResponse.AddJavaScriptToExecute( 'mapp.cancelEdition('+isNew+');' );
   end;
  end;
  WebApplication.ShowMessage('Dados gravados com sucesso.');
  if Editando then
   WebApplication.CallBackResponse.AddJavaScriptToExecute( '$("#EDITORDIV").hide(); mapp.saveEdition();' )
  else
   WebApplication.CallBackResponse.AddJavaScriptToExecute( '$("#EDITORDIV").hide(); mapp.saveEdition('+GerarJSON(ID)+');' );
 except
  on E : Exception do
  begin
   WebApplication.ShowMessage('Não foi possível gravar. Verifique os dados digitados. '+E.Message);
   WebApplication.CallBackResponse.AddJavaScriptToExecute( '$("#EDITORDIV").hide(); mapp.cancelEdition('+isNew+'); mapp.onHideDiv();' );
   Exit;
  end;
 end;
 WebApplication.CallBackResponse.AddJavaScriptToExecute( '$("#EDITORDIV").hide(); mapp.onHideDiv();' );
end;
end.
