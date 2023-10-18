unit UserSessionUnit;

{
  This is a DataModule where you can add components or declare fields that are specific to 
  ONE user. Instead of creating global variables, it is better to use this datamodule. You can then
  access the it using UserSession.
}
interface

uses
  IWUserSessionBase, SysUtils, Classes, Data.DB, Data.Win.ADODB;

type
  TIWUserSession = class(TIWUserSessionBase)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
  procedure IWUserSessionBaseCreate(Sender: TObject);
  private
    { Private declarations }
    FAuthenticated: Boolean;
  public
    { Public declarations }
    IDCliente:Integer;
    UsuarioAtivo:Integer;
    NomeUsuario, ExitPage:String;
    isAvaliador:Boolean;
    isAdministrador:Boolean;
    isAdministrativo:Boolean;
    isComercial:Boolean;
    isJurado:Boolean;
    SMTP_Host, SMTP_User, SMTP_Pass:String;
    SMTP_Port: Integer;
    property Authenticated: Boolean read FAuthenticated;
    function CheckUser(const aUserName, aPassword: string): Boolean;
    function RandomPassword(PLen: Integer): string;
  end;

implementation

uses MD5;

{$R *.dfm}

function TIWUserSession.RandomPassword(PLen: Integer): string;
var
  str: string;
begin
  Randomize;
  str    := '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%&*+=?';
  Result := '';
  repeat
    Result := Result + str[Random(Length(str)-1)];
  until (Length(Result) = PLen)
end;

function TIWUserSession.CheckUser(const aUserName, aPassword: string): Boolean;
begin
  Result := FAuthenticated;
  if not Result then
  With ADOQuery1 do
  begin
   SQl.Clear;
   //Using sp_executesql to avoid sql injection exploit
   SQl.Add('EXECUTE sp_executesql');
   SQl.Add('N''Select Top 1 IDCliente, IDUsuario, NomeUsuario, Administrador,');
   SQl.Add('Administrativo, Avaliador, Comercial, Jurado');
   SQl.Add('from UsuariosPossiveis');
   SQl.Add('WHERE Email = @Email');
   SQl.Add('and Senha=@Senha and Ativo=1'',');
   SQl.Add('N''@Email varchar(100), @Senha varchar(50)'',');
   SQl.Add('@Email='+QuotedStr(aUserName)+',');
   Sql.Add('@Senha='+QuotedStr(MD5DigestToStr(MD5String(aPassword))));
   {Sql.Add('SELECT TOP 1 * FROM Usuarios');
   Sql.Add('WHERE');
   SQl.Add('(Login='+QuotedStr(aUserName)+' or Email='+QuotedStr(aUserName)+')');
   SQl.Add('and Senha='+QuotedStr(MD5DigestToStr(MD5String(aPassword))));
   SQl.Add('and Ativo=1');}
   Open;
   FAuthenticated := RecordCount>0; // do your username/password validation here
   if FAuthenticated then
   begin
    IDCliente:=FieldByName('IDCliente').AsInteger;
    UsuarioAtivo:=FieldByName('IDUSuario').AsInteger;
    NomeUsuario:=FieldByName('NomeUsuario').AsString;
    isAdministrador:=FieldByName('Administrador').AsBoolean;
    isAdministrativo:=FieldByName('Administrativo').AsBoolean;
    isAvaliador:=FieldByName('Avaliador').AsBoolean;
    isComercial:=FieldByName('Comercial').AsBoolean;
    isJurado:=FieldByName('Jurado').AsBoolean;
   end;
   Result := FAuthenticated;
   Close;
  end;
end;

procedure TIWUserSession.IWUserSessionBaseCreate(Sender: TObject);
begin
 //Local
 ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=termopilas;Persist Security Info=True;'+
 'User ID=sa;Initial Catalog=AgTracer;Data Source=My-PC';
 //lab-db
 {ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=agtraceruser;Persist Security Info=True;'+
 'User ID=AgTracerUser;Initial Catalog=AMSC;Data Source=lab-db';}
 //AMSC
 {ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=Termopilas480$*);'
 +'Persist Security Info=True;User ID=AmscDbUser;Initial Catalog=AMSC;'+
 'Data Source=amscdb.chhocoyi2iz2.sa-east-1.rds.amazonaws.com';}
 FAuthenticated := False;
 SMTP_Host:='smtp.agtracer.com';
 SMTP_Port:=587;
 SMTP_User:='noreply@agtracer.com';
 SMTP_Pass:='+D9qpfIDx@+WJFea%T';
 ExitPage:='http://www.agtracer.com';
 {SMTP_Host:='mail.amsc.com.br';
 SMTP_Port:=587;
 SMTP_User:='sistema@amsc.com.br';
 SMTP_Pass:='Sistemaamsc15*';
 ExitPage:='http://www.amsc.com.br';}
end;


end.


