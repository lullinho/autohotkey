#NoEnv ;perfomance and compatibility with future autohorkey updates
#SingleInstance, Force ;não vai rodar o mesmo script duas vezes caso vc rode ele várias vezes, força para rodar esse script uma vez


; PS4 REMOTE PLAY, DEPENDE DO PROGRAMA PS4 REMOTE PLAY
; CUIDADO COM O TITULO PS4 REMOTE PLAY, SE O WINDOWS FOR AMERICANO � ASSIM: IfWinExist, #IfWinActive PS4 Remote Play, se windows portugues eh assim: #IfWinActive, Uso remoto do PS4. Usar o window spy autohotkey para saber o nome do titlo

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
ControlSend,,{Enter down}, Uso remoto do PS4
sleep 1
ControlSend,,{Enter up}, Uso remoto do PS4
sleep 1

}
return
Capslock::
Suspend
Pause,,1
return



Esc::ExitApp







