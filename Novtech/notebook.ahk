#NoEnv
#SingleInstance, Force
#Persistent
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Bot�o de abaixar volume = FN+F2
Volume_Down::
Send {F2}
Return

:*O:ordems::
MsgBox 2-  blockemail              :seu email bloqueado seguranca`n3- esqueceusenha              :sua novasenha eh:`n3.1-    senhanova        :    novasenha da novtech `n4- gastotransporte `n5-  cnov              :contato da novtech`6-   linksnv - links da novtech, folders
Return



:*O:cnov::
clipboard=
(
SP: (11) 2638-7030
RJ: (21) 3907-5151
comercial@novtech.com.br
https://novtech.com.br
Redes Sociais: NovtechBrasil
Comunicados E-mail: https://bit.ly/EmailNovtech
)
Send, ^v
Return


Send, ^v{Enter}
Return

:*O:blockemail::
clipboard =
(
Seu e-mail foi bloqueado por seguran�a. Voc� est� impossibilitado de enviar e-mails pelos gerenciadores de e-mail(outlook,gmail,etc)... 
O bloqueio pode ser por algum tipo de v�rus na sua m�quina que tenta acessar as informa��es do seu e-mail ou por v�rias tentativas de acesso ao seu e-mail inv�lidas..
*Voc� pode enviar e-mails normalmente pelo WebMail da UOL e pelo aplicativo*. 
No seu navegador, acesse o link: https://email.uolhost.com.br/ , digite o seu e-mail e senha.
Pelo celular, baixe o aplicativo UOL MAIL PRO. Basta acessar o app Play Store/App Store e digitar UOL MAIL PRO na busca e baixar o app.

*J� solicitei o desbloqueio do seu e-mail, dentro de 20-25 minutos ser� liberado todos os recursos e voc� poder� enviar e-mails normalmente pelos gerenciadores de e-mail..

At� l�, acesse o seu e-mail pelo WebMail da UOL e tamb�m fa�a os seguintes procedimentos de seguran�a..: (importante que fa�a os procedimentos para n�o acontecer esse problema novamente):

1- Fa�a uma atualiza��o do Windows:
> Digite na barra de pesquisa do Windows(Windows+S) "windows update". Clique no primeiro link "verificar se h� atualiza��es" e fa�a a atualiza��o se houver.

2- Fa�a uma verifica��o de v�rus no seu computador, utilize o seu antiv�rus e fa�a uma varredura. 
> Caso n�o tenha um antiv�rus, fa�a toda a verifica��o no Windows Defender, olhe nesse link todas as intru��es e siga o passo a passo.  (https://support.microsoft.com/pt-br/help/4013263/windows-10-stay-protected-with-windows-security)
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
Banco: Ita� (341)

)
Send, ^v{Enter}
Return


:*O:esqueceusenha::
clipboard = 
(
Ol�,

Como voc� esqueceu sua senha, eu a resetei. Sua nova senha � "novtech1" sem as aspas.

Voc� pode alterar a senha do seu e-mail acessando esse link por qualquer navegador:
https://mailpro.uol.com.br/novtech.com.br
Digite o seu usu�rio e sua senha(novtech1).
> Clique em "Configura��es" (canto superior direito da tela).
> Na aba "E-mail:", clique em "Senha".
> Digite a senha atual(novtech1) e a nova senha que deseja colocar.
> Clique no bot�o vermelho "Salvar altera��es"

Mais informa��es sobre o E-mail profissional Novtech acesse o link: https://bit.ly/EmailNovtech

)
Send, ^v{Enter}
Return

:*O:senhanova::
clipboard = 
(
Ol�,

Sua nova senha � "novtech1" sem as aspas.

Voc� pode alterar a senha do seu e-mail acessando esse link por qualquer navegador:
https://mailpro.uol.com.br/novtech.com.br
Digite o seu usu�rio e sua senha(novtech1).
> Clique em "Configura��es" (canto superior direito da tela).
> Na aba "E-mail:", clique em "Senha".
> Digite a senha atual(novtech1) e a nova senha que deseja colocar.
> Clique no bot�o vermelho "Salvar altera��es"

Mais informa��es sobre o E-mail profissional Novtech acesse o link: https://bit.ly/EmailNovtech

)
Send, ^v{Enter}
Return


:*O:linksnv::
clipboard = 
(
Link Logos Novtech:
https://drive.google.com/open?id=1J91ItGwar_FDiqzKKkiqrq6bNeoc_YbD

Mega Link: Todos folders
https://mega.nz/#F!D9hllTgB!jyUmCV-Zou8vl7mWMVb2Iw

Comunciados e-mail novtech: https://bit.ly/EmailNovtech

Avalia��es
NOVTECH RJ: https://g.page/novtechrj/review?gm
NOVTECH SP: https://g.page/novtech/review?gm
Facebook: https://www.facebook.com/pg/novtechbrasil/reviews/
)
Send, ^v{Enter}
Return



