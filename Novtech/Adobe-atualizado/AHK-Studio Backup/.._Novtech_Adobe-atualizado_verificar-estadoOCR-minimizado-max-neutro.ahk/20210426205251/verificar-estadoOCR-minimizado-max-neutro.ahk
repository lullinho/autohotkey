#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Persistent



; CHECAR SE A JANELA ESTÁ VÍSIVEL(minimizada ou maximizada ou nenhum<<<)
/*
	WinGet, State, MinMax, ahk_exe acrobat.exe
	MsgBox % State
	
	if (State = -1)
		MsgBox, Window is minimized
	else if (State = 1)
		MsgBox, Window is maximized
	else if(State = 0)
		MsgBox, The window is neither minimized nor maximized. OCR Concluído
	else
		MsgBox, Janela inexistente
	
*/

; se a janela ficar ativa quer dizer que terminou o OCR.
SetTitleMatchMode, 2
#IfWinActive, Adobe
meuLoop(){
	Loop
	{
		WinGet, Estado, MinMax, ahk_exe acrobat.exe
		if(Estado = 0) or (Estado = 1){
			WinActivate, Adobe
			Send, {F6}
			Sleep, 500
			Send, {Tab 10}
			Sleep, 600
			Send, {Enter}
			MsgBox Ta
			
			WinMinimize, ahk_class AcrobatSDIWindow
			break ; sai do loop
		}
		
	}
	Reload ; recarrega o script
}
meuLoop()
#IfWinActive

/*
	
	Start:
	
	Loop
		
	{
		
... ; This is where you get your data and copy them to clipboard
		
		if LastListContent=Clipboard
			
		Break
		
		else
			
		{
			
...#2 ; The clipboard is different from before, the script will paste to notepad
			
		}
		
	}
	
	Break: ; This is where the script will go if it encounter "Break"
	
	Sleep 240000 ; Wait for 4*60*1000 ms
	
	Goto Start ; And then restart the Loop again
*/

^Escape::
ExitApp