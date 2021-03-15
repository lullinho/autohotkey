#Include <Default_Settings>
;*********************paste plain text from ClipBoard**********************************.
^g:: ;Control G =Paste Text version of Clipboard
Clipboard_Backup:=ClipboardAll ;Store full version of clipboard
ClipBoard := ClipBoard ; Convert clipboard to plain text
SendEvent, ^v ;Send paste
sleep, 100 ;Always have a sleep after pasting and before restoring clipboard
Clipboard:=Clipboard_Backup
Return

usage