unit UnitEditarClassificacao;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWHTMLControls, Data.DB, Data.Win.ADODB,
  IWCompButton, IWDBStdCtrls, IWCompListbox, IWCompEdit, IWCompJQueryWidget,
  IWCompExtCtrls, IWDBExtCtrls, System.Variants, IWCompLabel, IWCompCheckbox;

type
  TIWFormEditarClassificacao = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    VoltarLink: TIWLink;
    SalvarBtn: TIWButton;
    CancelarBtn: TIWButton;
    EditadoPor: TIWDBLabel;
    Classificacao: TADODataSet;
    ClassificacaoSrc: TDataSource;
    DataProva: TIWDBEdit;
    QtdeDefeitos: TIWDBEdit;
    Coloracao: TIWDBComboBox;
    PercUmidade: TIWDBEdit;
    Aspecto: TIWDBComboBox;
    PercCatacao: TIWDBEdit;
    PercPeneira19: TIWDBEdit;
    PercPeneira18: TIWDBEdit;
    PercPeneira17: TIWDBEdit;
    PercPeneira16: TIWDBEdit;
    PercPeneira15: TIWDBEdit;
    PercPeneira14: TIWDBEdit;
    PercPeneira13: TIWDBEdit;
    PercMoca11: TIWDBEdit;
    PercMoca10: TIWDBEdit;
    PercMoca9: TIWDBEdit;
    PercFundo: TIWDBEdit;
    ChKBebidaComercial: TIWDBEdit;
    TipoBebidaComercial: TIWDBComboBox;
    Obs: TIWDBEdit;
    ClassificacaoIDClassificacao: TAutoIncField;
    ClassificacaoIDProvador: TIntegerField;
    ClassificacaoIDAmostra: TIntegerField;
    ClassificacaoDataProva: TDateTimeField;
    ClassificacaoDefeitos: TIntegerField;
    ClassificacaoColoracao: TStringField;
    ClassificacaoUmidade: TFloatField;
    ClassificacaoAspecto: TStringField;
    ClassificacaoCatacao: TSmallintField;
    ClassificacaoPeneira19: TSmallintField;
    ClassificacaoPeneira18: TSmallintField;
    ClassificacaoPeneira17: TSmallintField;
    ClassificacaoPeneira16: TSmallintField;
    ClassificacaoPeneira15: TSmallintField;
    ClassificacaoPeneira14: TSmallintField;
    ClassificacaoPeneira13: TSmallintField;
    ClassificacaoMoca11: TSmallintField;
    ClassificacaoMoca10: TSmallintField;
    ClassificacaoMoca9: TSmallintField;
    ClassificacaoFundo: TSmallintField;
    ClassificacaoBebidaComercial: TBooleanField;
    ClassificacaoTipoBebidaComercial: TStringField;
    ClassificacaoObs: TMemoField;
    ClassificacaoIDUsuarioEdicao: TIntegerField;
    ClassificacaoDataEdicao: TDateTimeField;
    ClassificacaoTotal: TIntegerField;
    PercTotal: TIWEdit;
    SmallTipo: TIWEdit;
    Usuarios: TADOQuery;
    UsuariosUsuarioEdicao: TStringField;
    UsuariosSrc: TDataSource;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    procedure VoltarLinkClick(Sender: TObject);
    procedure SalvarBtnClick(Sender: TObject);
    procedure UsuariosCalcFields(DataSet: TDataSet);
    procedure ChKBebidaComercialAsyncChange(Sender: TObject;
      EventParams: TStringList);
    procedure PercCatacaoAsyncKeyPress(Sender: TObject;
      EventParams: TStringList);
    procedure ClassificacaoCalcFields(DataSet: TDataSet);
    procedure QtdeDefeitosAsyncChange(Sender: TObject; EventParams: TStringList);
    procedure IWAppFormCreate(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
  public
   Editando:Boolean;
  end;

implementation

{$R *.dfm}

uses UserSessionUnit;


procedure TIWFormEditarClassificacao.ChKBebidaComercialAsyncChange(
  Sender: TObject; EventParams: TStringList);
begin
 if ChKBebidaComercial.Text='off' then
  ClassificacaoTipoBebidaComercial.Value:='';
 ClassificacaoTipoBebidaComercial.Required:=ClassificacaoBebidaComercial.Value;
 TipoBebidaComercial.Enabled:=ChKBebidaComercial.Text='on';
 TipoBebidaComercial.RepaintControl;
end;

procedure TIWFormEditarClassificacao.ClassificacaoCalcFields(DataSet: TDataSet);
begin
 ClassificacaoTotal.Value:=
 ClassificacaoCatacao.Value
 +ClassificacaoPeneira19.Value
 +ClassificacaoPeneira18.Value
 +ClassificacaoPeneira17.Value
 +ClassificacaoPeneira16.Value
 +ClassificacaoPeneira15.Value
 +ClassificacaoPeneira14.Value
 +ClassificacaoPeneira13.Value
 +ClassificacaoMoca11.Value
 +ClassificacaoMoca10.Value
 +ClassificacaoMoca9.Value
 +ClassificacaoFundo.Value;
end;

procedure TIWFormEditarClassificacao.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
end;

procedure TIWFormEditarClassificacao.QtdeDefeitosAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
 //Calcular SmallTipo à partir dos defeitos
 case ClassificacaoDefeitos.Value of
       0..6: SmallTipo.Text:='2';
       7..9: SmallTipo.Text:='2/3';
     10..13: SmallTipo.Text:='3';
     14..21: SmallTipo.Text:='3/4';
     22..30: SmallTipo.Text:='4';
     31..45: SmallTipo.Text:='4/5';
     46..60: SmallTipo.Text:='5';
     61..90: SmallTipo.Text:='5/6';
    91..120: SmallTipo.Text:='6';
   121..180: SmallTipo.Text:='6/7';
   181..240: SmallTipo.Text:='7';
   241..335: SmallTipo.Text:='7/8';
   336..450: SmallTipo.Text:='8';
 end;
 SmallTipo.RepaintControl;
end;

procedure TIWFormEditarClassificacao.PercCatacaoAsyncKeyPress(Sender: TObject;
  EventParams: TStringList);
begin
 PercTotal.Text:=
 IntToStr(ClassificacaoCatacao.Value
 +ClassificacaoPeneira19.Value
 +ClassificacaoPeneira18.Value
 +ClassificacaoPeneira17.Value
 +ClassificacaoPeneira16.Value
 +ClassificacaoPeneira15.Value
 +ClassificacaoPeneira14.Value
 +ClassificacaoPeneira13.Value
 +ClassificacaoMoca11.Value
 +ClassificacaoMoca10.Value
 +ClassificacaoMoca9.Value
 +ClassificacaoFundo.Value);
 PercTotal.RepaintControl;
end;

procedure TIWFormEditarClassificacao.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

procedure TIWFormEditarClassificacao.SalvarBtnClick(Sender: TObject);
begin
 //gravar
 try
  if PercTotal.Text<>'100' then
  begin
   WebApplication.ShowMessage('O total das percentagens deve ser de 100%. Verifique.');
   exit;
  end;
  {if Editando then
  begin
   //AssociadosIDUsuarioEdicao.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
   //AssociadosDataEdicao.Value:=Now();
  end
  else
   //AssociadosIDUsuarioCadastro.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;}
  Classificacao.Post;
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

procedure TIWFormEditarClassificacao.UsuariosCalcFields(DataSet: TDataSet);
begin
 //UsuariosCadastradoPor.AsString:='Cadastrado por '+UsuariosUsuarioCadastro.AsString+' em '+FormatDateTime('dd/mm/yyyy hh:nn',UsuariosDataCadastro.Value);
 //UsuariosEditadoPor.AsString:='Editado por '+UsuariosUsuarioEdicao.AsString+' em '+FormatDateTime('dd/mm/yyyy hh:nn',UsuariosDataEdicao.Value);
end;

procedure TIWFormEditarClassificacao.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;

end.
