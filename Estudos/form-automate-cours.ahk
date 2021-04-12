#NoEnv
#SingleInstance, force
#Warn


/*
DE FORMA MANUAL ABAIXO
*/



/*
WinActivate, ahk_exe chrome.exe ; ativa o chrome
Sleep, 500
SendInput, {home} ; manda pro topo da pÃ¡gina caso esteja lÃ¡ em baixo

Sleep, 500
; Deixar o ahk saber qual tipo de coormode vai usar explicitamente
CoordMode, mouse, Screen ; do tipo screen e nao window
MouseClick, left, 3031, 552 ; click dropdown class attend

; Selecionar o IT management no dropdown
Sleep, 500
SendInput, IT MANAGEMENT
Sleep, 50
SendInput, {Enter}

; envia a data
Sleep, 500
SendInput, {Tab}
SendInput, 10/10/2020

; envia o nome
Sleep, 500
SendInput, {Tab}
SendInput, Felipe bob

; envia o sobrenome
Sleep, 500
SendInput, {Tab}
SendInput, sobrenome bob

; inseri o employee number
Sleep, 500
SendInput, {Tab}
SendInput, 12-22-22

; Clicar no botÃ£o enviar formulÃ¡rio
SendInput, {tab}
SendInput, {Enter}

; depois de enviar formulÃ¡rio, clicar no link para enviar novo formulÃ¡roi
Sleep, 900
SendInput, {tab}
SendInput, {Enter}
Sleep, 900

*/


/*
TENTANDO IMPLEMENTAR FUNÃ‡ÃƒO NO CÃ“DIGO ACIMA, PARA FACILITAR USAR ESSE CÃ“DIGO MAIS VEZES
*/

; mesmo cÃ³digo acima sÃ³ que dentro de uma funÃ§Ã£o
singleRecordFill(contador){ ; singlerecordfill significa enviar o formulÃ¡rio uma vez
; passamos um parametro na funÃ§Ã£o por causa do problema de escope, a variavel contador sÃ³ estÃ¡ visÃ­vel na funÃ§Ã£o multipleRecordFill, mas precisar estar visÃ­vel aqui tambÃ©m para poder colocar a variÃ¡vel corretamente

    WinActivate, ahk_exe chrome.exe ; ativa o chrome
    Sleep, 500
    SendInput, {home} ; manda pro topo da pÃ¡gina caso esteja lÃ¡ em baixo

    Sleep, 500
    ; Deixar o ahk saber qual tipo de coormode vai usar explicitamente
    CoordMode, mouse, Screen ; do tipo screen e nao window
    MouseClick, left, 3031, 552 ; click dropdown class attend

    ; Selecionar o IT management no dropdown
    Sleep, 600
    ; SendInput, IT MANAGEMENT
    ; dropdown tem que ser send e nÃ£o sendinput
    Send, % pessoa%contador%[1] ; acessando primeiro elemento do array pessoa1(no primero loop dps pessoa2 segundo loop)
    Sleep, 500
    SendInput, {Enter}

    ; envia a data
    Sleep, 500
    SendInput, {Tab}
    ; SendInput, 10/10/2020
     SendInput, % pessoa%contador%[2] ; acessando segundo elemento do array pessoa1(no primero loop dps pessoa2 segundo loop)

    ; envia o nome
    Sleep, 500
    SendInput, {Tab}
    ; SendInput, Felipe bob
    ; SendInput % firstName%contador% ; quando for pro loop, vai ser primeiro firstName1 depois firstName2
    SendInput, % pessoa%contador%[3] ; acessando terceiro elemento do array pessoa1(no primero loop dps pessoa2

    ; envia o sobrenome
    Sleep, 500
    SendInput, {Tab}
    ; SendInput, sobrenome bob
    SendInput, % pessoa%contador%[4] ; acessando quarto elemento do array pessoa1(no primero loop dps pessoa2

    ; inseri o employee number
    Sleep, 500
    SendInput, {Tab}
    ; SendInput, 12-22-22
    SendInput, % pessoa%contador%[5] ; acessando primeiro elemento do array pessoa1(no primero loop dps pessoa2

    ; Clicar no botÃ£o enviar formulÃ¡rio
    SendInput, {tab}
    SendInput, {Enter}

    ; depois de enviar formulÃ¡rio, clicar no link para enviar novo formulÃ¡rio
    ; Sleep, 900
    ;FunÃ§Ã£o pagewait vai copiar o texto e verificar se o texto copiadado bate com o texto abaixo(Sua resposta..)
    pageWait(2948, 369, 3123, 370, "Sua resposta foi registrada.")
    SendInput, {tab}
    SendInput, {Enter}
    ;FunÃ§Ã£o pagewait vai copiar o texto e verificar se o texto copiadado bate com o texto abaixo(Sua resposta..)
    pageWait(2940, 480, 3047, 481, "Class Attended")
    ; Sleep, 900
}


; CHAMANDO A FUNÃ‡ÃƒO DENTRO DE UM LOOP, colocando o loop dentro da funÃ§Ã£o

multipleRecordFill(){ ;enviar formulÃ¡rio vÃ¡rias vezes, apenas colocamos o loop que chama a funÃ§Ã£o singlerecordfill dentro da funÃ§Ã£o multiplerecordfill
    contador:=1
    Loop, 2
    {
    ; passamos um parametro na funÃ§Ã£o por causa do problema de escope, a variavel contador sÃ³ estÃ¡ visÃ­vel na funÃ§Ã£o multipleRecordFill, mas precisar estar visÃ­vel aqui tambÃ©m para poder colocar a variÃ¡vel corretamente

        singleRecordFill(contador) ; chamando a funÃ§Ã£o singlerecord
        contador++ ; ou contador+=1 ou contador = contador+1
    }
    ; Depois de enviar os dados do formulÃ¡rio todos exibir mensagem
    MsgBox, Sucesso!
}

; ÃšNICO PROBLEMA AGORA, Ã‰ MUDAR OS CAMPOS DO FORMULÃRIO, ESTÃƒO SENDO ENVIADOS REPETIDOS, PRECISA SER UMA VARIÃVEL
; firstName1:="faruos"
; class1:="it managent"

; firstName2:="joe"
; class2:= "it managemnt"
    ; Agora basta mudar no cÃ³digo o nome colocando variÃ¡vel

; resolvendo muitas variaveis colocando em array
global pessoa1:=["IT MANAGEMENT", "30/11/2019", "Felipe", "Lullio", "545402-3232"] ; global para ser acessÃ­vel na funÃ§Ã£o preenchimentoFormularioPessoas()
global pessoa2:=["IT SLA", "15/12/2020", "Lucas", "Lucas", "545402-3232"] ; global para ser acessÃ­vel na funÃ§Ã£o preenchimentoFormularioPessoas()



; CHAMANDO A FUNÃ‡ÃƒO multipleRecordFill() que vai executar todo o cÃ³digo
multipleRecordFill()



/*
FUNÃ‡ÃƒO PAGEWAIT, ESPERA CHEGAR NA PÃGINA DE "FORMULÃRIO ENVIADO COM SUCESSO", em vez de usar Sleep
vamos criar uma funÃ§Ã£o para saber se chegamos nessa pÃ¡gina
*/

pageWait(x1,y1,x2,y2, targetText){ ; vamos chamar essa funÃ§Ã£o 2x, entÃ£o quando chamarmos ela vÃ£o ser argumentos diferentes nas 2x 
    Loop, 50{
        Sleep, 50
        ; Vamos colocar o mouse no comeÃ§o da palavra "Sua resposta foi registrada" e arrastar atÃ© final da frase
        CoordMode, mouse, screen

        ; Ã± vamos colocar as coordenadas direto pois vamos usar 2x essa funÃ§Ã£o, esperando a pÃ¡gina do "sua resposta foi registrada" e pÃ¡gina para enviar formulÃ¡rio novo (procurar por "Class Attended" (1Âº campo do form))
        MouseClickDrag, left, x1,y1,x2,y2 ; X1 E Y1 = COMEÃ‡O DO DRAG, X2,Y2=FINAL DO DRAG

        Sleep, 90
        Send, ^c ; copiar o que foi draged
        ClipWait, 1 ; espera alguma coisa entrar no clipboard

        ; ao copiar, provavelmente vai vir com espaÃ§o no final e line return
        clipFormatted:=StrReplace(clipboard, "`r`n") ; remove os line return

        ; checar se o texto estÃ¡ na tela
        if(clipFormatted = targetText){
            Break ; se o clipFormatted for igual targetText queremos sair do loop
        }

        ; resetar o drag, o texto estÃ¡ selecionado, vamos clicar no comeÃ§o do texto agora para descelecionar
        MouseClick, left, x1, y1
        Sleep, 90

    } ; fim do loop
} ; fim da funÃ§Ã£o pageWait()




; SAIR DO CÃ“DIGO RAPIDAMENTE, CASO DE ERRO ETC, PARA NÃƒO FICAR RODANDO CÃ“DIGO
^escape:: ExitApp