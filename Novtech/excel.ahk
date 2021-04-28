<<<<<<< HEAD
﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
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
Sleep, 200
WinMinimize
}

InputBox, InputPeca, Código do Produto, INSIRA O CÓDIGO DA PEÇA ABAIXO:`n Exemplo: 675k72181, , 250, 150 ;variavel what, insere um dado nessa variavel, 
; nome da variavel , titulo, texto, tamanho 
if ErrorLevel
    MsgBox, 0,CANCELADO, Botão cancelar foi pressionado! Saindo já! Até mais!, 4
else
{
XLBook := ComObjGet("D:\Github\autohotkey\Novtech\estoquenovtech.xlsx")
XLSht := XLBook.ActiveSheet

FoundCell := XLSht.Range("B:B").Find(InputPeca) ;procura na planilha excel pela variavel what, procura na coluna B:B
LocalPeca := % SubStr(FoundCell.Offset(0, -1).Value, 3, 7)
Modelo := % (FoundCell.Offset(0, 1).Value) ; COLUNA MODELO EXCEL
NomeProduto := % (FoundCell.Offset(0, 2).Value) ; COLUNA NOME DO PRODUTO EXCEL

;Se a localização da peça tiver um . na coluna do excel
if (FoundCell.Offset(0, -1).Value = "."){
    LocalPeca:= "Peça sem localização"
}
; se a localização da peça for COLUNA1 OU COLUNA2 OU COLUNA3 OU COLUNA 4
if(FoundCell.Offset(0, -1).Value = "COLUNA 1" or FoundCell.Offset(0, -1).Value = "COLUNA 2" or FoundCell.Offset(0, -1).Value = "COLUNA 3" or FoundCell.Offset(0, -1).Value = "COLUNA 4" ){
     LocalPeca=CO%LocalPeca%
}



if (FoundCell = " " || FoundCell=""){
    MsgBox, 0,PEÇA SEM PRATELEIRA,Peça sem localização ou código inexistente! Tente novamente(W+N), 5
} else if (InputPeca = ""){
    MsgBox, 0,CAMPO VAZIO,Você não digitou nada! Tente novamente(W+N), 5
}
else{
MsgBox, 0, Posição da Peça:, Localização da Peça:      ( %LocalPeca% ) `nNome do Produto:        %NomeProduto% `nModelo:                         ( %Modelo% ), 10
; retorna o valor que esta na coluna vizinha, ao lado esquerdo(-1), se quiser ao lado direito colocar (1) . 5 no final é o timeout.

}

Return
}
=======
﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
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
>>>>>>> 55fd73c75169f4868a031d0d1ab5fb17f2f250bd
; SubStr (substrai, apenas retorna do terceiro caractere até o sétimo caractere)