#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
URLDownloadToFile,http://www.netikus.net/show_ip.html,%A_ScriptDir%\ShowIP.txt
if ErrorLevel = 1
{
	MsgBox,16,IP Addresses,Your public IP address could not be detected.
}
FileReadLINE,MainIP,%A_ScriptDir%\ShowIP.txt,1
MsgBox,64,IP Addresses,Your public IP address is: [%MainIP%]`n`nYour private IP address is: [%A_IPAddress1%]
FileDelete,ShowIP.txt
Return