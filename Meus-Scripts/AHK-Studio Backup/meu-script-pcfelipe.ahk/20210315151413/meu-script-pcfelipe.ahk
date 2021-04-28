#Include <default_settings>



; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; POSIÇÃO DO MOUSE
^h::
MouseGetPos, x,y
MsgBox % X A_tab Y
Return


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; adicionar bloco de código trello sublime
#IfWinActive, ahk_exe sublime_text.exe
SetKeyDelay, 1 ; 
	::code.::`````` `n`n`````` {Up}
#IfWinActive


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


^!c:: ;get IP address
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
!z::
Run Y:\Programs\AutoHotKey\WindowSpy.ahk
Return

!x::
Run X:\Estudos\Github\autohotkey\Lib\SimpleSpy\SimpleSpy.ahk
; ;;;;;;;;;;;
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

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Parameter #1: Pass 1 instead of 0 to hibernate rather than suspend.
; Parameter #2: Pass 1 instead of 0 to suspend immediately rather than asking each application for permission.
; Parameter #3: Pass 1 instead of 0 to disable all wake events.
^!s::DllCall("PowrProf\SetSuspendState", "int", 0, "int", 1, "int", 1) ;  Suspend
^!h::DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 1) ;  Hibernate
^!d::shutdown, 8 ;Powerdown ; https://www.autohotkey.com/docs/comma...


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;~ Gui,+ Pesquisar Google
!v::
gui, font, S12  ;Change font size to 12
Gui, Add, GroupBox, x0 w460 h150, Search ;add a groupbox 
gui, Add, Checkbox, x20 y30 checked1 vahk, AutoHotkey.com ;first checkbox and move down / over a bit
gui, Add, Checkbox, checked0 vstack, StackOverflow.com
gui, Add, Checkbox, checked1 vstackAHK, StackOverflow.com/AutoHotkey
gui, Add, Checkbox, checked0 vMicro,Microsoft.com
Gui, Add, Checkbox, Checked0 Vtech,Techonthenet.Com
gui, Add, Text, x10 y+20, Search for:
gui, Add, Edit ,x+10 yp-5 w360  vSearchTerm 
gui, Add, Button, w75 gSearch Default, &Search
gui, Add, Button, w75 x+25 gCancel Cancel, &Cancel
gui, font, S10 cblue ;Font size to 10 and color to blue 
gui, Add, Checkbox, x300 yp+8 checked1 vquotes,Wrap Search in Double quotes ;Add check box to wrap in double quotes
gui, Show 
GuiControl,Focus,SearchTerm
return

Search:
Gui Submit ;Needed to pull inf0 from controls
if quotes ;if selected, url enclude double quotes around search term
	SearchTerm:="%22" SearchTerm "%22"

If ahk
	run "http://www.google.com/search?q=%SearchTerm%+site:autohotkey.com"
If stack 
	run "http://www.google.com/search?q=%SearchTerm%+site:stackoverflow.com"
If stackAHK
	run "http://www.google.com/search?q=%SearchTerm%+site:https://stackoverflow.com/questions/tagged/autohotkey"
If micro
	run "http://www.google.com/search?q=%SearchTerm%+site:microsoft.com"
If tech
	run "http://www.google.com/search?q=%SearchTerm%+site:techonthenet.com"

gui, hide
reload
return

Cancel:
gui, hide
return
Escape::ExitApp