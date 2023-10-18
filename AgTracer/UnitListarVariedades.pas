unit UnitListarVariedades;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  IWCompJQueryWidget, IWVCLComponent, IWBaseLayoutComponent,
  IWBaseContainerLayout, IWContainerLayout, IWTemplateProcessorHTML,
  Vcl.Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl,
  IWHTMLControls, Data.DB, Data.Win.ADODB, IWBaseComponent, IWBaseHTMLComponent,
  IWBaseHTML40Component, IWCompExtCtrls, Vcl.Forms, IWVCLBaseContainer,
  IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion, IWCompLabel,
  IWCompEdit, IWCompButton;

type
  TIWFormListarVariedades = class(TIWAppForm)
    VoltarLink: TIWLink;
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    Variedades: TADOQuery;
    IWJQueryVariedades: TIWJQueryWidget;
    IncluirVariedade: TIWLink;
    EditarVariedade: TIWLink;
    ExcluirVariedade: TIWLink;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    VariedadesIDVariedade: TAutoIncField;
    VariedadesNomeVariedade: TStringField;
    VariedadesTalhoes: TIntegerField;
    VariedadesAreaPlantada: TFloatField;
    VariedadesNomeCultura: TStringField;
    CulturaCliente: TIWLabel;
    VariedadesNomeUsuario: TStringField;
    VariedadesDataCadastro: TDateTimeField;
    VariedadesIDCultura: TIntegerField;
    procedure VoltarLinkClick(Sender: TObject);
    function VirgulaPorPonto(S:String):String;
    procedure IWAppFormRender(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure ExcluirVariedadeClick(Sender: TObject);
    procedure IncluirVariedadeClick(Sender: TObject);
    procedure EditarVariedadeClick(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
  public
  end;

implementation

 uses IWAppCache, IWMimeTypes, IW.CacheStream, Windows, UserSessionUnit,
 UnitEditarVariedade;

{$R *.dfm}


procedure TIWFormListarVariedades.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

function TIWFormListarVariedades.VirgulaPorPonto(S:String):String;
begin
 S:=StringReplace(S,'.','',[rfReplaceAll]);
 S:=StringReplace(S,',','.',[rfReplaceAll]);
 result:=S;
end;


procedure TIWFormListarVariedades.EditarVariedadeClick(Sender: TObject);
begin
 if Self.HiddenFields.Values['IDTOEDIT']<>'' then
 With TIWFormEditarVariedade.Create(WebApplication) do
 begin
  NomeCulturaCliente.Text:=CulturaCliente.Text;
  Variedades.Open;
  if Variedades.Locate('IDVariedade',StrToInt(Self.HiddenFields.Values['IDTOEDIT']),[]) then
  begin
   Editando:=true;
   //Editar o registro
   Variedades.Edit;
   Usuarios.Open;
   Show;
  end
  else
   WebApplication.ShowMessage('Não foi possível editar esta variedade.');
 end
 else
  WebApplication.ShowMessage('Selecione uma variedade para editar.');
end;

procedure TIWFormListarVariedades.ExcluirVariedadeClick(Sender: TObject);
begin
 With TIWUserSession(WebApplication.Data).ADOQuery1 do
 begin
  Sql.Clear;
  SQl.Add('Delete from Variedades');
  Sql.Add('Where IDVariedade='+Self.HiddenFields.Values['IDTOEDIT']);
  Try
   ExecSQl;
   WebApplication.ShowMessage('Variedade excluída com Sucesso.');
  Except
   WebApplication.ShowMessage('Não foi possível excluir esta Variedade. Esclua os talhões com esta variedade.');
  End;
 end;
end;

procedure TIWFormListarVariedades.IncluirVariedadeClick(Sender: TObject);
begin
 With TIWFormEditarVariedade.Create(WebApplication) do
 begin
  Editando:=false;
  NomeCulturaCliente.Text:=CulturaCliente.Text;
  Variedades.Open;
  Variedades.Append;
  VariedadesIDCultura.AsString:=Self.HiddenFields.Values['IDCULTURA'];
  Show;
 end;
end;

procedure TIWFormListarVariedades.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
end;

procedure TIWFormListarVariedades.IWAppFormRender(Sender: TObject);
var
 S, xFileName, xURL:String;
 i, variaveis:Integer;
 Json:TStringList;
begin
 Variaveis:=0;
 //Verifica quais campos foram filtrados e monta a consulta
 With Variedades do
 begin
  //Exibir as Culturas do cliente
  SQL[SQL.Count-2]:='where C.IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente);
  Open;
  if RecordCount>0 then
  begin
    //Nomear a cultura listada
    CulturaCliente.Text:=VariedadesNomeCultura.AsString+' ';
    Self.HiddenFields.Values['IDCULTURA']:=VariedadesIDCultura.AsString;
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
     IWJQueryVariedades.OnReady.Strings[2]:='   			"ajax": '+QuotedStr(xURL)+',';
    finally
     Json.Free;
    end;
  end
  else
   IWJQueryVariedades.OnReady.Strings[2]:='/*   			"ajax": */';
  Close;
 end;
end;


procedure TIWFormListarVariedades.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;



end.
