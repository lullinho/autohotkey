#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; FIX adobe, adicionar complemento ao bookmark



global qtdPartes:= "3"
global i:="1"
global j:="1"
global qtdArquivos:= "1"
global qtdBookmarks:= [3, 9, 8, 13, 10, 9, 8, 6, 6, 5, 9]

funcFakeBookmarkFim(){
	SetTitleMatchMode, 2
	WinActivate, Adobe
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
	Loop, 20{
		Send, {Left 2}
		Sleep, 500
		Send, {Up}
	}
}


funcRenomearBookmarks(){
		; cada vez que rodar o loop vai ser uma quantidade diferente.
	Loop, % qtdBookmarks[j]{
		; MsgBox % "começo loop j = " j
		; MsgBox % "começo loop i = " i
		Sleep, 900
		Send, {F2} ; renomear
		Sleep, 900
		Send, {Right} ; seta direita para append e nao substituir
		Sleep, 900
		
		
		Send, % " - Parte " Format("{:02}/", i) Format("{:02}", qtdPartes)
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


funcProxDatabook(){
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
	funcProxDatabook()
	Sleep, 900
	
}
MsgBox Concluído!

^esc::
ExitApp

^!p::
Pause,Toggle