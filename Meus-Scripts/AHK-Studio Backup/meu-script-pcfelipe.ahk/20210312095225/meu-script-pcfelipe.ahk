#Include <default_settings>



; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
^h::
MouseGetPos, x,y
MsgBox % X A_tab Y
Return

#IfWinActive, ahk_exe Acrobat.exe
adobe:="SEÇÃO III - Tubulação"
^h::
MouseClick, left, 28, 214
Sleep, 200	
If adobe
	MouseClick, left
Return
#IfWinActive


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#IfWinActive, ahk_exe sublime_text.exe
SetKeyDelay, 1 ; 
	::code.::`````` `n`n`````` {Up}
#IfWinActive


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


^!i:: ;get IP address
clipboard:="Public ip is: " GetIP("http://www.netikus.net/show_ip.html​") "`n`nPrivate IP is:" GetLocalIPByAdaptor("Ethernet")
MsgBox 64, IP Address, % Clipboard
Return

GetIP(URL){
	http:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
	http.Open("GET","http://www.netikus.net/show_ip.html",1)
	http.Send()
	http.WaitForResponse
	If (http.ResponseText="Error"){
		MsgBox 16, IP Address, Sorry, your public IP address could not be detected
		Return
	}
	return http.ResponseText
}

; pegar o ip pelo adaptador

GetLocalIPByAdaptor(adaptorName) {
	objWMIService := ComObjGet("winmgmts:{impersonationLevel = impersonate}!\\.\root\cimv2")
	colItems := objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapter WHERE NetConnectionID = '" adaptorName "'")._NewEnum, colItems[objItem]
	colItems := objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE InterfaceIndex = '" objItem.InterfaceIndex "'")._NewEnum, colItems[objItem]
	Return objItem.IPAddress[0]
}


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; PARA ABRIR O CONTROLE DE SOM DO WINDOWS, GERENCIAMENTO DE SOM
#b::
Run mmsys.cpl
Return
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PARA ABRIR O WINDOWSPY DO autohotkey
^p::
Run Y:\Programs\AutoHotKey\WindowSpy.ahk
Return
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
