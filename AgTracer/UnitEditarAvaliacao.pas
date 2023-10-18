unit UnitEditarAvaliacao;

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
  TIWFormEditarAvaliacao = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    VoltarLink: TIWLink;
    SalvarBtn: TIWButton;
    CancelarBtn: TIWButton;
    EditadoPor: TIWDBLabel;
    Avaliacao: TADODataSet;
    AvaliacaoScr: TDataSource;
    DataAvaliacao: TIWDBEdit;
    QtdeTempoTorra: TIWDBEdit;
    NotaAroma: TIWDBEdit;
    NotaUniformidade: TIWDBEdit;
    NotaXicaraLimpa: TIWDBEdit;
    NotaDocura: TIWDBEdit;
    NotaSabor: TIWDBEdit;
    NotaAcidez: TIWDBEdit;
    NotaCorpo: TIWDBEdit;
    NotaRetrogosto: TIWDBEdit;
    NotaBalanco: TIWDBEdit;
    NotaGeral: TIWDBEdit;
    NotaXicarasDefeitosGraves: TIWDBEdit;
    Obs: TIWDBMemo;
    NotaXicarasDefeitosLeves: TIWDBEdit;
    PontuacaoFinal: TIWEdit;
    Usuarios: TADOQuery;
    UsuariosUsuarioEdicao: TStringField;
    UsuariosSrc: TDataSource;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    IWJQueryRosa: TIWJQueryWidget;
    IWJQueryCombo: TIWJQueryWidget;
    Sabores: TADOQuery;
    SaboresIDSabor: TIntegerField;
    SaboresNomeSabor: TStringField;
    SaboresCor: TStringField;
    SaboresPredominancia: TIntegerField;
    AvaliacaoIDAvaliacao: TAutoIncField;
    AvaliacaoIDProvador: TIntegerField;
    AvaliacaoIDAmostra: TIntegerField;
    AvaliacaoDataAvaliacao: TDateTimeField;
    AvaliacaoTempoTorra: TSmallintField;
    AvaliacaoAroma: TFloatField;
    AvaliacaoAromaSeca: TFloatField;
    AvaliacaoAromaUmida: TFloatField;
    AvaliacaoSabor: TFloatField;
    AvaliacaoRetrogosto: TFloatField;
    AvaliacaoAcidez: TFloatField;
    AvaliacaoAcidezIntensidade: TFloatField;
    AvaliacaoCorpo: TFloatField;
    AvaliacaoCorpoNivel: TFloatField;
    AvaliacaoUniformidade: TFloatField;
    AvaliacaoBalanco: TFloatField;
    AvaliacaoXicaraLimpa: TFloatField;
    AvaliacaoDocura: TFloatField;
    AvaliacaoGeral: TFloatField;
    AvaliacaoXicarasDefeitosLeves: TFloatField;
    AvaliacaoXicarasDefeitosGraves: TFloatField;
    AvaliacaoObs: TMemoField;
    AvaliacaoIDUsuarioEdicao: TIntegerField;
    AvaliacaoDataEdicao: TDateTimeField;
    NotaAromaSeca: TIWDBEdit;
    NotaAromaUmida: TIWDBEdit;
    NotaAcidezIntensidade: TIWDBEdit;
    NotaCorpoNivel: TIWDBEdit;
    NotaColoracao: TIWDBEdit;
    AvaliacaoColoracaoTorra: TFloatField;
    procedure VoltarLinkClick(Sender: TObject);
    procedure SalvarBtnClick(Sender: TObject);
    procedure UsuariosCalcFields(DataSet: TDataSet);
    procedure IWAppFormCreate(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
    procedure UpdateSabores(EventParams: TStringList);
    procedure InicializarSliders(EventParams: TStringList);
  public
   Editando:Boolean;
  end;

implementation

{$R *.dfm}

uses UserSessionUnit;


procedure TIWFormEditarAvaliacao.UpdateSabores(EventParams: TStringList);
begin
 //Atualiza os sabores e suas predominancias
end;

procedure TIWFormEditarAvaliacao.InicializarSliders(EventParams: TStringList);
begin
 //Inicializa sabores já armazenados no BD
 if Editando then
 begin
  //Sabores
  With Sabores do
  begin
   Open;
   if Sabores.RecordCount>0 then
   while not EOF do
   begin
    //WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$("#saborescombo").val("'+SaboresIDSabor.AsString+'").trigger("change");' );
    //WebApplication.CallBackResponse.AddJavaScriptToExecute(  'var obj={"id":"'+SaboresIDSabor.AsString+'","text":"'+SaboresNomeSabor.AsString+'"}; $("#saborescombo").select2("data", obj); $("#saborescombo").trigger("select2-selecting");' );
    WebApplication.CallBackResponse.AddJavaScriptToExecute(  'var obj={"id":"'+SaboresIDSabor.AsString+'","text":"'+SaboresNomeSabor.AsString+'","value":'+SaboresPredominancia.AsString+'};'+
    '$("#saborescombo").select2("data", $("#saborescombo").select2("data").concat(obj), true);');
    // WebApplication.CallBackResponse.AddJavaScriptToExecute(  '$("#saborescombo").select2("val", $("#saborescombo").select2("val").concat("'+SaboresIDSabor.AsString+'")); $("#saborescombo").trigger("select2-selecting");' );
    Next;
   end;
   Close;
  end;
 end;
end;

procedure TIWFormEditarAvaliacao.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
 WebApplication.RegisterCallBack('UpdateSabores', UpdateSabores);
 WebApplication.RegisterCallBack('InicializarSliders', InicializarSliders);
end;

procedure TIWFormEditarAvaliacao.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

procedure TIWFormEditarAvaliacao.SalvarBtnClick(Sender: TObject);
var
 S, Str:String;
begin
 //gravar
 try
  Avaliacao.Post;
  //Gravar Sabores e Predominancias
  With TIWUserSession(WebApplication.Data).ADOQuery1 do
  begin //Excluir Sabores anteriores
   SQl.Clear;
   Sql.Add('Delete from SaboresAvaliacao');
   Sql.Add('Where IDAvaliacao='+AvaliacaoIDAvaliacao.AsString);
   ExecSql;
  end;
  //Criar String de atualização
  S:=Self.HiddenFields.Values['SLIDERRESULTS'];
  while Pos('slider_',S)<>0 do
  begin
   Str:=AvaliacaoIDAvaliacao.AsString+',';
   Delete(S,1,Pos('_',S));
   Str:=Str+Copy(S,1,pos('"',S)-1)+','; //Codigo do Sabor
   Delete(S,1,Pos('y":',S)+2);
   Str:=Str+Copy(S,1,pos(',',S)-1); //Predominancia
   //Gravar
   With TIWUserSession(WebApplication.Data).ADOQuery1 do
   begin //Excluir Sabores anteriores
    SQl.Clear;
    Sql.Add('Insert Into SaboresAvaliacao(IDAvaliacao,IDSabor,Predominancia)');
    Sql.Add('Values('+Str+')');
    ExecSql;
   end;
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

procedure TIWFormEditarAvaliacao.UsuariosCalcFields(DataSet: TDataSet);
begin
 //UsuariosCadastradoPor.AsString:='Cadastrado por '+UsuariosUsuarioCadastro.AsString+' em '+FormatDateTime('dd/mm/yyyy hh:nn',UsuariosDataCadastro.Value);
 //UsuariosEditadoPor.AsString:='Editado por '+UsuariosUsuarioEdicao.AsString+' em '+FormatDateTime('dd/mm/yyyy hh:nn',UsuariosDataEdicao.Value);
end;

procedure TIWFormEditarAvaliacao.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;

end.
