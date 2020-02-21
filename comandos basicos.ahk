#NoEnv ;perfomance and compatibility with future autohorkey updates
#SingleInstance, Force ;não vai rodar o mesmo script duas vezes caso vc rode ele várias vezes, força para rodar esse script uma vez


; Selecionar arquivos no pc, abrir pastas, pegar nome de arquivos..
FileSelectFile,Var,M,, Selecione alguns arquivos
MsgBox % Var ; exibir o nome do arquivo que vc selecionou.
MsgBox Olá, caixa de texto sendo exibida

; Trocar o botão por save
FileSelectFile, Var, S, C:\Intel, Salvar
MsgBox % Var

; Com algum filtro
FileSelectFile, Var, S, C:\temp\blah.ahk, Aparece o .ahk filtro, *.ahk; *.txt 

; Você pode colocar para exibir a caixa de pastas
FileSelectFolder, Var,,,Veja pastas abaixo
;HOTSTRINGS

::hs.::HotStringhws
::hw.::Hello`nworld ;``n pula uma linha 
:o:hi.::Hello firned ;a letra 'o' faz tirar o espaço que é inserido no final, previne que o carectere espaço sera inserido, espace, 
:*:hi2::Não espera voce digitar espaco ou um caractere final ; avoid ending caracteer, nao espera um caractere final, nao espera vc apertar espaço para digitar, o * faz isso

;caracteres especiais no hotkey, exemplo "!"
:r:gw.::Goodby cruel world! ;você pode colocar o r(raw) no começo, ou colocar o caractere entre {}, ai ele vai ser exibido

/*Common modifier keys
# = windows
^ = control
! = alt
+ = shift
*/
;windows+n abre o notepad
#n::Run, Notepad.exe ;como o notepad esta na raiz do windows, nao precisa incluir todo o caminho completo para o arquivo
#e::run, mailto:felipelullio@novtech.com.br ; windows+e abre outlook envia email para felipelullio
#w::run, https://google.com ;windows + w abre o site google

;so vai digitar o texto ali se vc tiver na janela notepad
#IfWinActive, AHK_exe notepad.exe ; ao abrir um winactive, vc deve fechar ele
#!c:: ;windows+alt+c
Send, `;*********************************
Return
#IfWinActive ;aqui o fechamento


;appskey é um botao no teclado ao lado do ctrl, ele clica cm botao direito do mous
AppsKey & d:: ;appskey + d abre o notepad
run, Notepad.exe
return

; voce pode trolar, tipo, fazer com q a letra a seja b
;a::b

