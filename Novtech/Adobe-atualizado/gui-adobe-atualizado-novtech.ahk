#NoEnv
#SingleInstance, Force
#Persistent
FileEncoding, UTF-8

Gui New, +AlwaysOnTop, ADOBE - FELIPE LULLIO
Gui Add, Tab3, w600 h500 vTabVariable, Criar Bookmarks Adobe(incluir arquivos)|Incluir Volume 8(bookmark name different)|Fix Bookmarks(Adicionar Parte - XX)


; TAB CRIAR BOOKMARKS
Gui Tab, Criar Bookmarks Adobe(incluir arquivos)
; COLUNA DOS TEXTOS
Gui Add, Text, section,  QUANTIDADE DE PARTES DO VOLUME 1:
Gui Add, Text, , QUANTIDADE DE VOLUMES(Volume 2 para cima):
GUi Add, text, ,QUANTIDADE DE DATABOOKS(Arquivos abertos):
Gui Add, Text, , Array do Volume 1:

; COLUNA DOS EDIT
Gui Add, Edit, w75 vEditVar ys
Gui, Add, UpDown, range0-50 wrap vUpDownVar1Vol1, 11

Gui Add, Edit, w75, 9
Gui, Add, UpDown, range0-50 wrap vUpDownVar2Vol2Acima, 9

Gui Add, Edit, w75 
Gui Add, UpDown, range0-50 wrap vUpDownVar3Databooks

Gui Add, Edit, xs R20 w550 vArrayTextArea, Volume 1 - SEÇÃO 1.1 - Parte 01 até 08`nVolume 1 - SEÇÃO 1.1 - Parte 09 até 17`nVolume 1 - SEÇÃO 1.1 - Parte 18 até 25`nVolume 1 - SEÇÃO 1.1 - Parte 26 até 38`nVolume 1 - SEÇÃO 1.1 - Parte 39 até 48`nVolume 1 - SEÇÃO 1.1 - Parte 49 até 57`nVolume 1 - SEÇÃO 1.1 e 1.2 - Parte 58 até 65`nVolume 1 - SEÇÃO 1.2, 1.3 e 1.4 - Parte 66 até 71`nVolume 1 - SEÇÃO 1.4 , 1.5, 1.6 e 1.7 - Parte 72 até 77`nVolume 1 - SEÇÃO 1.7, 1.8, 1.9, 1.9.1, 1.9.2 e 1.9.3 - Parte 78 até 82`nVolume 1 - SEÇÃO 1.10, 1.11, 1.12, 1.13 e 1.14 - Parte 83 até 91

; BOTÃO SHOW VARIABLES
Gui Add, Button, w350 gCriarBookmark xs, EXECUTAR SCRIPT
Gui Add, Button, w150 gPausarScript xs, PAUSAR SCRIPT
Gui Add, Button, gDespausarScript x+10, DESPAUSAR SCRIPT

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; TAB INCLUIR VOLUME 8
Gui Tab, Incluir Volume 8(bookmark name different)

; COLUNA DOS TEXTOS
Gui Add, Text, section,  QUANTIDADE DE PARTES DO VOLUME 8:
GUi Add, text, ,QUANTIDADE DE DATABOOKS(Arquivos abertos):
Gui Add, Text, , Array do Volume 8:

; COLUNA DOS EDIT
; EDIT UPDOWN DE QUANTIDADE DE PARTES DO VOLUME 8
Gui Add, Edit, w75 ys
Gui, Add, UpDown, range0-50 wrap vUpDownVar4Vol8, 24

; EDIT UPDOWN DE QUANTIDADE DE DATABOOKS - ARQUIVOS ABERTOS
Gui Add, Edit, w75 
Gui Add, UpDown, range0-50 wrap vUpDownVar5DatabooksVol8, 44


Gui Add, Edit, xs R20 w550 vArrayTextAreaVol8, Volume 8 - Parte 01 até 07`nVolume 8 - Parte 08 até 13`nVolume 8 - Parte 14`nVolume 8 - Parte 15 - Seção 11.10.1 PPRA`nVolume 8 - Parte 15 - Seção 11.10.2 PCMAT`nVolume 8 - Parte 15 - Seção 11.10.10 NR 02`nVolume 8 - Parte 15 - Seção 11.10.11 AVCB`nVolume 8 - Parte 15 - Seção 11.10.12 AVALIAÇÕES`nVolume 8 - Parte 15 - Seção 11.10.13 PPR`nVolume 8 - Parte 15 - Seção 11.10.14 APRs`nVolume 8 - Parte 15 - Seção 11.10.15 ARSSO PR-SGI-020_a - Avaliação de Riscos de Segurança e Saúde Ocupacional_obra 300-2`nVolume 8 - Parte 15 - Seção 11.10.16 ASOS`nVolume 8 - Parte 15 - Seção 11.10.17 CA UTILIZADO`nVolume 8 - Parte 15 - Seção 11.10.18 SEGURANÇA RADIOLÓGICA`nVolume 8 - Parte 15 - Seção 11.10.19 Laudo Ergonômico`nVolume 8 - Parte 15 - Seção 11.10.20 PROGRAMA DE CONSERVAÇÃO AUDITIVA`nVolume 8 - Parte 15 - Seção 11.10.21 RELATÓRIO DE ANÁLISE QUANTITATIVA DE RISCO AMBIENTAL`nVolume 8 - Parte 15 - Seção 11.10.22 REM`nVolume 8 - Parte 15 - Seção 11.10.23 TERCEIROS`nVolume 8 - Parte 15 - Seção 11.10.24 PROCEDIMENTOS`nVolume 8 - Parte 15 - Seção 11.10.25 FICHA DE EPI`nVolume 8 - Parte 15 - Seção 11.10.26 RELATÓRIO MESAL DE SMS DE OUT-NOV-DEZ`nVolume 8 - Parte 15 - Seção 11.10.27 MEIO AMBIENTE`nVolume 8 - Parte 15 - Seção 11.10.28 RELATÓRIO DE AVALIAÇÃO FINAL DO DESEMPENHO DE SMS

Gui Add, Button, gCriarBookmarkVol8 w350 xs, EXECUTAR SCRIPT
Gui Add, Button, w150 gPausarScript xs, PAUSAR SCRIPT
Gui Add, Button, gDespausarScript x+10, DESPAUSAR SCRIPT


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; TAB FIX BOOKMARKS
Gui Tab, Fix Bookmarks(Adicionar Parte - XX)

; COLUNA DOS TEXTOS
GUi Add , text , section, QUANTIDADE DE DATABOOKS(Arquivos abertos):
Gui Add, Text,, Array da quantidade de partes de cada arquivo aberto:

; arquivos abertos, qtd de bookmarks
Gui Add, Edit, w75 ys
Gui Add, UpDown, range0-50 wrap vUpDownVar6qtdBookmarks, 42

Gui Add, Edit, xs R25 w550 vArrayPartesBookmark, 3`n9`n8`n13`n10`n9`n8`n6`n6`n5`n9

Gui Add, Button, gFixBookmarks w350 xs, EXECUTAR SCRIPT
Gui Add, Button, w150 gPausarScript xs, PAUSAR SCRIPT
Gui Add, Button, gDespausarScript x+10, DESPAUSAR SCRIPT


Gui Show
Return

PausarScript:
Gui Submit, NoHide
Pause, On
return

DespausarScript:
Gui Submit, NoHide
Pause, Off
return

CriarBookmark:
Gui Submit, NoHide

global LineArray:= StrSplit(ArrayTextArea, "`n", "`r")

global Arr:= ["Volume 1 - SEÇÃO 1.1 - Parte 01 até 08","Volume 1 - SEÇÃO 1.1 - Parte 09 até 17","Volume 1 - SEÇÃO 1.1 - Parte 18 até 25","Volume 1 - SEÇÃO 1.1 - Parte 26 até 38", "Volume 1 - SEÇÃO 1.1 - Parte 39 até 48","Volume 1 - SEÇÃO 1.1 - Parte 49 até 57", "Volume 1 - SEÇÃO 1.1 e 1.2 - Parte 58 até 65", "Volume 1 - SEÇÃO 1.2, 1.3 e 1.4 - Parte 66 até 71","Volume 1 - SEÇÃO 1.4 , 1.5, 1.6 e 1.7 - Parte 72 até 77", "Volume 1 - SEÇÃO 1.7, 1.8, 1.9, 1.9.1, 1.9.2 e 1.9.3 - Parte 78 até 82","Volume 1 - SEÇÃO 1.10, 1.11, 1.12, 1.13 e 1.14 - Parte 83 até 91"]
i:=1
global qtdVolumes1:= UpDownVar1Vol1
global qtdVolumes2Acima:= UpDownVar2Vol2Acima
global qtdProxDatabooks:= UpDownVar3Databooks

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
		Send, % LineArray[i]
		
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
		
		Clipboard:= % LineArray[i] ".PDF"
		; ControlSend, Edit1, % Arr[i] ".PDF", ahk_class #32770 ; escreve o nome do arquivo
		; ControlSend, Edit1, ^v , ahk_class #32770 ; escreve o nome do arquivo
		Control, Editpaste, % Clipboard, Edit1, ahk_class #32770
		Sleep, 1200
		
		; LÓGICA: SE O TÍTULO DO DOCUMENTO FOR IGUAL AO NOME DO BOOKMARK, REMOVE O BOOKMARK CRIADO
		WinGetTitle, titulo, Adobe
		Sleep, 900		
		tituloNovo:= StrReplace(titulo, ".PDF - Adobe Acrobat Pro DC (32-bit)", "")
		Sleep, 400
		if(LineArray[i] = tituloNovo){
			; Sleep, 500
			; Send, {Del}
			ControlClick, Button3, ahk_class #32770 ; clica no botão CANCELAR
			Sleep, 900
		}else{
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
	} ; fim do else do titulo igual ao bookmark
		
		SetControlDelay -1
		ControlClick, Button12, Propriedades do marcador ahk_class #32770 ; clica em Ok
		Sleep, 900
		
		
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

WinGet, Estado, MinMax, ahk_exe acrobat.exe
If(Estado = 0) or (Estado = 1) or (Estado = -1){
	SetTitleMatchMode, 2
	WinActivate, Adobe
	WinActivate,ahk_exe Acrobat.exe
	funcCriarBookmarkVolume1()
	Sleep, 300
	funcCriarBookmarkVolume2Acima("Volume")
	Sleep, 300
	; funcCriarBookmarkVolume1()
	funcProxDatabook()
}else{
	    MsgBox, 262180, Erro, Adobe não está aberto!, 6
}
Return

Submit: ; salva a informação
Gui Submit, NoHide ; salva a informação
MsgBox %SelectedOption%
Return

CriarBookmarkVol8:
Gui Submit, NoHide
; global qtdVolumes8Acima:=6
; global qtdProxDatabooks:=44
global qtdVolumes8Acima:=UpDownVar4Vol8
global qtdProxDatabooks:=UpDownVar5DatabooksVol8

global Arr:=["Volume 8 - Parte 15 - Seção 11.10.23 TERCEIROS"
,"Volume 8 - Parte 15 - Seção 11.10.24 PROCEDIMENTOS"
,"Volume 8 - Parte 15 - Seção 11.10.25 FICHA DE EPI"
,"Volume 8 - Parte 15 - Seção 11.10.26 RELATÓRIO MESAL DE SMS DE OUT-NOV-DEZ"
,"Volume 8 - Parte 15 - Seção 11.10.27 MEIO AMBIENTE"
,"Volume 8 - Parte 15 - Seção 11.10.28 RELATÓRIO DE AVALIAÇÃO FINAL DO DESEMPENHO DE SMS"]

global LineArrayVol8:=StrSplit(ArrayTextAreaVol8, "`n", "`r")


funcCriarBookmarkVolume8Acima(){
	
	#IfWinActive, ahk_class AcrobatSDIWindow
	k := 8
	I:= 1
	Loop, % qtdVolumes8Acima
	{	
		; abaixo cria um bookmark para abrir os bookmarks e depois exclui, envia pro final e pula dois arrow pra cima pra criar volume 8
		Sleep, 500
		Send, ^b
		Sleep, 500
		Send, {Enter}
		Sleep, 500
		Send, {Delete}
		Sleep, 500
		Send, {End}
		Sleep, 500
		Send, {Up 2}
		Sleep, 500
		
		; cria bookmark volume 8
		Sleep, 900
		Send,^b ; criar bookmark
		Sleep, 900
				;ControlSend,,"^b", ahk_exe Acrobat.exe
		; Sleep, 900
				; Send, % "Volume " 
		
		; Send, %nomeVolume% %k%
		Send, % LineArrayVol8[i] 
		
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
		; ControlSend, Edit1, %nomeVolume% %k%.PDF, ahk_class #32770 ; escreve o nome do arquivo
		 ; ControlSend, Edit1, % Arr[i] ".PDF", ahk_class #32770 ; escreve o nome do arquivo
		; ControlSend, Edit1, %nomeVolume%, ahk_class #32770 ; escreve o nome do arquivo
		
		Clipboard:= % LineArrayVol8[i] ".PDF"
		; ControlSend, Edit1, % Arr[i] ".PDF", ahk_class #32770 ; escreve o nome do arquivo
		; ControlSend, Edit1, ^v , ahk_class #32770 ; escreve o nome do arquivo
		Control, Editpaste, % Clipboard, Edit1, ahk_class #32770
		
		Sleep, 1200
		
		; LÓGICA: SE O TÍTULO DO DOCUMENTO FOR IGUAL AO NOME DO BOOKMARK, REMOVE O BOOKMARK CRIADO
		WinGetTitle, titulo, Adobe
		Sleep, 900		
		tituloNovo:= StrReplace(titulo, ".PDF - Adobe Acrobat Pro DC (32-bit)", "")
		Sleep, 900
		if(Arr[i] = tituloNovo){
			ControlClick, Button3, ahk_class #32770 ; clica no botão CANCELAR
			Sleep, 900
		}else{
			/*
					; SE O VOLUME FOR IGUAL A:
				if(k = 8){ ;  OR (i = 2){
					SetControlDelay -1
					ControlClick, Button3, Selecionar arquivo a abrir ahk_class #32770 ; clica no botão cancelar na parte que aparece para selecionar arquivo
					Sleep, 500
				}
			*/
			
			
					;Send, {Tab 2}
				;Sleep, 200
				;Send, {Enter}
			SetControlDelay -1
			ControlClick, Button2, ahk_class #32770 ; clica no botão ABRIR
				; Sleep, 6000
			Sleep, 1200
			
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
		;;;;;;;;;;;;;;;;;;;
			
			Sleep, 1500
			
			SetControlDelay -1
			ControlClick, Button2, Especifique a preferência de abertura ahk_class #32770 ; clica na opção nova janela
			Sleep, 700
			SetControlDelay -1
			ControlClick, Button4, Especifique a preferência de abertura ahk_class #32770 ; clica em Ok
			
			
				; REMOVER A AÇÃO IR PARA UMA PÁGINA NESTE DOCUMENTO QUE É CRIADA AUTOMATICAMENTE QUANDO ADICIONA UM BOOKMARK
			Sleep, 900
			Send, {Tab}
			Sleep, 900
				; Send, {Del}
			ControlClick, Button7, Propriedades do marcador ahk_class #32770 ; remove o bookmark de ir pra página 1
			Sleep, 900
		}
		
		
		
		
		SetControlDelay -1
		ControlClick, Button12, Propriedades do marcador ahk_class #32770 ; clica em Ok
		Sleep, 900
		
		/*
			; excluir o volume 8
			if(k = 8){
				Sleep, 200
				Send, {Del}
			}
		*/
		
		Sleep, 900
		Send, {Down}
		
		k++
		i++
	} 
	
	
	#IfWinActive
	
} ; fim da funcao


funcProxDatabookVol8(){
	
	
	
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
		; funcCriarBookmarkVolume1()
		funcCriarBookmarkVolume8Acima()
		Sleep, 900
		Send, {End}
		Send, {Up j}
		j++
	}
}

WinGet, Estado, MinMax, ahk_exe acrobat.exe
If(Estado = 0) or (Estado = 1) or (Estado = -1){
	Sleep, 500
	SetTitleMatchMode, 2
	WinActivate, Adobe
	WinActivate,ahk_exe Acrobat.exe
	Sleep, 500
	funcCriarBookmarkVolume8Acima()
	Sleep, 300
	; funcCriarBookmarkVolume1()
	funcProxDatabookVol8()
}else{
	    MsgBox, 262180, Erro, Adobe não está aberto!, 6
}


FixBookmarks:
Gui Submit, NoHide
; global qtdArquivos:= "3"
; global qtdBookmarks:= [3, 9, 8, 13, 10, 9, 8, 6, 6, 5, 9]
global qtdArquivos:=UpDownVar6qtdBookmarks
global LineArrayFixBookmark:=StrSplit(ArrayPartesBookmark, "`n", "`r")

global i:="1"
global j:="1"

funcFakeBookmarkFim(){
	Sleep, 500
	SetTitleMatchMode, 2
	WinActivate, Adobe Acrobat Pro DC
	Send, ^b ; atalho pra criar bookmark
	Sleep, 500
	Send, {Esc} ; cancela o escrever nome do bookmark
	Sleep, 500
	Send, {Del} ; deleta o bookmark criado sem nome
	Sleep, 1000
	Send, {End} ; envia para o fim para confimar que esta ultimo bookmark selecionado
}


funcFecharBookmarks(){
; fechar os booksmarks principais, eles que vão ser renomeados só
	Loop, 150{
		Send, {Left 2}
		Send, {Up}
	}
}


funcRenomearBookmarks(){
		; cada vez que rodar o loop vai ser uma quantidade diferente.
	Loop, % LineArrayFixBookmark[j]{
		; MsgBox % "começo loop j = " j
		; MsgBox % "começo loop i = " i
		Sleep, 900
		Send, {F2} ; renomear
		Sleep, 900
		Send, {Right} ; seta direita para append e nao substituir
		Sleep, 900
		
		
		Send, % " - Parte " Format("{:02}/", i) Format("{:02}", LineArrayFixBookmark[j])
		Sleep, 900 
		Send, {Enter} ; confirma o nome do bookmark
		Sleep, 900
		Send, {Down} ; prox bookmark
		Sleep, 300
		i++
; MsgBox % "fim loop j = " j
		; MsgBox % "fim i = " i
	}
	j++
	i:=1
}


/*
	funcRenomearBookmarks(){
			; cada vez que rodar o loop vai ser uma quantidade diferente.
		Loop, % qtdBookmarks[i]{
			
			MsgBox % qtdBookmarks[i]
			i++
		}
	}
	
*/


funcProxDatabookFixBookmark(){
; IR PARA PRÓXIMO DATABOOK CTRL+TAB, databook tem que estar aberto
	Sleep, 900
	Send, ^{Tab}
	
}



/*
	; CHAMAR AS FUNÇÕES
	
	; primeiro
	funcFakeBookmarkFim()
	; segundo
	funcFecharBookmarks()
	; terceiro
	funcRenomearBookmarks()
	; quarto
	funcProxDatabook()
*/


WinGet, Estado, MinMax, ahk_exe acrobat.exe
If(Estado = 0) or (Estado = 1) or (Estado = -1){
	SetTitleMatchMode, 2
	WinActivate, Adobe
	WinActivate,ahk_exe Acrobat.exe
	Sleep, 500
; rodar o loop 11 vezes, são 11 arquivos
Loop, % qtdArquivos
{
 	; CHAMAR AS FUNÇÕES
	
; primeiro
	funcFakeBookmarkFim()
	Sleep, 900
; segundo
	funcFecharBookmarks()
	Sleep, 900
; terceiro
	funcRenomearBookmarks()
	Sleep, 900
; quarto
	funcProxDatabookFixBookmark()
	Sleep, 900
	
}
MsgBox Concluído!

}else{
	    MsgBox, 262180, Erro, Adobe não está aberto!, 6
}
Return
; rodar o loop 11 vezes, são 11 arquivos
Loop, % qtdArquivos
{
 	; CHAMAR AS FUNÇÕES
	
; primeiro
	funcFakeBookmarkFim()
	Sleep, 900
; segundo
	funcFecharBookmarks()
	Sleep, 900
; terceiro
	funcRenomearBookmarks()
	Sleep, 900
; quarto
	funcProxDatabookFixBookmark()
	Sleep, 900
	
}
MsgBox Concluído!



^Escape::
ExitApp
return



