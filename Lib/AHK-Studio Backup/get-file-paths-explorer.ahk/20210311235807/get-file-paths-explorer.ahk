#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#IfWinActive? ahk_class CabinetWClass ;Explorer window
^!c:: ;Copy explorer path to clipboard
clipboard = ; Empty the clipboard
SendInput , ^c ;changd from Send  11/23
ClipWait, 1
If ErrorLevel ;Added errorLevel checking
{
	MsgBox, No text was sent to clipboard
	Return 
}
;*********replace drive letter for full network path* Use UNC path to Network Drive to determine replacement*******
If, A_UserName,Joe,StringReplace,Clipboard,Clipboard,B:,C:\Users\Joe\DropBox\ ;Add DropBox function?
Sort, clipboard  ; This also converts to text (full path and name of each file).
Notify().AddWindow(Clipboard,{Time:3000,Icon:300,Background:"0x1100AA",Title:"Paths on Clipboard",TitleSize:16,size:14})
Return
