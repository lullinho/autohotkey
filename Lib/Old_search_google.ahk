#Include <Default_Settings>

^x::
InputBox, Search, Search sites with Google:,,,700, 100
if (Search= "") or (Error = 1)
	return
Run, chrome.exe "http://www.google.com/search?q=%Search%+site:stackoverflow.com"
Run, chrome.exe "http://www.google.com/search?q=%Search%+site:https://stackoverflow.com/questions/tagged/autohotkey"
Run, chrome.exe "http://www.google.com/search?q=%Search%+site:autohotkey.com" 
return