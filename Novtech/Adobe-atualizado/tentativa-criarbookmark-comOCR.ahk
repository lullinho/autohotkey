#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

/*
	GuiSize:
	MsgBox % A_GuiWidth A_Tab A_GuiHeight A_tab A_EventInfo
*/
global Volume5Capa:= [01, 327, 939, 1479]
Volume5Item:= [06, 332, 604, 943]


SetTitleMatchMode, 2
WinActivate, Adobe
Sleep, 300



myFunc()
{
	
	For keyIndex, Value in Volume5Capa
	{
		Sleep, 900
		Send, ^+{n} ; ir ate pagina
		Sleep, 900
	; Send, 1479 ; pagina 100
		Send, % Volume5Capa[keyIndex]
		Send, {Enter} ; ok para ir ate pagina
		Sleep, 900
	; Send, ^{-} ; diminuir zoom
		Send, ^0 ; ajusta visualização pra pagina caber na visualização
		
		Sleep, 900
		Send, v ; troca para modo de seleção de texto
		
		Sleep, 900
		CoordMode, mouse, screen
		Send, #!
		MouseClickDrag, left, 1367, 1013, 1579, 1010
		Sleep, 900
		Send, ^c
		
		Sleep, 500
		Send, ^b
		Sleep, 500
		Send, ^v
		Sleep, 600
		Send, {Enter}
	}
	
	
}
myFunc()

Return
^Escape::
ExitApp