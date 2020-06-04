#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

#N::  

IfWinNotExist, ahk_exe EXCEL.EXE
{
Run, open "D:\Github\autohotkey\Novtech\estoque novtech.xlsx"
WinWaitActive, estoque novtech.xlsx - Excel
WinMinimize
}

InputBox, What, Código da Peça, Por favor insira o código da peça, , 250, 150 ;variavel what, insere um dado nessa variavel, 
; nome da variavel , titulo, texto, tamanho 

FoundCell := ComObjActive("Excel.Application").ActiveSheet.Range("B:B").Find(What) ;procura na planilha excel pela variavel what, procura na coluna B:B

MsgBox, 0, Localização da Peça:, % SubStr(FoundCell.Offset(0, -1).Value, 3, 7), 5 ; retorna o valor que esta na coluna vizinha, ao lado esquerdo(-1), se quiser ao lado direito colocar (1)

Return
; SubStr (substrai, apenas retorna do terceiro caractere até o sétimo caractere)