#NoEnv
#SingleInstance, Force
#Persistent

:*O:ordems::
MsgBox 1- 
Return

;;;;; inicilizar o site no chrome
#C::Run, www.trello.com
#e::Run, mailto:felipelullio@hotmail.com

:*O:instruemail::
clipboard =
(
1- Fa�a uma atualiza��o do Windows:
> Digite na barra de pesquisa do Windows "windows update". Clique no primeiro link "verificar se h� atualiza��es" e fa�a a atualiza��o.

2- Fa�a uma verifica��o de v�rus no seu computador, utilize o seu antiv�rus e fa�a uma varredura. 
> Caso n�o tenha um antiv�rus ou utilize o Windows 10, fa�a toda a verifica��o no Windows Defender, olhe nesse link todas as intru��es.  (https://support.microsoft.com/pt-br/help/4013263/windows-10-stay-protected-with-windows-security)
)

Send, ^v{Enter}
Return

:*O:problemaerroemail::
clipboard =
(
Seu e-mail foi bloqueado por seguran�a. Est� impossibilitado de enviar e-mails... 
Pode ser algum tipo de v�rus na sua m�quina que tenta acessar as informa��es do seu e-mail ou por in�meras tentativas de acesso a seu e-mail..
*Voc� pode enviar e-mails normalmente pelo WebMail da UOL*. 
No seu navegador, acesse o link: https://email.uolhost.com.br/ , digite o seu e-mail e senha.
Pelo celular, baixe o aplicativo UOL MAIL PRO. Basta acessar o app Play Store/App Store e digitar UOL MAIL PRO na busca e baixar o app.

J� solicitei o desbloqueio do seu e-mail, dentro de 20-25 minutos ser� liberado todos os recursos para Outlook e outros.. S� aguardar..

At� l�, acesse o seu e-mail pelo WebMail da UOL e tamb�m fa�a os seguintes procedimentos de seguran�a..:
)
Send, ^v{Enter}
Return

:*O:gastotransporte::
clipboard = 
(
Ol�,
Boa tarde. 

Conforme solicitado, segue o link contendo os gastos que tive com transporte, referente ao m�s de fevereiro.
No canto inferior da tela, possui as pastas com os respectivos meses e as despesas correspondentes.
https://docs.google.com/spreadsheets/d/1wX5XpcPGy29FXV8oyq6r4OAprrkI9ycmsBsk1mVUB1E/edit?usp=sharing

Nome: FELIPE GOMES LULLIO
Ag�ncia: 7853
Conta: 18539-0
CPF: 365.267.098-18
Banco: Ita� (479)

)
Send, ^v{Enter}
Return