#Include <default_settings>




^h::
MouseGetPos, x,y
MsgBox % X A_tab Y
Return

#IfWinActive, ahk_exe Acrobat.exe
	adobe:="SEÇÃO III - Tubulação"
	^h::
		MouseClick, left, 28, 214
		Sleep, 200	
		If adobe
			MouseClick, left
#IfWinActive
	
#IfWinActive, ahk_exe sublime_text.exe
	:ro:code.:: ````````
#IfWinActive




; PARA ABRIR O CONTROLE DE SOM DO WINDOWS, GERENCIAMENTO DE SOM
#b::
Run mmsys.cpl
Return

; PARA ABRIR O WINDOWSPY DO autohotkey
^p::
Run Y:\Programs\AutoHotKey\WindowSpy.ahk
Return

