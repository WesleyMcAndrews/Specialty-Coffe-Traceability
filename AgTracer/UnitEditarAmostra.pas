unit UnitEditarAmostra;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWHTMLControls, Data.DB, Data.Win.ADODB,
  IWCompButton, IWDBStdCtrls, IWCompListbox, IWCompEdit, IWCompJQueryWidget,
  IWCompExtCtrls, IWDBExtCtrls, System.Variants, IWCompLabel, IWCompCheckbox;

type
  TIWFormEditarAmostra = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    VoltarLink: TIWLink;
    SalvarBtn: TIWButton;
    IWJQueryWidget1: TIWJQueryWidget;
    CancelarBtn: TIWButton;
    CadastradoPor: TIWDBLabel;
    EditadoPor: TIWDBLabel;
    Amostras: TADODataSet;
    AmostrasSrc: TDataSource;
    Usuarios: TADOQuery;
    UsuariosSrc: TDataSource;
    AmostrasIDAmostra: TAutoIncField;
    AmostrasIDLote: TIntegerField;
    AmostrasDataEntrada: TDateTimeField;
    AmostrasTipoAmostra: TStringField;
    AmostrasEtapaProcesso: TStringField;
    AmostrasQtdeKg: TIntegerField;
    AmostrasDataDevolutiva: TDateTimeField;
    AmostrasLoginAvulso: TStringField;
    AmostrasSenhaAvulsa: TStringField;
    AmostrasDataAcessoOnline: TDateTimeField;
    AmostrasQRCode: TGuidField;
    AmostrasIDUsuarioCadastro: TIntegerField;
    AmostrasDtCadastro: TDateTimeField;
    AmostrasIDUsuarioEdicao: TIntegerField;
    AmostrasDtEdicao: TDateTimeField;
    DataEntrada: TIWDBEdit;
    Tipo: TIWDBComboBox;
    Etapa: TIWDBComboBox;
    Qtde: TIWDBEdit;
    DataDevolutiva: TIWDBEdit;
    UsuariosUsuarioCadastro: TStringField;
    UsuariosUsuarioEdicao: TStringField;
    Login: TIWDBEdit;
    Senha: TIWDBEdit;
    DataAcesso: TIWDBEdit;
    UserName: TIWLabel;
    ProfileLogoutLink: TIWLink;
    procedure VoltarLinkClick(Sender: TObject);
    procedure SalvarBtnClick(Sender: TObject);
    procedure DataDevolutivaAsyncChange(Sender: TObject;
      EventParams: TStringList);
    function RandomPassword(PLen: Integer): string;
    procedure IWAppFormCreate(Sender: TObject);
    procedure ProfileLogoutLinkClick(Sender: TObject);
  public
   Editando:Boolean;
  end;

implementation

{$R *.dfm}

uses UserSessionUnit;


procedure TIWFormEditarAmostra.IWAppFormCreate(Sender: TObject);
begin
 UserName.Caption:=TIWUserSession(WebApplication.Data).NomeUsuario;
end;

procedure TIWFormEditarAmostra.ProfileLogoutLinkClick(Sender: TObject);
begin
 WebApplication.TerminateAndRedirect(TIWUserSession(WebApplication.Data).ExitPage);
end;

function TIWFormEditarAmostra.RandomPassword(PLen: Integer): string;
var
  str: string;
begin
  Randomize;
  str    := '1234567890abcdefghijklmnopqrstuvwxyzçABCDEFGHIJKLMNOPQRSTUVWXYZÇ!@#$%&*+=?';
  Result := '';
  repeat
    Result := Result + str[Random(Length(str)-1)];
  until (Length(Result) = PLen)
end;

procedure TIWFormEditarAmostra.DataDevolutivaAsyncChange(Sender: TObject;
  EventParams: TStringList);
begin
 if AmostrasDataDevolutiva.Value<AmostrasDataEntrada.Value then
 begin
  AmostrasDataDevolutiva.Value:=null;
  DataDevolutiva.RepaintControl;
  WebApplication.ShowMessage('A Data da Devolutiva não pode ser menor que a Data de Entrada.');
 end;
end;

procedure TIWFormEditarAmostra.SalvarBtnClick(Sender: TObject);
begin
 //gravar
 try
  {if Editando then
  begin
   //AssociadosIDUsuarioEdicao.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;
   //AssociadosDataEdicao.Value:=Now();
  end
  else
   //AssociadosIDUsuarioCadastro.Value:=TIWUserSession(WebApplication.Data).UsuarioAtivo;}
  Amostras.Post;
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

procedure TIWFormEditarAmostra.VoltarLinkClick(Sender: TObject);
begin
 Release;
end;

end.
