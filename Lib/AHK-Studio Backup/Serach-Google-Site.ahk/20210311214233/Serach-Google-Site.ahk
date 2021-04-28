#Include <Default_Settings>
;**************************************
;~ gui,+AlwaysOnTop
gui, font, S12  ;Change font size to 12
Gui, Add, GroupBox, x0 w460 h150, Search ;add a groupbox 
gui, Add, Checkbox, x20 y30 checked1 vahk, AutoHotkey.com ;first checkbox and move down / over a bit
gui, Add, Checkbox, checked0 vstack, StackOverflow.com
gui, Add, Checkbox, checked1 vstackAHK, StackOverflow.com/AutoHotkey
gui, Add, Checkbox, checked0 vMicro,Microsoft.com
gui, Add, Checkbox, checked0 vTech,TechOntheNet.com
gui, Add, Text, x10 y+20, Search for:
gui, Add, Edit ,x+10 yp-5 w360  vSearchTerm 
gui, Add, Button, w75 gSearch Default, &Search
gui, Add, Button, w75 x+25 gCancel Cancel, &Cancel
gui, font, S10 cblue ;Font size to 10 and color to blue 
gui, Add, Checkbox, x300 yp+8 checked1 vquotes,Wrap Search in Double quotes ;Add check box to wrap in double quotes
gui, Show 
GuiControl,Focus,SearchTerm
return

CapsLock::
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