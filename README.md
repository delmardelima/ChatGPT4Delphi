# ChatGPT4Delphi
A Delphi class to consume the OpenAI ChatGPT API easily.

## Description
This library is a Delphi class that allows you to easily consume the OpenAI ChatGPT API. With just a few lines of code, you can send a message to the language model and receive an automatically generated response. The class manages all the HTTP communication and JSON serialization/deserialization, making the integration with the ChatGPT API extremely easy. Additionally, the class is fully customizable and can be easily integrated into existing Delphi applications.

## Usage
To use the class, simply add it to your Delphi project and call the appropriate methods to send messages and receive responses from the ChatGPT API.

## Example Usage
Here is a simple example of how to use the ChatGPT4Delphi class:

```delphi
uses ChatGPT4Delphi;

var
  ChatBot: TChatGPT4Delphi;
  Response: string;
begin
  ChatBot := TChatGPT4Delphi.Create('YOUR_ACCESS_KEY_HERE');
  try
    Response := ChatBot.Query('What is the capital of France?');
    WriteLn(Response);
  finally
    ChatBot.Free;
  end;
end;
```
## Requirements
- Delphi 10.3 or later

## Contributing
If you want to contribute to the development of this library, please feel free to fork the repository and make a pull request.

# Delmar de Lima (Cortes DEV)

## Support
Get in touch with us for any questions or inquiries through WhatsApp: https://wa.me/5597991442486

## Donations 
Donate via PIX:
### Email: delmar.apui@gmail.com
### Cell: (97) 99144-2486

## Connect with us
##### [YouTube][] 
##### [WhatsApp][]
##### [Instagram][]
##### [Facebook][] 
##### [Delphi Modern Layout Source Code][]

Get to know us better on our YouTube channel: <br/>
**[>> FIND OUT MORE](https://bit.ly/SeguirCortesDev)**

## License
This library is licensed under the GPL-3.0 license. See [LICENSE](LICENSE) for more details.

# ChatGPT4Delphi
Uma classe Delphi para consumir facilmente a API do ChatGPT da OpenAI.

## Descrição
Esta biblioteca é uma classe Delphi que permite consumir facilmente a API do ChatGPT da OpenAI. Com apenas algumas linhas de código, você pode enviar uma mensagem para o modelo de linguagem e receber uma resposta gerada automaticamente. A classe gerencia toda a comunicação HTTP e serialização/deserialização de JSON, tornando a integração com a API do ChatGPT extremamente fácil. Além disso, a classe é totalmente personalizável e pode ser facilmente integrada a aplicações Delphi existentes.

## Uso
Para usar a classe, basta adicioná-la ao seu projeto Delphi e chamar os métodos apropriados para enviar mensagens e receber respostas da API do ChatGPT.

## Exemplo de Uso
Aqui está um exemplo simples de como usar a classe ChatGPT4Delphi:

```delphi
uses ChatGPT4Delphi;

var
  ChatBot: TChatGPT4Delphi;
  Response: string;
begin
  ChatBot := TChatGPT4Delphi.Create('SUA_CHAVE_ACESSO_AQUI');
  try
    Response := ChatBot.Query('Qual é a capital da França?');
    WriteLn(Response);
  finally
    ChatBot.Free;
  end;
end;
```

## Requisitos
- Delphi 10.3 ou posterior

## Contribuindo
Se você quiser contribuir para o desenvolvimento desta biblioteca, sinta-se à vontade para fazer um fork do repositório e fazer uma pull request.

# Delmar de Lima (Cortes DEV)

## Suporte
Entre em contato conosco para qualquer dúvida ou pergunta pelo WhatsApp: https://wa.me/5597991442486

## Doações 
Faça sua doação via PIX:
### Email: delmar.apui@gmail.com
### Celular: (97) 99144-2486

## Conecte-se com a gente
##### [YouTube][] 
##### [WhatsApp][]
##### [Instagram][]
##### [Facebook][] 
##### [Código Fonte Layout Moderno em Delphi][]

Conheça mais sobre nós em nosso canal no YouTube: <br/>
**[>> CONHEÇA MAIS](https://bit.ly/SeguirCortesDev)**

[YouTube]: https://bit.ly/SeguirCortesDev
[WhatsApp]: https://wa.me/5597991442486
[Instagram]: https://www.instagram.com/cortesdevoficial/
[Facebook]: https://www.fb.com/cortesdevoficial
[Código Fonte Layout Moderno em Delphi]: https://bit.ly/LayoutModerno

## Licença
Esta biblioteca é licenciada sob a licença GPL-3.0. Veja [LICENSE](LICENSE) para mais detalhes.

[YouTube]: https://bit.ly/SeguirCortesDev
[WhatsApp]: https://wa.me/5597991442486
[Instagram]: https://www.instagram.com/cortesdevoficial/
[Facebook]: https://www.fb.com/cortesdevoficial
[Delphi Modern Layout Source Code]: https://bit.ly/LayoutModerno
