#NoEnv ;perfomance and compatibility with future autohorkey updates
#SingleInstance, Force ;não vai rodar o mesmo script duas vezes caso vc rode ele várias vezes, força para rodar esse script uma vez


#IfWinActive, AHK_exe notepad.exe
#c::
Send, {Enter}{* 10000000}

Return


#IfWinActive AHK_exe SciTE.exe
#c::
Send, x
Return

Esc::ExitApp

