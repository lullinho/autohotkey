#Include <default_settings>



MouseGetPos, x,y
MsgBox % X A_tab Y

#IfWinActive, ahk_exe Acrobat.exe
	
#IfWinActive
	






; PARA ABRIR O CONTROLE DE SOM DO WINDOWS, GERENCIAMENTO DE SOM
#b::
Run mmsys.cpl
Return

; PARA ABRIR O WINDOWSPY DO autohotkey
^p::
Run Y:\Programs\AutoHotKey\WindowSpy.ahk
Return

