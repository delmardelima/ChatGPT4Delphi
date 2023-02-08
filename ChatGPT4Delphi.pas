unit ChatGPT4Delphi;

interface

uses
  System.JSON, System.Classes, IdHTTP, IdSSLOpenSSL, IdStack;

type
  TChatGPT4Delphi = class
  private
    FEndpoint: string;
    FAccessKey: string;
    FResponse: string;
    procedure SetEndpoint(const Value: string);
    procedure SetAccessKey(const Value: string);
  public
    constructor Create(Endpoint, AccessKey: string);
    function Query(Message: string): string;
    property Endpoint: string read FEndpoint write SetEndpoint;
    property AccessKey: string read FAccessKey write SetAccessKey;
    property Response: string read FResponse;
  end;

implementation

constructor TChatGPT4Delphi.Create(Endpoint, AccessKey: string);
begin
  FEndpoint := Endpoint;
  FAccessKey := AccessKey;
end;

procedure TChatGPT4Delphi.SetEndpoint(const Value: string);
begin
  FEndpoint := Value;
end;

procedure TChatGPT4Delphi.SetAccessKey(const Value: string);
begin
  FAccessKey := Value;
end;

function TChatGPT4Delphi.Query(Message: string): string;
var
  HTTP: TIdHTTP;
  JSON: TJSONObject;
  Data: TStringStream;
begin
  HTTP := TIdHTTP.Create(nil);
  try
    HTTP.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(HTTP);
    TIdStack.IncUsage;
    JSON := TJSONObject.Create;
    try
      IdSSLOpenSSL.SSLOptions.Method := sslvTLSv1_2;
      JSON.AddPair('prompt', Message);
      Data := TStringStream.Create(JSON.ToString);
      try
        FResponse := HTTP.Post(FEndpoint, Data);
      finally
        Data.Free;
      end;
    finally
      JSON.Free;
      TIdStack.DecUsage;
    end;
  finally
    HTTP.Free;
  end;
  Result := FResponse;
end;

end.
