unit UnitEditarPropriedade;

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
  TIWFormEditarPropriedade = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    VoltarLink: TIWLink;
    Propriedades: TADODataSet;
    PropriedadesSrc: TDataSource;
    Usuarios: TADOQuery;
    SalvarBtn: TIWButton;
    Municipios: TADOQuery;
    MunicipiosUF: TStringField;
    MunicipiosCodigoMunicipio: TStringField;
    MunicipiosNomeMunicipio: TStringField;
    MunicipiosSrc: TDataSource;
    IWJQueryWidget1: TIWJQueryWidget;
    CancelarBtn: TIWButton;
    CadastradoPor: TIWDBLabel;
    EditadoPor: TIWDBLabel;
    UsuariosSrc: TDataSource;
    CNPJPropriedade: TIWDBEdit;
    NomePropriedade: TIWDBEdit;
    UF: TIWDBComboBox;
    Municipio: TIWDBLookupComboBox;
    CNPJAssociado: TIWDBLookupComboBox;
    QtdeAltitude: TIWDBEdit;
    QtdeHectaresCafe: TIWDBEdit;
    LatLong: TIWDBEdit;
    Historico: TIWDBMemo;
    QtdeColhedeiraPropria: TIWDBEdit;
    QtdeColhedeiraAlugada: TIWDBEdit;
    QtdeLavador: TIWDBEdit;
    QtdeDescascador: TIWDBEdit;
    QtdeTerreiroTerra: TIWDBEdit;
    AreaTerreiroTerra: TIWDBEdit;
    QtdeTerreiroCimento: TIWDBEdit;
    AreaTerreiroCimento: TIWDBEdit;
    QtdeTerreiroAsfalto: TIWDBEdit;
    AreaTerreiroAsfalto: TIWDBEdit;
    QtdeTerreiroSuspenso: TIWDBEdit;
    AreaTerreiroSuspenso: TIWDBEdit;
    QtdeSecadorVertical: TIWDBEdit;
    CapacidadeSecadorVertical: TIWDBEdit;
    QtdeSecadorHorizontal: TIWDBEdit;
    CapacidadeSecadorHorizontal: TIWDBEdit;
    QtdeSecadorRotativo: TIWDBEdit;
    CapacidadeSecadorRotativo: TIWDBEdit;
    QtdeSiloSecador: TIWDBEdit;
    CapacidadeSiloSecador: TIWDBEdit;
    QtdeTulhaMadeira: TIWDBEdit;
    CapacidadeTulhasMadeira: TIWDBEdit;
    QtdeTulhaFerro: TIWDBEdit;
    CapacidadeTulhaFerro: TIWDBEdit;
    QtdeMaquinaBeneficio: TIWDBEdit;
    QtdeRebeneficioPeneirao: TIWDBEdit;
    QtdeRebeneficioDensimetrica: TIWDBEdit;
    QtdeRebeneficioEletronica: TIWDBEdit;
    QtdeRebeneficioBalao: TIWDBEdit;
    QtdeArmazemProprio: TIWDBEdit;
    IWDBEdit36: TIWDBEdit;
    PercColheitaMecanica: TIWDBEdit;
    CapacidadeArmazem: TIWDBEdit;
    MultiComboMetodoArmazenagem: TIWDBEdit;
    PropriedadesIDPropriedade: TStringField;
    PropriedadesNomePropriedade: TStringField;
    PropriedadesUF: TStringField;
    PropriedadesCodigoMunicipio: TStringField;
    PropriedadesEndereco: TStringField;
    PropriedadesAltitude: TFloatField;
    PropriedadesHectaresCafe: TIntegerField;
    PropriedadesLatLong: TBlobField;
    PropriedadesHistorico: TMemoField;
    PropriedadesColhedeiraPropria: TSmallintField;
    PropriedadesColhedeiraAlugada: TSmallintField;
    PropriedadesQtdeLavador: TSmallintField;
    PropriedadesQtdeDescascador: TSmallintField;
    PropriedadesQtdeTerreiroTerra: TSmallintField;
    PropriedadesAreaTerreiroTerra: TSmallintField;
    PropriedadesQtdeTerreiroCimento: TSmallintField;
    PropriedadesAreaTerreiroCimento: TSmallintField;
    PropriedadesQtdeTerreiroAsfalto: TSmallintField;
    PropriedadesAreaTerreiroAsfalto: TSmallintField;
    PropriedadesQtdeTerreiroSuspenso: TSmallintField;
    PropriedadesAreaTerreiroSuspenso: TSmallintField;
    PropriedadesQtdeSecadorVertical: TSmallintField;
    PropriedadesCapacidadeSecadorVertical: TSmallintField;
    PropriedadesQtdeSecadorHorizontal: TSmallintField;
    PropriedadesCapacidadeSecadorHorizontal: TSmallintField;
    PropriedadesQtdeSecadorRotativo: TSmallintField;
    PropriedadesCapacidadeSecadorRotativo: TSmallintField;
    PropriedadesQtdeSiloSecador: TSmallintField;
    PropriedadesCapacidadeSiloSecador: TSmallintField;
    PropriedadesQtdeTulhaMadeira: TSmallintField;
    PropriedadesCapacidadeTulhasMadeira: TSmallintField;
    PropriedadesQtdeTulhaFerro: TSmallintField;
    PropriedadesCapacidadeTulhaFerro: TSmallintField;
    PropriedadesQtdeMaquinaBeneficio: TSmallintField;
    PropriedadesQtdeRebeneficioPeneirao: TSmallintField;
    PropriedadesQtdeRebeneficioDensimetrica: TSmallintField;
    PropriedadesQtdeRebeneficioEletronica: TSmallintField;
    PropriedadesQtdeRebeneficioBalao: TSmallintField;
    PropriedadesQtdeArmazemProprio: TSmallintField;
    PropriedadesCapacidadeArmazem: TSmallintField;
    PropriedadesRastreiaLotes: TBooleanField;
    PropriedadesControleLavoura: TBooleanField;
    PropriedadesControleLavador: TBooleanField;
    PropriedadesControleTerreiro: TBooleanField;
    PropriedadesControleSecador: TBooleanField;
    PropriedadesControleTulha: TBooleanField;
    PropriedadesControleBeneficio: TBooleanField;
    PropriedadesControleRebeneficio: TBooleanField;
    PropriedadesAgronomo: TBooleanField;
    PropriedadesBoiaCereja: TBooleanField;
    PropriedadesAmostragemMaturacao: TBooleanField;
    PropriedadesProvaPorTalhao: TBooleanField;
    PropriedadesColheitaSeletiva: TBooleanField;
    PropriedadesColheitaMecanica: TSmallintField;
    PropriedadesConfereUmidade: TBooleanField;
    PropriedadesMetodoArmazenagem: TStringField;
    PropriedadesIDUsuarioCadastro: TIntegerField;
    PropriedadesDataCadastro: TDateTimeField;
    PropriedadesIDUsuarioEdicao: TIntegerField;
    PropriedadesDataEdicao: TDateTimeField;
    ChkRastreiaLotes: TIWDBEdit;
    ChkControleLavoura: TIWDBEdit;
    ChkControleLavador: TIWDBEdit;
    ChkControleTerreiro: TIWDBEdit;
    ChkControleSecador: TIWDBEdit;
    ChkControleTulha: TIWDBEdit;
    ChkControleBeneficio: TIWDBEdit;
    ChkControleRebeneficio: TIWDBEdit;
    ChkAgronomo: TIWDBEdit;
    ChkBoiaCereja: TIWDBEdit;
    ChkAmostragemMaturacao: TIWDBEdit;
    ChkProvaPorTalhao: TIWDBEdit;
    ChkColheitaSeletiva: TIWDBEdit;
    ChkConfereUmidade: TIWDBEdit;
    Endereco: TIWDBEdit;
    Associados: TADOQuery;
    AssociadosNomeAssociado: TStringField;
    AssociadosSrc: TDataSource;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    UsuariosUsuarioCadastro: TStringField;
    UsuariosUsuarioEdicao: TStringField;
    AreaReservaLegal: TIWDBEdit;
    AreaAPP: TIWDBEdit;
    ChkAppComputaRL: TIWDBEdit;
    PropriedadesAreaReservaLegal: TFloatField;
    PropriedadesAreaAPP: TFloatField;
    PropriedadesAppComputaRL: TBooleanField;
    PropriedadesIDAssociado: TIntegerField;
    AssociadosIDAssociado: TAutoIncField;
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


procedure TIWFormEditarPropriedade.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
 //Definir opções do combo
 MultiComboMetodoArmazenagem.ExtraTagParams.Add('names=[{''id'':''Sacaria'',''text'':''Sacaria''},'+
  '{''id'':''Bigbag'',''text'':''Bigbag''},{''id'':''Granel'',''text'':''Granel''}]');
 with Associados do
 begin
  Sql[SQl.Count-2]:='where IDCliente='+IntToStr(TIWUserSession(WebApplication.Data).IDCliente);
  Open;
 end;
end;

procedure TIWFormEditarPropriedade.IWAppFormDestroy(Sender: TObject);
begin
 Associados.Close;
end;

procedure TIWFormEditarPropriedade.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

procedure TIWFormEditarPropriedade.SalvarBtnClick(Sender: TObject);
begin
 //gravar
 try
  if Editando then
  begin
   PropriedadesIDUsuarioEdicao.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
   PropriedadesDataEdicao.Value:=Now();
  end
  else
   PropriedadesIDUsuarioCadastro.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
  Propriedades.Post;
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

procedure TIWFormEditarPropriedade.UFAsyncChange(Sender: TObject;
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

procedure TIWFormEditarPropriedade.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;

end.
