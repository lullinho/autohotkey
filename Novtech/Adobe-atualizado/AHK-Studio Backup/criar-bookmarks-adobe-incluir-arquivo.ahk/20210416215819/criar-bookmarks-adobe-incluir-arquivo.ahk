#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
#SingleInstance,Force
/*
	If (! A_IsAdmin){
		Run *RunAs "%A_ScriptFullPath%"
		ExitApp
	}
*/

	; bookmark automático com incremento

/*
		#IfWinActive, ahk_class AcrobatSDIWindow
		I := 1
		-::
		Loop, 5
		{		
				Send,^b
				Sleep, 200
				Send, % "Volume " I++
				Sleep, 200
				Send {Return}
				Sleep, 400
	} 
	Send, {Home} ; volta para o primeiro item do bookmark
	#IfWinActive
*/


; ControlSend,,{Enter}, ahk_exe Acrobat.exe
; ControlSend,,{TAB}, ahk_exe Acrobat.exe


global Arr:= ["Volume 1 - SEÇÃO 1.1 - Parte 01 até 08","Volume 1 - SEÇÃO 1.1 - Parte 09 até 17","Volume 1 - SEÇÃO 1.1 - Parte 18 até 25","Volume 1 - SEÇÃO 1.1 - Parte 26 até 38", "Volume 1 - SEÇÃO 1.1 - Parte 39 até 48","Volume 1 - SEÇÃO 1.1 - Parte 49 até 57", "Volume 1 - SEÇÃO 1.1 e 1.2 - Parte 58 até 65", "Volume 1 - SEÇÃO 1.2, 1.3 e 1.4 - Parte 66 até 71","Volume 1 - SEÇÃO 1.4 , 1.5, 1.6 e 1.7 - Parte 72 até 77", "Volume 1 - SEÇÃO 1.7, 1.8, 1.9, 1.9.1, 1.9.2 e 1.9.3 - Parte 78 até 82","Volume 1 - SEÇÃO 1.10, 1.11, 1.12, 1.13 e 1.14 - Parte 83 até 91" ]
i:=1

/*
	For keyIndex, Value in Arr
		MsgBox % keyIndex a_tab Value
*/

global qtdVolumes1:=11
global qtdVolumes2Acima:=9
global qtdProxDatabooks:=17

funcCriarBookmarkVolume1(){
	#IfWinActive, ahk_class AcrobatSDIWindow
	I := 1
	Loop, % qtdVolumes1
	{	
		; if()
		
		
		Sleep, 900
		Send,^b
		Sleep, 900
				;ControlSend,,"^b", ahk_exe Acrobat.exe
		Sleep, 900
				; Send, % "Volume " 
		
		; Send, %nomeVolume% %i%
		Send, % Arr[i]
		
				; ControlSend,, "Volume " %i%, ahk_exe Acrobat.exe ; escreve o nome do arquivo
		Sleep, 1000
		Send {Return}
		
		Sleep, 900
		Send, {AppsKey} ; clique com botão direito do mouse no item selecionado
		Sleep, 900
		Send, {Down 10}
		Sleep, 900
		Send, {Enter}	
		
		
		Sleep,900
		Control, TabRight,,SysTabControl321, ahk_class #32770 ; clica na segunda tab (Ações)
		
		Sleep, 900
		Send, {TAB} ; move para o botão Adicionar
		Sleep, 900
		Send, {Enter} ; clica no adicionar
				; ControlClick, Button2, Propriedades do marcador ahk_class #32770 ; clica no botão adicionar (ABA aÇÕES > Propriedades do marcados/bookmark)
		
		Sleep, 1300
		; SetKeyDelay, 10, 150 ; o valor 100 é a velocidade de escrita 
				; ControlSend, Edit1, Volume %i%.PDF, ahk_class #32770 ; escreve o nome do arquivo
		; ControlSend, Edit1, %nomeVolume% %i%.PDF, ahk_class #32770 ; escreve o nome do arquivo
		
		Clipboard:= % Arr[i] ".PDF"
		; ControlSend, Edit1, % Arr[i] ".PDF", ahk_class #32770 ; escreve o nome do arquivo
		; ControlSend, Edit1, ^v , ahk_class #32770 ; escreve o nome do arquivo
		Control, Editpaste, % Clipboard, Edit1, ahk_class #32770
		
		
		;  ControlSend, Edit1, %nomeVolume%, ahk_class #32770 ; escreve o nome do arquivo
				;Sleep, 6000
		Sleep, 900
				; SE O VOLUME FOR IGUAL A:
		/*
			if(i = 8){ ;  OR (i = 2){
				SetControlDelay -1
				ControlClick, Button3, Selecionar arquivo a abrir ahk_class #32770 ; clica no botão cancelar na parte que aparece para selecionar arquivo
				Sleep, 1000
			}else{}
		*/
					;Send, {Tab 2}
				;Sleep, 200
				;Send, {Enter}
		SetControlDelay -1
		ControlClick, Button2, ahk_class #32770 ; clica no botão ABRIR
				; Sleep, 6000
		Sleep, 900
		
		
		
		
		
		; VERIFICAR SE DEU ERRO AO ABRIR UM ARQUIVO QUE NÃO EXISTE
		SetTitleMatchMode, 2
		ControlGet, hCtl, Hwnd, , DirectUIHWND1, Selecionar arquivo a abrir ahk_class #32770
		oAcc := Acc_Get("Object", "4.1", 0, "ahk_id " hCtl)
		vText := oAcc.accName(0)
		oAcc := ""
		; MsgBox % vText
		; se apareceu a janela que tem o warning = maininstructionicon
		if(vText = "MainInstructionIcon"){
			Pause, On
		}
		
		
		Sleep, 1500
		SetControlDelay -1
		ControlClick, Button2, Especifique a preferência de abertura ahk_class #32770 ; clica na opção nova janela
		Sleep, 900
		SetControlDelay -1
		ControlClick, Button4, Especifique a preferência de abertura ahk_class #32770 ; clica em Ok
		
		
		; REMOVER A AÇÃO IR PARA UMA PÁGINA NESTE DOCUMENTO QUE É CRIADA AUTOMATICAMENTE QUANDO ADICIONA UM BOOKMARK
		Sleep, 900
		Send, {Tab}
		Sleep, 900
				; Send, {Del}
		ControlClick, Button7, Propriedades do marcador ahk_class #32770 ; remove o bookmark de ir pra página 1
		Sleep, 1200
		
		
		SetControlDelay -1
		ControlClick, Button12, Propriedades do marcador ahk_class #32770 ; clica em Ok
		Sleep, 900
		
		; LÓGICA: SE O TÍTULO DO DOCUMENTO FOR IGUAL AO NOME DO BOOKMARK, REMOVE O BOOKMARK CRIADO
		WinGetTitle, titulo, Adobe
		Sleep, 900		
		tituloNovo:= StrReplace(titulo, ".PDF - Adobe Acrobat Pro DC (32-bit)", "")
		Sleep, 400
		if(Arr[i] = tituloNovo){
			Sleep, 500
			Send, {Del}
		}
		
		
		Sleep, 900
		Send, {Down}
		
		i++
		
		
	} 
	
	
	#IfWinActive
	
} ; fim da funcao

funcCriarBookmarkVolume2Acima(nomeVolume){
	
	#IfWinActive, ahk_class AcrobatSDIWindow
	k := 2
	Loop, % qtdVolumes2Acima
	{	
		
		Sleep, 900
		Send,^b
		Sleep, 900
				;ControlSend,,"^b", ahk_exe Acrobat.exe
		; Sleep, 900
				; Send, % "Volume " 
		
		Send, %nomeVolume% %k%
		; Send, % Arr[i]
		
				; ControlSend,, "Volume " %i%, ahk_exe Acrobat.exe ; escreve o nome do arquivo
		Sleep, 900
		Send {Return}
		
		Sleep, 900
		Send, {AppsKey} ; clique com botão direito do mouse no item selecionado
		Sleep, 900
		Send, {Down 10}
		Sleep, 900
		Send, {Enter}	
		
		
		Sleep, 900
		Control, TabRight,,SysTabControl321, ahk_class #32770 ; clica na segunda tab (Ações)
		
		Sleep, 900
		Send, {TAB} ; move para o botão Adicionar
		Sleep, 900
		Send, {Enter} ; clica no adicionar
				; ControlClick, Button2, Propriedades do marcador ahk_class #32770 ; clica no botão adicionar (ABA aÇÕES > Propriedades do marcados/bookmark)
		
		Sleep, 1300
		SetKeyDelay, 10, 150 ; o valor 100 é a velocidade de escrita 
				; ControlSend, Edit1, Volume %i%.PDF, ahk_class #32770 ; escreve o nome do arquivo
		ControlSend, Edit1, %nomeVolume% %k%.PDF, ahk_class #32770 ; escreve o nome do arquivo
		; ControlSend, Edit1, % Arr[i] ".PDF", ahk_class #32770 ; escreve o nome do arquivo
		; ControlSend, Edit1, %nomeVolume%, ahk_class #32770 ; escreve o nome do arquivo
				;Sleep, 6000
		Sleep, 1200
		
				; SE O VOLUME FOR IGUAL A:
		if(k = 8){ ;  OR (i = 2){
			SetControlDelay -1
			ControlClick, Button3, Selecionar arquivo a abrir ahk_class #32770 ; clica no botão cancelar na parte que aparece para selecionar arquivo
			Sleep, 500
		}else{
					;Send, {Tab 2}
				;Sleep, 200
				;Send, {Enter}
			SetControlDelay -1
			ControlClick, Button2, ahk_class #32770 ; clica no botão ABRIR
				; Sleep, 6000
			Sleep, 1200
			SetControlDelay -1
			ControlClick, Button2, Especifique a preferência de abertura ahk_class #32770 ; clica na opção nova janela
			Sleep, 700
			SetControlDelay -1
			ControlClick, Button4, Especifique a preferência de abertura ahk_class #32770 ; clica em Ok
		}
		
				; REMOVER A AÇÃO IR PARA UMA PÁGINA NESTE DOCUMENTO QUE É CRIADA AUTOMATICAMENTE QUANDO ADICIONA UM BOOKMARK
		Sleep, 900
		Send, {Tab}
		Sleep, 900
				; Send, {Del}
		ControlClick, Button7, Propriedades do marcador ahk_class #32770 ; remove o bookmark de ir pra página 1
		Sleep, 900
		
		
		SetControlDelay -1
		ControlClick, Button12, Propriedades do marcador ahk_class #32770 ; clica em Ok
		Sleep, 900
		
		; excluir o volume 8
		if(k = 8){
			Sleep, 200
			Send, {Del}
		}
		
		; LÓGICA: SE O TÍTULO DO DOCUMENTO FOR IGUAL AO NOME DO BOOKMARK, REMOVE O BOOKMARK CRIADO
		SetTitleMatchMode, 2
		WinGetTitle, titulo, Adobe
		Sleep, 900		
		tituloNovo:= StrReplace(titulo, ".PDF - Adobe Acrobat Pro DC (32-bit)", "")
		Sleep, 400
		if(%nomeVolume% %k% = tituloNovo){
			Sleep, 500
			Send, {Del}
		}
		
		Sleep, 900
		Send, {Down}
		
		k++
	} 
	
	
	#IfWinActive
	
} ; fim da funcao




funcProxDatabook(){
	
	
	
	SetTitleMatchMode, 2
	WinActivate, Adobe ; PRIMEIRO ATIVA O ADOBE
	Sleep, 800
		; myFunc("Volume") ;S SEGUNDO - CHAMANDO A FUNÇÃO PARA RODAR
	global j:=0
	Loop, % qtdProxDatabooks
		
	
	{
		/*
			SetTitleMatchMode, 2
				; WinActivate, Adobe ; ativa adobe após executar toda a função que escreve os bookmarks e anexa arquivo no bookmark
			Sleep, 900
			Send, {End} ; envia pro final da pagina, pro ultimo bookmark
			Sleep, 1200
			Send, {Up %j%} ; envia seta pra cima(0 na primeira vez) para selecionar o bookmark (começa no último bookmark)
			Sleep, 900
			Send, {AppsKey} ; botão direito no bookmark
			Sleep, 900
			Send, {Down} ; seta para baixo para marcar o "Ir para marcadores"
			Sleep, 500
			Send, {Enter} ; seleciona o 'Ir para marcadors' > vai abrir um novo databook/arquivo que não foi feito os bookmark ainda
			Sleep, 900
		*/
		Sleep, 500
		Send, ^{Tab}
		
		
			; myFunc("Volume") ; chama a função novamente para criar os bookmarks novamente
		; myFunc("Volume 1 - Parte")
		funcCriarBookmarkVolume1()
		funcCriarBookmarkVolume2Acima("Volume")
		Sleep, 900
		Send, {End}
		Send, {Up j}
		j++
	}
}

SetTitleMatchMode, 2
WinActivate, Adobe
WinActivate,ahk_exe Acrobat.exe

; funcCriarBookmarkVolume("Volume 1 - Parte"%i%)

/*
	funcChamarFuncCriarBookmarkVolume(){
		For keyIndex, Value in Arr{
			; MsgBox % keyIndex a_tab Value
			funcCriarBookmarkVolume(Value)
		}
		
	}
*/


funcCriarBookmarkVolume1()
Sleep, 300
funcCriarBookmarkVolume2Acima("Volume")
Sleep, 300
; funcCriarBookmarkVolume1()
funcProxDatabook()



 ; volta para o primeiro item do bookmark


; propriedades do bookmark adicionar arquivo no bookmark


/*
			SetTitleMatchMode, 2
			WinActivate Adobe
			Sleep,100
			Send, ^+{F5}
			Sleep, 900
			SetKeyDelay, 9 ; altera a velocidade, muitas vezes tem problema de enviar extremamente rápido
			Send {TAB 7}
			Sleep, 900
			Send,{Down}
			
			Sleep, 900
			Send, {TAB}
			Sleep, 900 ; ATÉ AQUI FOI SÓ PARA ATIVAR A ABA BOOKMARK E MARCAR O PRIMEIRO BOOKMARK
			
			
			Send, {AppsKey} ; clique com botão direito do mouse no item selecionado
			Sleep, 400
			Send, {Down 10}
			Send, {Enter}	
			
			
			Sleep,900
			Control, TabRight,,SysTabControl321, ahk_class #32770 ; clica na segunda tab (Ações)
			
			
			Sleep, 900
			ControlClick, Button2,  Propriedades do marcador ahk_class #32770 ; clica no botão adicionar (ABA aÇÕES > Propriedades do marcados/bookmark)
			Sleep, 2000
			SetKeyDelay, 10, 200 ; o valor 100 é a velocidade de escrita 
			ControlSend, Edit1, DataBook-vol2.PDF, ahk_class #32770 ; escreve o nome do arquivo
			Sleep, 1000
			ControlClick, Button2, Selecionar arquivo a abrir ahk_class #32770 
			Sleep, 900
			ControlClick, Button2, Especifique a preferência de abertura ahk_class #32770 ; clica na opção nova janela
			Sleep, 100
			ControlClick, Button4, Especifique a preferência de abertura ahk_class #32770 ; clica em Ok
			Sleep, 100
			ControlClick, Button12, Propriedades do marcador ahk_class #32770 ; clica em Ok
			
			Sleep, 900
			Send, {Down}
		*/
		
		
		
		/*
	; ControlMove, AVL_AVView148, 550, 150, 800, 850, ahk_exe Acrobat.exe ; muda o tamanho e posição dos bookmark
			
			WinActivate, ahk_exe Acrobat.exe
			Sleep, 300
			ControlClick, Volume 3, Adobe
		*/
		
		
; REMOVE O PROGRAMA DE ADOBE DE FICAR SEMPRE NA FRENTE DE OUTROS PROGRAMAS AO EXECUTAR OCR, DESATIVA O ACIMA
		
		/*
			SetTitleMatchMode, 2
			WinSet, AlwaysOnTop, Off, Adobe ; deixa a janela sempre desativa acima 
			WinMinimize, Adobe
	; WinMaximize, Adobe
		*/
		
		/*
			
			X:=0
	 ;#[Untitled1]
			#IfWinActive, ahk_class AdobeAcrobat
			Loop
			{
				X:=A_INDEX
				Send,^b
				Sleep, 100
				Send, % "Volume "X
				Sleep, 100
				
				Send {Return}
				
				return
			}Until (A_Index=5)	
			#IfWinActive ;
		*/
		
		
; abrir arquivo pdf, basta digitar caminhbo do pdf
		/*
			Gui, Add, Edit , w200 vpdfname, 
			Gui, Add, Button, gopenpdf default , OPEN
			Gui, show
			
			return
			
			openpdf:
			Gui,Submit,Nohide
			source := "" . pdfname 
			run, %source%
			return 
			
			Exit:
			GuiClose:
			ExitApp 
			
			#IfWinActive, ahk_class AdobeAcrobat 
			b:: SendInput, !v5
			g:: Sendinput, !v6
			l:: Sendinput, !v7 ;edit: x intereferes with another function
			c:: Sendinput, !v8
			return
		*/
		
; SAIR DO CÃ“DIGO RAPIDAMENTE, CASO DE ERRO ETC, PARA NÃƒO FICAR RODANDO CÃ“DIGO
		^escape:: ExitApp
		
		^!b::Pause,Toggle

