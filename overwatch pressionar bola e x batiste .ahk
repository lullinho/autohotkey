#NoEnv ;perfomance and compatibility with future autohorkey updates
#SingleInstance, Force ;não vai rodar o mesmo script duas vezes caso vc rode ele várias vezes, força para rodar esse script uma vez

/*
#IfWinActive, AHK_exe RemotePlay.exe
Loop{
	
ControlSend,, {Enter up}
Sleep 1
ControlSend,, {Enter down}
Sleep 1
}
Return
IfWinActive
*/
/*
#IfWinActive, AHK_exe RemotePlay.exe
Loop
{
Send,{Enter down}
sleep 1
Send,{Enter up}
sleep 1
}
return
Capslock::
Suspend
Pause,,1
return


Esc::ExitApp
*/

#IfWinActive, Uso remoto do PS4
Loop
{
	; pressionar o bola, o esc precisa do setkeydelay, se nao, nao vai funcionar
ControlSend,,{Esc}, Uso remoto do PS4
SetKeyDelay, 0, 800
ControlSend,,{Enter down}, Uso remoto do PS4
sleep 10
ControlSend,,{Enter up}, Uso remoto do PS4
sleep 10
}
return







