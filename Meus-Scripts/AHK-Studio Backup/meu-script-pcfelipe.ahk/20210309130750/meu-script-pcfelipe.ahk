#Include <default_settings>




^h::
MouseGetPos, x,y
MsgBox % X A_tab Y
Return

#IfWinActive, ahk_exe Acrobat.exe
	^h::{Click 2}, 36, 174
#IfWinActive
	






; PARA ABRIR O CONTROLE DE SOM DO WINDOWS, GERENCIAMENTO DE SOM
#b::
Run mmsys.cpl
Return

; PARA ABRIR O WINDOWSPY DO autohotkey
^p::
Run Y:\Programs\AutoHotKey\WindowSpy.ahk
Return

