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
1- Faça uma atualização do Windows:
> Digite na barra de pesquisa do Windows "windows update". Clique no primeiro link "verificar se há atualizações" e faça a atualização.

2- Faça uma verificação de vírus no seu computador, utilize o seu antivírus e faça uma varredura. 
> Caso não tenha um antivírus ou utilize o Windows 10, faça toda a verificação no Windows Defender, olhe nesse link todas as intruções.  (https://support.microsoft.com/pt-br/help/4013263/windows-10-stay-protected-with-windows-security)
)

Send, ^v{Enter}
Return

:*O:problemaerroemail::
clipboard =
(
Seu e-mail foi bloqueado por segurança. Está impossibilitado de enviar e-mails... 
Pode ser algum tipo de vírus na sua máquina que tenta acessar as informações do seu e-mail ou por inúmeras tentativas de acesso a seu e-mail..
*Você pode enviar e-mails normalmente pelo WebMail da UOL*. 
No seu navegador, acesse o link: https://email.uolhost.com.br/ , digite o seu e-mail e senha.
Pelo celular, baixe o aplicativo UOL MAIL PRO. Basta acessar o app Play Store/App Store e digitar UOL MAIL PRO na busca e baixar o app.

Já solicitei o desbloqueio do seu e-mail, dentro de 20-25 minutos será liberado todos os recursos para Outlook e outros.. Só aguardar..

Até lá, acesse o seu e-mail pelo WebMail da UOL e também faça os seguintes procedimentos de segurança..:
)
Send, ^v{Enter}
Return

:*O:gastotransporte::
clipboard = 
(
Olá,
Boa tarde. 

Conforme solicitado, segue o link contendo os gastos que tive com transporte, referente ao mês de fevereiro.
No canto inferior da tela, possui as pastas com os respectivos meses e as despesas correspondentes.
https://docs.google.com/spreadsheets/d/1wX5XpcPGy29FXV8oyq6r4OAprrkI9ycmsBsk1mVUB1E/edit?usp=sharing

Nome: FELIPE GOMES LULLIO
Agência: 7853
Conta: 18539-0
CPF: 365.267.098-18
Banco: Itaú (479)

)
Send, ^v{Enter}
Return