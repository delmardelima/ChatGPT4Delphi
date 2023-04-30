unit ChatGPT4Delphi;

interface

uses
  IdHTTP, IdGlobal, IdSSLOpenSSL, System.Classes, IdStack, System.SysUtils,
  System.JSON, IdException;

type
  TChatGPT4Delphi = class
  private
    FAccessKey: string;
    FResponse: string;
    procedure SetAccessKey(const Value: string);
  public
    constructor Create(AccessKey: string);
    function Query(sMessage: string): string;
    property AccessKey: string read FAccessKey write SetAccessKey;
    property Response: string read FResponse;
  end;

implementation

constructor TChatGPT4Delphi.Create(AccessKey: string);
begin
  FAccessKey := AccessKey;
end;

procedure TChatGPT4Delphi.SetAccessKey(const Value: string);
begin
  FAccessKey := Value;
end;

function TChatGPT4Delphi.Query(sMessage: string): string;
var
  http: TIdHTTP;
  sslHandler: TIdSSLIOHandlerSocketOpenSSL;
  url, body, Response: string;
  JSON: TJSONObject;
  Choices: TJSONArray;
begin
  url := 'https://api.openai.com/v1/chat/completions';
  body := Format
    ('{"model": "%s", "messages": [{"role": "user", "content": "%s"}]}',
    ['gpt-3.5-turbo', sMessage]);
  http := TIdHTTP.Create(nil);
  sslHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    sslHandler.SSLOptions.Method := sslvTLSv1_2;
    http.IOHandler := sslHandler;
    http.Request.ContentType := 'application/json';
    http.Request.Accept := 'application/json';
    http.Request.CharSet := 'UTF-8';
    http.Request.CustomHeaders.AddValue('Authorization',
      Format('Bearer %s', [FAccessKey]));
    try
      Response := http.Post(url, TStringStream.Create(body, TEncoding.UTF8));
    except
      on E: EIdHTTPProtocolException do
        raise Exception.CreateFmt('Indy exception (%d): %s',
          [E.ErrorCode, E.Message + sLineBreak + E.ErrorMessage]);
      // retorna a exceção com raise
    end;
    Response := IndyTextEncoding_UTF8.GetString
      (IndyTextEncoding_OSDefault.GetBytes(Response));
    JSON := TJSONObject.ParseJSONValue(Response) as TJSONObject;
    Choices := JSON.GetValue('choices') as TJSONArray;
    Result := Choices.Items[0].GetValue<TJSONObject>('message')
      .GetValue('content').Value;
  finally
    http.Free;
    sslHandler.Free;
  end;
end;

end.
