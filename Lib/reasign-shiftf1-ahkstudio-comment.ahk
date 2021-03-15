#Include <Default_Settings>

;********************If AHK Studio is Active***********************************
#IfWinActive​,AHK Studio 
!q:: ;Send Shift and F1 in 
SendInput, +{F1}
return
!f:: ;Send Shift and F1 in 
SendInput, !{F1}
return
#IfWinActive