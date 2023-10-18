unit UnitEditarInscricao;

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
  TIWFormEditarInscricao = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    VoltarLink: TIWLink;
    Amostras: TADODataSet;
    AmostrasSrc: TDataSource;
    Usuarios: TADOQuery;
    SalvarBtn: TIWButton;
    Municipios: TADOQuery;
    MunicipiosUF: TStringField;
    MunicipiosCodigoMunicipio: TStringField;
    MunicipiosNomeMunicipio: TStringField;
    MunicipiosSrc: TDataSource;
    CancelarBtn: TIWButton;
    CadastradoPor: TIWDBLabel;
    EditadoPor: TIWDBLabel;
    UsuariosSrc: TDataSource;
    NomePropriedade: TIWDBEdit;
    UF: TIWDBComboBox;
    Municipio: TIWDBLookupComboBox;
    CNPJAssociado: TIWDBLookupComboBox;
    INTInscricaoEstadual: TIWDBEdit;
    ComboVariedade: TIWDBEdit;
    ComboCategoria: TIWDBEdit;
    QtdeSacas: TIWDBEdit;
    CNPJPropriedade: TIWDBEdit;
    Associados: TADOQuery;
    AssociadosSrc: TDataSource;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    Armazem: TIWDBEdit;
    Classificador: TIWDBEdit;
    FoneClassificador: TIWDBEdit;
    AmostrasIDConcurso: TIntegerField;
    AmostrasIDAmostraConcurso: TAutoIncField;
    AmostrasCNPJPropriedade: TStringField;
    AmostrasNomePropriedade: TStringField;
    AmostrasInscricaoEstadual: TStringField;
    AmostrasUF: TStringField;
    AmostrasCodigoMunicipio: TStringField;
    AmostrasArmazem: TStringField;
    AmostrasClassificador: TStringField;
    AmostrasFoneClassificador: TStringField;
    AmostrasVariedadeCafe: TStringField;
    AmostrasCategoriaConcurso: TStringField;
    AmostrasQtdeSacas: TIntegerField;
    AmostrasQRCODE: TGuidField;
    AmostrasIDUsuarioCadastro: TIntegerField;
    AmostrasDataCadastro: TDateTimeField;
    AmostrasIDUsuarioEdicao: TIntegerField;
    AmostrasDataEdicao: TDateTimeField;
    AmostrasStatus: TStringField;
    AmostrasObs: TMemoField;
    ComboStatus: TIWDBEdit;
    Obs: TIWDBMemo;
    Variedades: TADOQuery;
    VariedadesIDVariedade: TAutoIncField;
    VariedadesNomeVariedade: TStringField;
    UsuariosUsuarioCadastro: TStringField;
    UsuariosUsuarioEdicao: TStringField;
    Sequencial: TIWDBEdit;
    AssociadosIDAssociado: TAutoIncField;
    AssociadosNomeAssociado: TStringField;
    AmostrasIDAssociado: TIntegerField;
    procedure VoltarLinkClick(Sender: TObject);
    procedure SalvarBtnClick(Sender: TObject);
    procedure UFAsyncChange(Sender: TObject; EventParams: TStringList);
    procedure IWAppFormCreate(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
    procedure IWAppFormDestroy(Sender: TObject);
  public
   Editando:Boolean;
  end;

implementation

{$R *.dfm}

uses UserSessionUnit;


procedure TIWFormEditarInscricao.IWAppFormCreate(Sender: TObject);
var
 S: String;
 ListaCategorias: TStringList;
 I: Integer;
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
 //Definir opções do combo Variedades
 S:='names=[';
 With Variedades do
 begin
  Open;
  while not eof do
  begin
   S:=S+'{''id'':'''+VariedadesNomeVariedade.AsString+''',''text'':'''+VariedadesNomeVariedade.AsString+'''},';
   next;
  end;
   S[length(S)]:=']'; //Substitui ultima virgula por ']'
  Close;
 end;
 ComboVariedade.ExtraTagParams.Add(S);
 //Opções do Combo Status
 ComboStatus.ExtraTagParams.Add('names=['+'{''id'':''Classificada'',''text'':''Classificada''},'+
 '{''id'':''Desclassificada'',''text'':''Desclassificada''}]');
 //Associados
 with Associados do
 begin
  Sql[SQl.Count-2]:='where IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente);
  Open;
 end;
end;

procedure TIWFormEditarInscricao.IWAppFormDestroy(Sender: TObject);
begin
 Associados.Close;
end;

procedure TIWFormEditarInscricao.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

procedure TIWFormEditarInscricao.SalvarBtnClick(Sender: TObject);
begin
 //gravar
 try
  if Editando then
  begin
   AmostrasIDUsuarioEdicao.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
   AmostrasDataEdicao.Value:=Now();
  end
  else
   AmostrasIDUsuarioCadastro.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
  Amostras.Post;
  WebApplication.ShowMessage('Dados gravados com sucesso.');
  Release;
 except
  on E : Exception do
  begin
   WebApplication.ShowMessage('Não foi possível gravar. Verifique os dados digitados. '+E.Message);
   Exit;
  end;
 end;
end;

procedure TIWFormEditarInscricao.UFAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
 Municipio.Enabled:=UF.SelectedValue<>'';
 With Municipios do
 begin
  Close;
  SQL[SQL.Count-2]:='where UF='+QuotedStr(UF.SelectedValue);
  Open;
 end;
 Municipio.RepaintControl;
end;

procedure TIWFormEditarInscricao.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;

end.
