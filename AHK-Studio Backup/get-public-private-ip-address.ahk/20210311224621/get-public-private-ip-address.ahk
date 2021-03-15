#Include <Default_Settings>

^!i:: ;get IP address
clipboard:="Public ip is: " GetIP("http://www.netikus.net/show_ip.html​") "`n`nPrivate IP is:" A_IPAddress1
MsgBox 64, IP Address, % Clipboard

GetIP(URL){
	http:=ComObjCreate("WinHttp.WinHttpRequest.5.1")
	http.Open("GET",URL,1)
	http.Send()
	http.WaitForResponse
	If (http.ResponseText="Error"){
		MsgBox 16, IP Address, Sorry, your public IP address could not be detected
		Return
	}
	return http.ResponseText
}
MsgBox http.ResponseText