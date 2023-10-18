unit UnitEditarTalhaoLote;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWHTMLControls, Data.DB, Data.Win.ADODB,
  IWCompButton, IWDBStdCtrls, IWCompListbox, IWCompEdit, IWCompJQueryWidget,
  IWCompExtCtrls, IWDBExtCtrls, System.Variants, IWCompLabel, IWCompCheckbox;

type
  TIWFormEditarTalhaoLote = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    VoltarLink: TIWLink;
    SalvarBtn: TIWButton;
    CancelarBtn: TIWButton;
    CadastradoPor: TIWDBLabel;
    EditadoPor: TIWDBLabel;
    TalhoesLotes: TADODataSet;
    TalhoesLotesSrc: TDataSource;
    TalhoesLotesIDLote: TIntegerField;
    TalhoesLotesIDTalhao: TIntegerField;
    TalhoesLotesIDTalhaoLote: TAutoIncField;
    TalhoesLotesMetodoPreparo: TStringField;
    TalhoesLotesDtIniColheita: TDateTimeField;
    TalhoesLotesDtFimColheita: TDateTimeField;
    TalhoesLotesTempoColheitaTerreiro: TStringField;
    TalhoesLotesTipoTerreiro: TStringField;
    TalhoesLotesDtEntradaTerreiro: TDateTimeField;
    TalhoesLotesDtSaidaTerreiro: TDateTimeField;
    TalhoesLotesEspessura: TSmallintField;
    TalhoesLotesMetodoRodagem: TStringField;
    TalhoesLotesFrequenciaRodagem: TSmallintField;
    TalhoesLotesCafeChuvado: TBooleanField;
    TalhoesLotesTempMedRodagem: TSmallintField;
    TalhoesLotesTipoSecador: TStringField;
    TalhoesLotesDtEntradaSecador: TDateTimeField;
    TalhoesLotesDtSaidaSecador: TDateTimeField;
    TalhoesLotesTempFornalha: TSmallintField;
    TalhoesLotesTempMassa: TSmallintField;
    TalhoesLotesPeriodoDescanso: TSmallintField;
    TalhoesLotesDtEntradaTulha: TDateTimeField;
    TalhoesLotesDtSaidaTulha: TDateTimeField;
    TalhoesLotesUmidadeAoBeneficiar: TSmallintField;
    TalhoesLotesLocalArmazenagem: TStringField;
    TalhoesLotesMetodoArmazenagem: TStringField;
    TalhoesLotesIDUsuarioCadastro: TIntegerField;
    TalhoesLotesIDUsuarioEdicao: TIntegerField;
    MetodoPreparo: TIWDBComboBox;
    DataIniColheita: TIWDBEdit;
    DataFimColheita: TIWDBEdit;
    TipoTerreiro: TIWDBComboBox;
    DataEntradaTerreiro: TIWDBEdit;
    DataSaidaTerreiro: TIWDBEdit;
    QtdeEspessura: TIWDBEdit;
    MetodoRodagem: TIWDBComboBox;
    ChkCafeChuvado: TIWDBEdit;
    TemperMedRodagem: TIWDBEdit;
    TipoSecador: TIWDBComboBox;
    DataEntradaSecador: TIWDBEdit;
    DataSaidaSecador: TIWDBEdit;
    TemperMassa: TIWDBEdit;
    TemperFornalha: TIWDBEdit;
    DataEntradaTulha: TIWDBEdit;
    QtdePeriodoDescanso: TIWDBEdit;
    DataSaidaTulha: TIWDBEdit;
    MetodoArmazenagem: TIWDBComboBox;
    QtdeUmidadeAoBeneficiar: TIWDBEdit;
    IDTalhao: TIWDBLookupComboBox;
    Talhoes: TADOQuery;
    TalhoesSrc: TDataSource;
    TalhoesIDTalhao: TAutoIncField;
    TalhoesNomeTalhao: TStringField;
    Lote: TADOQuery;
    LoteSrc: TDataSource;
    NomeAssociado: TIWDBEdit;
    NomePropriedade: TIWDBEdit;
    LoteIDLote: TAutoIncField;
    LoteNomePropriedade: TStringField;
    LoteNomeAssociado: TStringField;
    LoteSafra: TStringField;
    LoteQtdeKg: TIntegerField;
    LoteDataCadastro: TDateTimeField;
    LoteAmostras: TIntegerField;
    QtdeFrequenciaRodagem: TIWDBEdit;
    TalhoesLotesTipoTulha: TStringField;
    TipoTulha: TIWDBComboBox;
    LocalArmazenagem: TIWDBEdit;
    TEMPOCOLHEITATERREIRO: TIWDBComboBox;
    Usuarios: TADOQuery;
    UsuariosSrc: TDataSource;
    TalhoesLotesDataCadastro: TDateTimeField;
    TalhoesLotesDataEdicao: TDateTimeField;
    UsuariosUsuarioCadastro: TStringField;
    UsuariosUsuarioEdicao: TStringField;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    NomeTerreiro: TIWDBEdit;
    TalhoesLotesNomeTerreiro: TStringField;
    TalhoesLotesNomeSecador: TStringField;
    TalhoesLotesNomeTulha: TStringField;
    NomeSecador: TIWDBEdit;
    NomeTulha: TIWDBEdit;
    procedure VoltarLinkClick(Sender: TObject);
    procedure SalvarBtnClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
  public
   Editando:Boolean;
  end;

implementation

{$R *.dfm}

uses UserSessionUnit;


procedure TIWFormEditarTalhaoLote.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
end;

procedure TIWFormEditarTalhaoLote.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

procedure TIWFormEditarTalhaoLote.SalvarBtnClick(Sender: TObject);
begin
 //gravar
 try
  if Editando then
  begin
   TalhoesLotesIDUsuarioEdicao.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
   TalhoesLotesDataEdicao.Value:=Now();
  end
  else
   TalhoesLotesIDUsuarioCadastro.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
  TalhoesLotes.Post;
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

procedure TIWFormEditarTalhaoLote.VoltarLinkClick(Sender: TObject);
begin
 TalhoesLotes.Cancel;
 Release;
end;

end.
