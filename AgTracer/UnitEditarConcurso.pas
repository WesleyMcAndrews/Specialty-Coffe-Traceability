unit UnitEditarConcurso;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWHTMLControls, Data.DB, Data.Win.ADODB,
  IWCompButton, IWDBStdCtrls, IWCompListbox, IWCompEdit, IWCompJQueryWidget,
  IWCompExtCtrls, IWDBExtCtrls, System.Variants, IWCompLabel,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IWCompFileUploader;

type
  TIWFormEditarConcurso = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    VoltarLink: TIWLink;
    Concursos: TADODataSet;
    NomeConcurso: TIWDBEdit;
    DataIniPreSelecao: TIWDBEdit;
    DataFimPreSelecao: TIWDBEdit;
    MultiComboCategorias: TIWDBEdit;
    NomeEdicao: TIWDBEdit;
    DataFimSelecao: TIWDBEdit;
    DataIniSelecao: TIWDBEdit;
    DataPremiacao: TIWDBEdit;
    ConcursosSrc: TDataSource;
    Usuarios: TADOQuery;
    SalvarBtn: TIWButton;
    CancelarBtn: TIWButton;
    CadastradoPor: TIWDBLabel;
    EditadoPor: TIWDBLabel;
    UsuariosSrc: TDataSource;
    UsuariosUsuarioCadastro: TStringField;
    UsuariosUsuarioEdicao: TStringField;
    ProfileLogoutLink: TIWLink;
    UserName: TIWLabel;
    DataEntregaAmostras: TIWDBEdit;
    QtdePremiadosPorCategoria: TIWDBEdit;
    QtdePtsPreSelecao: TIWDBEdit;
    ArquivoRegulamento: TIWFileUploader;
    ConcursosIDConcurso: TAutoIncField;
    ConcursosIDCliente: TIntegerField;
    ConcursosNomeConcurso: TStringField;
    ConcursosNomeEdicao: TStringField;
    ConcursosCategorias: TStringField;
    ConcursosPtsPreSelecao: TIntegerField;
    ConcursosNroPremiadosPorCategoria: TIntegerField;
    ConcursosDtEntregaAmostras: TDateTimeField;
    ConcursosDtIniPreSelecao: TDateTimeField;
    ConcursosDtFimPreSelecao: TDateTimeField;
    ConcursosDtIniSelecao: TDateTimeField;
    ConcursosDtFimSelecao: TDateTimeField;
    ConcursosDtPremiacao: TDateTimeField;
    ConcursosArquivoRegulamento: TStringField;
    ConcursosIDUsuarioCadastro: TIntegerField;
    ConcursosDataCadastro: TDateTimeField;
    ConcursosIDUsuarioEdicao: TIntegerField;
    ConcursosDataEdicao: TDateTimeField;
    procedure VoltarLinkClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure SalvarBtnClick(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
    procedure ArquivoRegulamentoAsyncUploadCompleted(Sender: TObject;
      var DestPath, FileName: string; var SaveFile, Overwrite: Boolean);
  public
   Editando:Boolean;
   NovaSenha:String;
  end;

implementation

{$R *.dfm}

uses UserSessionUnit, Windows;



procedure TIWFormEditarConcurso.ArquivoRegulamentoAsyncUploadCompleted(
  Sender: TObject; var DestPath, FileName: string; var SaveFile,
  Overwrite: Boolean);
begin
 //windows.MoveFile(Pchar(DestPath+Filename),PChar('C:\Sistemas Delphi\AMSC\AMSC\Win32\Debug\wwwroot\concursos\'+))
end;

procedure TIWFormEditarConcurso.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
 MultiComboCategorias.ExtraTagParams.Add('names=[{''id'':''Natural'',''text'':''Natural''},'+
  '{''id'':''Cereja Descascada'',''text'':''Cereja Descascada''},{''id'':''Micro Lote'',''text'':''Micro Lote''}]');
 MultiComboCategorias.ExtraTagParams.Add('tags=true');
end;

procedure TIWFormEditarConcurso.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

procedure TIWFormEditarConcurso.SalvarBtnClick(Sender: TObject);
begin
 //gravar
 try
  if Editando then
  begin
   ConcursosIDUsuarioEdicao.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
   ConcursosDataEdicao.Value:=Now();
  end
  else
   ConcursosIDUsuarioCadastro.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
  Concursos.Post;
  WebApplication.ShowMessage('Dados gravados com sucesso.');
  Release;
 except
  on E : Exception do
  begin
   WebApplication.ShowMessage('Não foi possível gravar. Verifique os valores digitados. '+E.Message);
   Exit;
  end;
 end;
end;


procedure TIWFormEditarConcurso.VoltarLinkClick(Sender: TObject);
begin
 Concursos.Cancel;
 Release;
end;

end.
