unit main;

interface

uses
  SysUtils, Classes, HTTPApp, DB, ADODB, DateUtils;

type
  TWebModule1 = class(TWebModule)
    ADOConnection1: TADOConnection;
    Municipios: TADOQuery;
    MunicipiosCodigoMunicipio: TStringField;
    MunicipiosNomeMunicipio: TStringField;
    procedure WebModule1consultarAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModule1: TWebModule1;

implementation

{$R *.DFM}

procedure TWebModule1.WebModule1consultarAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
 S:TStringList;
 D:String;
begin
 S:=TStringList.Create;
 If Request.ContentFields.Values['uf']<>'' then
 begin
  Municipios.SQL[Municipios.SQL.Count-2]:='Where UF='+Request.ContentFields.Values['uf'];
  Municipios.Open;
  S.Add('<option value="">Please select...</option>');
  If Municipios.RecordCount>0 then
  while not Municipios.eof do
  begin
   S.Add( '<option value="'+MunicipiosCodigoMunicipio.AsString+'">'+MunicipiosNomeMunicipio.AsString+'</option>');
   Municipios.Next;
  end;
  Municipios.Close;
 end;
 Response.Content:=S.Text;
 S.Free;
end;

end.
