unit UnitEditarLoteAmostra;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWHTMLControls, Data.DB, Data.Win.ADODB,
  IWCompButton, IWDBStdCtrls, IWCompListbox, IWCompEdit, IWCompJQueryWidget,
  IWCompExtCtrls, IWDBExtCtrls, System.Variants, IWCompLabel, IWCompCheckbox;

type
  TIWFormEditarLoteAmostra = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    VoltarLink: TIWLink;
    SalvarBtn: TIWButton;
    IWJQueryWidget1: TIWJQueryWidget;
    CancelarBtn: TIWButton;
    CadastradoPor: TIWDBLabel;
    EditadoPor: TIWDBLabel;
    Lotes: TADODataSet;
    LotesSrc: TDataSource;
    Usuarios: TADOQuery;
    UsuariosSrc: TDataSource;
    Propriedades: TADOQuery;
    PropriedadesSrc: TDataSource;
    PropriedadesIDPropriedade: TStringField;
    PropriedadesPropriedade: TStringField;
    Associados: TADOQuery;
    AssociadosSrc: TDataSource;
    AssociadosAssociado: TStringField;
    AssociadosCombo: TIWDBLookupComboBox;
    PropriedadesCombo: TIWDBLookupComboBox;
    QtdeEdit: TIWDBEdit;
    SafraCombo: TIWDBComboBox;
    UsuariosUsuarioCadastro: TStringField;
    UsuariosUsuarioEdicao: TStringField;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    AssociadosIDAssociado: TAutoIncField;
    MulticomboTalhoes: TIWDBEdit;
    MetodoPreparo: TIWDBComboBox;
    LotesIDLote: TAutoIncField;
    LotesIDAssociado: TIntegerField;
    LotesIDPropriedade: TStringField;
    LotesSafra: TStringField;
    LotesQtdeKg: TIntegerField;
    LotesMetodoPreparo: TStringField;
    LotesIDUsuarioCadastro: TIntegerField;
    LotesDataCadastro: TDateTimeField;
    LotesIDUsuarioEdicao: TIntegerField;
    LotesDataEdicao: TDateTimeField;
    LotesTalhoes: TStringField;
    Talhoes: TADOQuery;
    TalhoesIDTalhao: TAutoIncField;
    TalhoesNomeTalhao: TStringField;
    TalhoesSrc: TDataSource;
    procedure VoltarLinkClick(Sender: TObject);
    procedure AssociadosComboAsyncChange(Sender: TObject;
      EventParams: TStringList);
    procedure SalvarBtnClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
    procedure MulticomboTalhoesAsyncChange(Sender: TObject;
      EventParams: TStringList);
    procedure IWAppFormRender(Sender: TObject);
  public
   Editando:Boolean;
  end;

implementation

{$R *.dfm}

uses UserSessionUnit;


procedure TIWFormEditarLoteAmostra.AssociadosComboAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
 PropriedadesCombo.Enabled:=LotesIDAssociado.AsString<>'';
 with propriedades do
 begin
  Sql[sql.Count-2]:='Where P.IDAssociado='+LotesIDAssociado.AsString;
  Open;
 end;
 PropriedadesCombo.RepaintControl;
end;

procedure TIWFormEditarLoteAmostra.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
end;

procedure TIWFormEditarLoteAmostra.IWAppFormRender(Sender: TObject);
var
 S:String;
begin
 //Preencher opções do combo Talhoes
 S:='names=[';
 With Talhoes do
 begin
  SQl[SQl.Count-2]:='where T.IDPropriedade='+QuotedStr(LotesIDPropriedade.AsString);
  Open;
  while not eof do
  begin
   S:=S+'{''id'':'''+TalhoesIDTalhao.AsString+''',''text'':'''+TalhoesNomeTalhao.AsString+'''},';
   next;
  end;
   S[length(S)]:=']'; //Substitui ultima virgula por ']'
  Close;
 end;
 MulticomboTalhoes.ExtraTagParams.Add(S);
end;

procedure TIWFormEditarLoteAmostra.MulticomboTalhoesAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
 WebApplication.CallBackResponse.AddJavaScriptToExecute('$(''#HIDDEN_TALHOES'').val($(''#MULTICOMBOTALHOES'').val());' );
end;

procedure TIWFormEditarLoteAmostra.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

procedure TIWFormEditarLoteAmostra.SalvarBtnClick(Sender: TObject);
var
 S, ID: String;
begin
 //gravar
 try
  if Editando then
  begin
   LotesIDUsuarioEdicao.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
   LotesDataEdicao.Value:=Now();
  end
  else
   LotesIDUsuarioCadastro.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
  Lotes.Post;
  //Atualizar talhoes do Lote
  S:=LotesTalhoes.AsString;
  With TIWUserSession(WebApplication.Data).ADOQuery1 do
  begin
   if Editando then
   begin
    ID:=LotesIDLote.AsString;
    Sql.Clear;
    Sql.Add('Delete from TalhoesLotes');
    SQl.Add('Where IDLote='+ID);
    ExecSQL;
   end
   else //Talhão Novo
   begin
    SQl.Clear;
    SQL.Add('Select @@identity as ID from Lotes');
    Open;
    ID:=FieldByName('ID').AsString;
    Close;
   end;
   //Cadastrar Talhoes
   Sql.Clear;
   SQl.Add('Insert Into TalhoesLotes');
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

procedure TIWFormEditarLoteAmostra.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;

end.
