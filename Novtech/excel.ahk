#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force



#N::  

FilePath :=  "D:\Github\autohotkey\Novtech\estoquenovtech.xlsx"


IfWinNotExist, ahk_exe EXCEL.EXE
{
Run, open %FilePath%
WinWaitActive, estoquenovtech.xlsx - Excel
WinMinimize
}

InputBox, What, Código da Peça, Por favor - Insira o código da peça!, , 250, 150 ;variavel what, insere um dado nessa variavel, 
; nome da variavel , titulo, texto, tamanho 
if ErrorLevel
    MsgBox, 0,CANCELADO, Botão cancelar foi pressionado! Saindo!.
else
{
XLBook := ComObjGet("D:\Github\autohotkey\Novtech\estoquenovtech.xlsx")
XLSht := XLBook.ActiveSheet

FoundCell := XLSht.Range("B:B").Find(What) ;procura na planilha excel pela variavel what, procura na coluna B:B

if (FoundCell = "")
    MsgBox, 0,PEÇA SEM PRATELEIRA,Peça sem localização!
else
MsgBox, 0, Localização da Peça:, % SubStr(FoundCell.Offset(0, -1).Value, 3, 7), 5 ; retorna o valor que esta na coluna vizinha, ao lado esquerdo(-1), se quiser ao lado direito colocar (1)



Return
}
; SubStr (substrai, apenas retorna do terceiro caractere até o sétimo caractere)