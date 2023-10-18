unit UnitEditarTalhao;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWHTMLControls, Data.DB, Data.Win.ADODB,
  IWCompButton, IWDBStdCtrls, IWCompListbox, IWCompEdit, IWCompJQueryWidget,
  IWCompExtCtrls, IWDBExtCtrls, System.Variants, IWCompLabel, IWCompCheckbox;

type
  TIWFormEditarTalhao = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    VoltarLink: TIWLink;
    SalvarBtn: TIWButton;
    CancelarBtn: TIWButton;
    CadastradoPor: TIWDBLabel;
    EditadoPor: TIWDBLabel;
    NomeTalhao: TIWDBEdit;
    Qtdemm: TIWDBEdit;
    WKT: TIWEdit;
    Talhoes: TADODataSet;
    TalhoesSrc: TDataSource;
    TalhoesIDTalhao: TAutoIncField;
    TalhoesIDPropriedade: TStringField;
    TalhoesNomeTalhao: TStringField;
    TalhoesPoligono: TBlobField;
    TalhoesIrrigado: TBooleanField;
    TalhoesmmTotal: TIntegerField;
    ChkIrrigado: TIWDBEdit;
    NomePropriedade: TIWLabel;
    VariedadesTalhao: TADOQuery;
    VariedadesTalhaoIDVariedade: TIntegerField;
    Variedades: TADOQuery;
    VariedadesIDVariedade: TAutoIncField;
    VariedadesNomeVariedade: TStringField;
    IWButton1: TIWButton;
    MultiComboVariedades: TIWDBComboBox;
    ADOQuery1: TADOQuery;
    TalhoesVariedades: TStringField;
    TalhoesIDUsuarioCadastro: TIntegerField;
    TalhoesDataCadastro: TDateTimeField;
    TalhoesIDUsuarioEdicao: TIntegerField;
    TalhoesDataEdicao: TDateTimeField;
    Usuarios: TADOQuery;
    UsuariosUsuarioCadastro: TStringField;
    UsuariosDataCadastro: TDateTimeField;
    UsuariosUsuarioEdicao: TStringField;
    UsuariosDataEdicao: TDateTimeField;
    UsuariosCadastradoPor: TStringField;
    UsuariosEditadoPor: TStringField;
    UsuariosSrc: TDataSource;
    Poligono: TADOQuery;
    PoligonoPoligono: TWideMemoField;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    procedure VoltarLinkClick(Sender: TObject);
    procedure SalvarBtnClick(Sender: TObject);
    procedure UsuariosCalcFields(DataSet: TDataSet);
    procedure IWAppFormCreate(Sender: TObject);
    procedure MultiComboVariedadesAsyncChange(Sender: TObject;
      EventParams: TStringList);
    procedure IWAppFormDestroy(Sender: TObject);
    function InvertePoligono(Str:String):String;
    procedure ProfileLogoutLinkClick(Sender: TObject);
  public
   Editando:Boolean;
  end;

implementation

{$R *.dfm}

uses UserSessionUnit;


function TIWFormEditarTalhao.InvertePoligono(Str:String):String;
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

procedure TIWFormEditarTalhao.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
 //Preencher combo variedades
 With Variedades do
 begin
  Open;
  while not eof do
  begin
   //MultiComboVariedades.Items.Add(VariedadesNomeVariedade.AsString);
   MultiComboVariedades.Items.Values[VariedadesNomeVariedade.AsString]:=VariedadesIDVariedade.AsString;
   next;
  end;
 end;
end;

procedure TIWFormEditarTalhao.SalvarBtnClick(Sender: TObject);
var
 S,ID:String;
begin
 //gravar
 try
  if Editando then
  begin
   TalhoesIDUsuarioEdicao.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
   TalhoesDataEdicao.Value:=Now();
  end
  else
   TalhoesIDUsuarioCadastro.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
  Talhoes.Post;

  //Processar Variedades do talhão
  S:=Self.HiddenFields.Values['VARIEDADES'];
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
  end;

  //Processar Poligono
  With ADOQuery1 do
  begin
   //if WKT.Text<>PoligonoPoligono.AsString then
   begin
    SQl.Clear;
    SQl.Add('Update Talhoes');
    Sql.Add('set Poligono=geography::STGeomFromText('+QuotedStr(WKT.Text)+', 4326)');
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
     //SQl.Strings[SQL.Count-2]:='set Poligono=geography::STGeomFromText('+QuotedStr(InvertePoligono(WKT.Text))+', 4326)';
     WebApplication.ShowMessage('Não foi possível atualizar o Polígono. Verifique.');
    end;
   end
  end;

  Release;
  WebApplication.ShowMessage('Dados gravados com sucesso.');
 except
  on E : Exception do
  begin
   WebApplication.ShowMessage('Não foi possível gravar. Verifique os dados digitados. '+E.Message);
   Exit;
  end;
 end;
end;

procedure TIWFormEditarTalhao.UsuariosCalcFields(DataSet: TDataSet);
begin
 //UsuariosCadastradoPor.AsString:='Cadastrado por '+UsuariosUsuarioCadastro.AsString+' em '+FormatDateTime('dd/mm/yyyy hh:nn',UsuariosDataCadastro.Value);
 //UsuariosEditadoPor.AsString:='Editado por '+UsuariosUsuarioEdicao.AsString+' em '+FormatDateTime('dd/mm/yyyy hh:nn',UsuariosDataEdicao.Value);
end;

procedure TIWFormEditarTalhao.IWAppFormDestroy(Sender: TObject);
begin
 Poligono.Close;
end;

procedure TIWFormEditarTalhao.MultiComboVariedadesAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
 //WebApplication.ShowMessage(MultiComboVariedades.SelectedValue);
 WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#HIDDEN_VARIEDADES'').val($(''#MULTICOMBOVARIEDADES'').val());' );
end;

procedure TIWFormEditarTalhao.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

procedure TIWFormEditarTalhao.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;

end.
