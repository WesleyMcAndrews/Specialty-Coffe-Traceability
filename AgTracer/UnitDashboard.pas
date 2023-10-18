unit UnitDashboard;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWHTMLControls, Vcl.Menus, IWCompLabel,
  IWCompJQueryWidget, Data.DB, Data.Win.ADODB;

type
  TIWFormDashboard = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    VariedadesLink: TIWLink;
    AssociadosLink: TIWLink;
    PropriedadesLink: TIWLink;
    AlterarSenhaLink: TIWLink;
    UsuariosLink: TIWLink;
    AmostrasLink: TIWLink;
    ProvasLink: TIWLink;
    UserName: TIWLabel;
    ProfileLogoutLink: TIWLink;
    AmostrasAAnalisarLabel: TIWLabel;
    PontuacaoMediaEspeciaisLabel: TIWLabel;
    AreaCultivadaLabel: TIWLabel;
    Cotacao: TADOQuery;
    IWJQueryCotacao: TIWJQueryWidget;
    CotacaoCotacao: TStringField;
    AmostrasAAnalisar: TADOQuery;
    PontuacaoMedia: TADOQuery;
    AmostrasAAnalisarAmostras: TIntegerField;
    PontuacaoMediaMedia: TFloatField;
    AreaCultivada: TADOQuery;
    AreaCultivadaArea: TFloatField;
    PopularidadeMarcaLabel: TIWLabel;
    ConcursosLink: TIWLink;
    ConcursosInscricoesLink: TIWLink;
    ConcursosResultadosLink: TIWLink;
    procedure AssociadosLinkClick(Sender: TObject);
    procedure PropriedadesLinkClick(Sender: TObject);
    procedure AmostrasLinkClick(Sender: TObject);
    procedure ProvasLinkClick(Sender: TObject);
    procedure UsuariosLinkClick(Sender: TObject);
    procedure AlterarSenhaLinkClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
    procedure IWAppFormRender(Sender: TObject);
    procedure VariedadesLinkClick(Sender: TObject);
    procedure ConcursosLinkClick(Sender: TObject);
    procedure ConcursosInscricoesLinkClick(Sender: TObject);
    procedure ConcursosResultadosLinkClick(Sender: TObject);
  public
  end;

implementation

uses IWAppCache, IWMimeTypes, IW.CacheStream, Windows, UserSessionUnit,
 UnitListarAssociados, UnitListarPropriedades, UnitListarAmostras,
 UnitListarProvas, UnitListarUsuarios, UnitEditarSenha,
 UnitListarVariedades, UnitListarConcursos, UnitListarInscricoes,
 UnitListarAvaliacoesConcurso, UnitListarResultadosConcurso ;

{$R *.dfm}


procedure TIWFormDashboard.AlterarSenhaLinkClick(Sender: TObject);
begin
 TIWFormEditarSenha.Create(WebApplication).Show;
end;

procedure TIWFormDashboard.AmostrasLinkClick(Sender: TObject);
begin
 TIWFormListarAmostras.Create(WebApplication).Show;
end;

procedure TIWFormDashboard.AssociadosLinkClick(Sender: TObject);
begin
 TIWFormListarAssociados.Create(WebApplication).Show;
end;


procedure TIWFormDashboard.ConcursosInscricoesLinkClick(Sender: TObject);
begin
 TIWFormListarInscricoes.Create(WebApplication).Show;
end;

procedure TIWFormDashboard.ConcursosLinkClick(Sender: TObject);
begin
 TIWFormListarConcursos.Create(WebApplication).Show;
end;

procedure TIWFormDashboard.ConcursosResultadosLinkClick(Sender: TObject);
begin
 TIWFormListarResultadosConcurso.Create(WebApplication).Show;
end;

procedure TIWFormDashboard.IWAppFormCreate(Sender: TObject);
begin
 VariedadesLink.Visible:=(TIWUserSession(WebApplication.Data).isAdministrativo or TIWUserSession(WebApplication.Data).isAdministrador);
 Associadoslink.Visible:=(TIWUserSession(WebApplication.Data).isAdministrativo or TIWUserSession(WebApplication.Data).isAdministrador);
 PropriedadesLink.Visible:=(TIWUserSession(WebApplication.Data).isAdministrativo or TIWUserSession(WebApplication.Data).isAdministrador);
 UsuariosLink.Visible:=TIWUserSession(WebApplication.Data).isAdministrador;
 AmostrasLink.Visible:=(TIWUserSession(WebApplication.Data).isAdministrativo or TIWUserSession(WebApplication.Data).isAdministrador);
 ProvasLink.Visible:=(TIWUserSession(WebApplication.Data).isAdministrativo or TIWUserSession(WebApplication.Data).isAdministrador or TIWUserSession(WebApplication.Data).isAvaliador);
 ConcursosLink.Visible:=(TIWUserSession(WebApplication.Data).isAdministrativo or TIWUserSession(WebApplication.Data).isAdministrador);
 ConcursosInscricoesLink.Visible:=(TIWUserSession(WebApplication.Data).isAdministrativo or TIWUserSession(WebApplication.Data).isAdministrador);
 ConcursosResultadosLink.Visible:=TIWUserSession(WebApplication.Data).isAdministrador;
 //Nome do Usuario Logado
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
end;

procedure TIWFormDashboard.IWAppFormRender(Sender: TObject);
var
 S, xFileName, xURL:String;
 i, variaveis:Integer;
 Json:TStringList;
begin
 Variaveis:=0;
 //Verifica quais campos foram filtrados e monta a consulta
 With Cotacao do
 begin
  Open;
  if RecordCount>0 then
  begin
    Json:=TStringList.Create;
    Json.Add('[');
    while not Eof do
    begin
     JSon.Add(FieldByName('Cotacao').AsString);
     Next;
    end;
    //Retirar ultima virgula
    S:=Json.Strings[JSon.Count-1]; System.delete(S,Length(S),1); Json.Strings[JSon.Count-1]:=S;
    Json.Add(']');
    try
     //JSon.SaveToFile(GGetWebApplicationThreadVar.UserCacheDir+'Cotacao.txt', TEncoding.UTF8);
     //xFileName := TIWAppCache.NewTempFileName;
     //Windows.CopyFile(PChar(GGetWebApplicationThreadVar.UserCacheDir+'Cotacao.txt'), PChar(xFileName), True);
     //xURL := TIWAppCache.AddFileToCache(Self, xFileName,TIWMimeTypes.GetAsString(mtUnknown), ctSession);
     IWJQueryCotacao.OnReady.Strings[IWJQueryCotacao.OnReady.Count-3]:='data: '+JSon.Text;
    finally
     Json.Free;
    end;
  end
  else
   IWJQueryCotacao.OnReady.Strings[IWJQueryCotacao.OnReady.Count-3]:='data: []';
  Close;
 end;
 //Indicadores
 //Amostras
 AmostrasAAnalisar.Open;
 AmostrasAAnalisarLabel.Caption:=AmostrasAAnalisarAmostras.AsString;
 AmostrasAAnalisar.Close;
 //Pontuação Média
 PontuacaoMedia.Open;
 PontuacaoMediaEspeciaisLabel.Caption:=FormatFloat('#0.0',PontuacaoMediaMedia.Value);
 PontuacaoMedia.Close;
 //Popularidade da Marca
 //Area Cultivada
 AreaCultivada.Open;
 AreaCultivadaLabel.Caption:=FormatFloat('#0.0',AreaCultivadaArea.Value)+' ';
 AreaCultivada.Close;
end;

procedure TIWFormDashboard.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

procedure TIWFormDashboard.PropriedadesLinkClick(Sender: TObject);
begin
 TIWFormListarPropriedades.Create(WebApplication).Show;
end;

procedure TIWFormDashboard.ProvasLinkClick(Sender: TObject);
begin
 TIWFormListarProvas.Create(WebApplication).Show;
end;

procedure TIWFormDashboard.UsuariosLinkClick(Sender: TObject);
begin
 TIWFormListarUsuarios.Create(WebApplication).Show;
end;

procedure TIWFormDashboard.VariedadesLinkClick(Sender: TObject);
begin
 TIWFormListarVariedades.Create(WebApplication).Show;
end;

end.
