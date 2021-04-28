#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent
#SingleInstance, Force


global qtdVolumes2Acima:=19
global qtdProxDatabooks:=44

/*
global Arr:= ["Volume 8 - Parte 01 até 07", "Volume 8 - Parte 08 até 13", "Volume 8 - Parte 14"
,"Volume 8 - Parte 15 - Seção 11.10.1 PPRA"
,"Volume 8 - Parte 15 - Seção 11.10.2 PCMAT"
,"Volume 8 - Parte 15 - Seção 11.10.10 NR 02"
,"Volume 8 - Parte 15 - Seção 11.10.11 AVCB"
,"Volume 8 - Parte 15 - Seção 11.10.12 AVALIAÇÕES"
,"Volume 8 - Parte 15 - Seção 11.10.13 PPR"
,"Volume 8 - Parte 15 - Seção 11.10.14 APRs"
,"Volume 8 - Parte 15 - Seção 11.10.15 ARSSO PR-SGI-020_a - Avaliação de Riscos de Segurança e Saúde Ocupacional_obra 300-2"
,"Volume 8 - Parte 15 - Seção 11.10.16 ASOS"
,"Volume 8 - Parte 15 - Seção 11.10.17 CA UTILIZADO"
,"Volume 8 - Parte 15 - Seção 11.10.18 SEGURANÇA RADIOLÓGICA"
,"Volume 8 - Parte 15 - Seção 11.10.19 Laudo Ergonômico"
,"Volume 8 - Parte 15 - Seção 11.10.20 PROGRAMA DE CONSERVAÇÃO AUDITIVA"
,"Volume 8 - Parte 15 - Seção 11.10.21 RELATÓRIO DE ANÁLISE QUANTITATIVA DE RISCO AMBIENTAL"
,"Volume 8 - Parte 15 - Seção 11.10.22 REM", "Volume 8 - Parte 15 - Seção 11.10.23 TERCEIROS"]
*/

global Arr:=["Volume 8 - Parte 15 - Seção 11.10.24 PROCEDIMENTOS"
,"Volume 8 - Parte 15 - Seção 11.10.25 FICHA DE EPI"
,"Volume 8 - Parte 15 - Seção 11.10.26 RELATÓRIO MESAL DE SMS DE OUT-NOV-DEZ"
,"Volume 8 - Parte 15 - Seção 11.10.27 MEIO AMBIENTE"
,"Volume 8 - Parte 15 - Seção 11.10.28 RELATÓRIO DE AVALIAÇÃO FINAL DO DESEMPENHO DE SMS"]


funcCriarBookmarkVolume2Acima(){
	
	#IfWinActive, ahk_class AcrobatSDIWindow
	k := 8
	I:= 1
	Loop, % qtdVolumes2Acima
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
		Send, % Arr[i] 
		
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
		
		Clipboard:= % Arr[i] ".PDF"
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
		; funcCriarBookmarkVolume1()
		funcCriarBookmarkVolume2Acima()
		Sleep, 900
		Send, {End}
		Send, {Up j}
		j++
	}
}


Sleep, 800
SetTitleMatchMode, 2
Sleep, 700
WinActivate, Adobe
WinActivate, ahk_exe Acrobat.exe
Sleep, 500
funcCriarBookmarkVolume2Acima()
Sleep, 300
; funcCriarBookmarkVolume1()
funcProxDatabook()


^Escape::
ExitApp