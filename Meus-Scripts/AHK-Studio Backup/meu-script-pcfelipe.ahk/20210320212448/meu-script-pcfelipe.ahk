#Include <Default_Settings>



; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; POSIÇÃO DO MOUSE

^h::
MouseGetPos, posX,posY
MsgBox % posX A_tab posY
ClipBoard:=%  posX " , "A_tab posY
Return

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; adicionar bloco de código trello sublime
#IfWinActive, ahk_exe sublime_text.exe
SetKeyDelay, 1 ; 
	::code.::`````` `n`n`````` {Up}
#IfWinActive


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


!i:: ;get IP address
clipboard:="Public ip is: " GetIP("http://www.netikus.net/show_ip.html​") "`n`nPrivate IP is:" GetLocalIPByAdaptor("Ethernet")
MsgBox 64, IP Address, % Clipboard
Return

GetIP(URL){
	http:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
	http.Open("GET","http://www.netikus.net/show_ip.html",1)
	http.Send()
	http.WaitForResponse
	If (http.ResponseText="Error"){
		MsgBox 16, IP Address, Sorry, your public IP address could not be detected
		Return
	}
	return http.ResponseText
}

; pegar o ip pelo adaptador

GetLocalIPByAdaptor(adaptorName) {
	objWMIService := ComObjGet("winmgmts:{impersonationLevel = impersonate}!\\.\root\cimv2")
	colItems := objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapter WHERE NetConnectionID = '" adaptorName "'")._NewEnum, colItems[objItem]
	colItems := objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE InterfaceIndex = '" objItem.InterfaceIndex "'")._NewEnum, colItems[objItem]
	Return objItem.IPAddress[0]
}


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; PARA ABRIR O CONTROLE DE SOM DO WINDOWS, GERENCIAMENTO DE SOM
#b::
Run mmsys.cpl
Return
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PARA ABRIR O WINDOWSPY DO autohotkey
!w::
Run Y:\Programs\AutoHotKey\WindowSpy.ahk
Return

!e::
Run Y:\Programs\AutoHotKey\Lib\SimpleSpy\SimpleSpy.ahk
Return

; 
!r::
Run Y:\Programs\AutoHotKey\Lib\Automate_my_Task.ahk
Return

; SCRIPT DAS HOTSTRINGS DE SERVIÇOS JOGOS PS3. J = JOGOS
!j::
Run X:\Estudos\Github\autohotkey\Jogo-Servicos-Jogo\servicos-ps3-ps4.ahk
Return

; ;;;;;;;;;;;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;*******adjust volume by scrolling while mouse is over taskbar*********************************
;#If MouseIsOver("ahk_class Shell_TrayWnd") ; http://www.autohotkey.net/~Lexikos/AutoHotkey_L/docs/commands/_If.htm
#If MouseIsOver("ahk_class Shell_TrayWnd") or MouseIsOver("ahk_class Shell_SecondaryTrayWnd") ;To use over taskbars on other monitors
WheelUp::Send {Volume_Up} ;Increase volume when over taskbar
WheelDown::Send {Volume_Down} ;Decrease volumen when over taskbar
#If

MouseIsOver(WinTitle) {
	MouseGetPos,,, Win ;Detect Window mouse is over
	return WinExist(WinTitle " ahk_id " Win) ;Return Window title that Mouse is overj
}

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Parameter #1: Pass 1 instead of 0 to hibernate rather than suspend.
; Parameter #2: Pass 1 instead of 0 to suspend immediately rather than asking each application for permission.
; Parameter #3: Pass 1 instead of 0 to disable all wake events.
^!s::DllCall("PowrProf\SetSuspendState", "int", 0, "int", 1, "int", 1) ;  Suspend
^!h::DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 1) ;  Hibernate
^!d::shutdown, 8 ;Powerdown ; https://www.autohotkey.com/docs/comma...



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SCREEN CLIPPING ToolTip
!d::
Run X:\Estudos\Github\autohotkey\ScreenSplit\Screen_Clipping_with_new_OCR.ahk
Return




; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;~ Gui,+ Pesquisar Google
!s::
Gui, Destroy
gui, font, S12  ;Change font size to 12
Gui, Add, GroupBox, x0 w460 h150, Pesquisa: ;add a groupbox 
; gui, Add, Checkbox, x20 y30 checked1 vahk, AutoHotkey.com ;first checkbox and move down / over a bit
gui, Add, Checkbox, x20 y30 checked1 vstackBR, Pt.StackOverflow.com ;first checkbox and move down / over a bit
;gui, Add, Checkbox, checked0 vstackBR, Pt.StackOverflow.com
gui, Add, Checkbox, checked0 vstack, StackOverflow.com
gui, Add, Checkbox, checked1 vstackAHK, StackOverflow.com/AutoHotkey
gui, Add, Checkbox, checked0 vahk, AutoHotkey.com
gui, Add, Checkbox, checked0 vMicro,Microsoft.com
Gui, Add, Checkbox, Checked0 Vtech,Techonthenet.Com
gui, Add, Text, x10 y+20, Pesquisar por:
gui, Add, Edit ,x+10 yp-5 w360  vSearchTerm 
gui, Add, Button, w82 gSearch Default, &Pesquisar
gui, Add, Button, w75 x+25 gCancel Cancel, &Cancelar
gui, font, S10 cblue ;Font size to 10 and color to blue 
gui, Add, Checkbox, x320 yp+8 checked1 vquotes, Adicionar aspas na Pesquisa. ; Wrap Search in Double quotes ;Add check box to wrap in double quotes
gui, Show 
GuiControl,Focus,SearchTerm
return

Search:
Gui Submit ;Needed to pull inf0 from controls
if quotes ;if selected, url enclude double quotes around search term
	SearchTerm:="%22" SearchTerm "%22"


If stackBR 
	run "http://www.google.com/search?q=%SearchTerm%+site:pt.stackoverflow.com"
If stack 
	run "http://www.google.com/search?q=%SearchTerm%+site:stackoverflow.com"
If stackAHK
	run "http://www.google.com/search?q=%SearchTerm%+site:https://stackoverflow.com/questions/tagged/autohotkey"
If micro
	run "http://www.google.com/search?q=%SearchTerm%+site:microsoft.com"
If tech
	run "http://www.google.com/search?q=%SearchTerm%+site:techonthenet.com"
If ahk
	run "http://www.google.com/search?q=%SearchTerm%+site:autohotkey.com"

gui, hide
reload
return

Cancel:
gui, hide
return
^!Escape::ExitApp


;*********************paste plain text from ClipBoard**********************************.
!p:: ;Control G =Paste Text version of Clipboard
Clipboard_Backup:=ClipboardAll ;Store full version of clipboard
ClipBoard := ClipBoard ; Convert clipboard to plain text
SendEvent, ^v ;Send paste
sleep, 100 ;Always have a sleep after pasting and before restoring clipboard
Clipboard:=Clipboard_Backup
Return






;*****************************************************HOTSTRINGS**************************************************.
;*****************************************************HOTSTRINGS**************************************************.
;*****************************************************HOTSTRINGS**************************************************.
;*****************************************************HOTSTRINGS**************************************************.
;*****************************************************HOTSTRINGS**************************************************.
;*****************************************************HOTSTRINGS**************************************************.
;*****************************************************HOTSTRINGS**************************************************.
;*****************************************************HOTSTRINGS**************************************************.
;*****************************************************HOTSTRINGS**************************************************.

::strings.::
(
; StrReplace, substitui palavras, espaços, linhas,etc

; Sintaxe: StrReplace(variavelQueVaiSerModificada, "Texto que vai ser trocado", "pelo que vai ser trocado")

SetTitleMatchMode, 2 ; encontrar somente por conter o nome
WinGetTitle, tituloAdobe, Adobe ; pega o titulo da janela aberta do adobe
; substitui a palavra .PDF - Adobe Acrobat Pro DC (32-bit) que tá no título do adobe por nada("") e armazena na variável tituloNovo
tituloNovo:= StrReplace(tituloAdobe, ".PDF - Adobe Acrobat Pro DC (32-bit)", "") 

; criando variavel count que limita para trocar somente a primeira ocorrencia da palavra repetida, vai trocar somente o primeiro marrom pelo azul
txt:= "o cachorro marrom e o gato marrom foram pegos coelho marrom"
alterado:=StrReplace(txt, "marrom", "azul", count, 1)
MsgBox "|" "txt: "%txt% "|"
MsgBox "alterado primeira ocorrencia: "%alterado%


; remove os line break CR e LF : diferença você encontra aqui: https://stackoverflow.com/questions/1552749/difference-between-cr-lf-lf-and-cr-line-break-types
clipboardFormatado:=StrReplace(clipboard, "`r`n") 

; Troca todos espaços pelo símbolo +
NewStr := StrReplace(OldStr, A_Space, "+")

; Remove todas linhas vazias do texto da variável
Loop
{
	MyString := StrReplace(MyString, "`r`n`r`n", "`r`n", Count)
	if (Count = 0)  ; No more replacements needed.
		break
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; TRIM - REMOVER ESPAÇOS/PALAVRAS NO COMEÇO/MEIO/FIM 

; remove os espaços do começo e do fim da palavra
txtSemEspacos:=Trim(txt)
MsgBox % "|"txtSemEspacos "|"

; Remover os números 0 do começo e do fim
txt2:="00223324500"
txtSem0:=Trim(txt2, "0")
MsgBox % "Variável normal: " txt2
MsgBox % "Após trim de 0: " txtSem0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


encontrarString:="a raposa foi feita para caçar na floresta, raposa é muito bonita"
MsgBox % InStr(encontrarString, "raposa") ; mostra a posição que encontrou a primeira palavra raposa(3)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MsgBox % StrLen(encontrarString) ; retorna quantos caracteres tem

; MISTURANDO FUNÇÕES
Sub:=Trim(SubStr(encontrarString, "raposa", "lagarto"))
MsgBox % Sub


; StrSplit separa a string num array de substrings
; basta colocar a variavel do texto e como quer separar(espaço, vírgula, etc)
txt:= "ola meu amigo, tudo bem com vc? ata taaa a a a a a"
parsed:=StrSplit(txt, " ") ; faz a separação pelo espaço e armazena na variável parsed
MsgBox % Parsed.1 a_Tab parsed.3 ; acessa a posição 1(palavra 1) e posição 3(palavra 3)
MsgBox % StrSplit(txt, " ").5 ; pega a posição 5

)

Return