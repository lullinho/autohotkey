﻿#SingleInstance, Force
#Persistent
#NoEnv


; lauching programs *****
::wb.:: ;abre esse site no navegador padrao
Run www.autohotkey.com
return

::ex.:: ;abre o excel
Run Excel.exe
return

::varios.:: ;abre varios
Run Excel.exe
Run Notepad.exe
Run google.com.br
return


;autohotkey determina em qual janela estou, qual programa, e voce pode digitar diferentes coisas em diferentes programas, com a mesma hotstring

;botão direito no arquivo ahk, 'Windows Spy'

; pode ser com processo, classe e titulo


#IfWinActive ahk_class Notepad
::tx.:: I'm in notepad
#IfWinActive

#IfWinActive ahk_exe Notepad.exe
::tx.:: I'm in notepad
#IfWinActive

::tx.:: I'm not in NOTEPAD


; change the titlematchmode to use regex, 
SetTitleMatchMode Regex ;
#IfWinActive \.py* ;se tem alguma janela ativa com .py in it
:ro:r.::janela com .py
#IfWinActive, Notepad
:o:r::notepad
#IfWinActive
:o:r.::qualqueroutro



