;*******adjust volume by scrolling while mouse is over taskbar*********************************
;#If MouseIsOver("ahk_class Shell_TrayWnd") ; http://www.autohotkey.net/~Lexikos/AutoHotkey_L/docs/commands/_If.htm
#If MouseIsOver("ahk_class Shell_TrayWnd") or MouseIsOver("ahk_class Shell_SecondaryTrayWnd") ;To use over taskbars on other monitors
WheelUp::Send {Volume_Up} ;Increase volume when over taskbar
WheelDown::Send {Volume_Down} ;Decrease volumen when over taskbar
#If
	
MouseIsOver(WinTitle) {
MouseGetPos,,, Win ;Detect Window mouse is over
return WinExist(WinTitle " ahk_id " Win) ;Return Window title that Mouse is overj
}
