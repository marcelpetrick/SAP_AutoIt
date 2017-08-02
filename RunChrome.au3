; task: open a browser (chrome in that case); go to the SAP-portal, login, switch to the "Rückmelden"-page

#AutoIt3Wrapper_UseX64 = Y
#include <ImageSearch.au3>

; open the browser
Local $chromeTitle = "Neuer Tab - Google Chrome" ; either full or partial match? https://www.autoitscript.com/autoit3/docs/functions/AutoItSetOption.htm#WinTitleMatchMode
Local $Sleeptime = 666

Local $exePath = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" ; not checked if also works with other browsers
Local $pid = Run($exePath)
ConsoleWrite("opened chrome?" & @CRLF)

Sleep(5 * $Sleeptime);

;~ Local $handle = WinWait($chromeTitle)
;~ ConsoleWrite("after WinWait" & @CRLF)
;~ If $handle == 0 Then
;~ 	ConsoleWrite("No handle with given title found:" & $chromeTitle & @CRLF)
;~ 	Exit 1 ; quit early
;~ Else
;~ 	ConsoleWrite("Handle OK" & @CRLF)
;~  EndIf

Send("^t") ; make a new tab - just then we have a valid handle ... ugh

WinSetState($chromeTitle, "", @SW_MAXIMIZE) ; maximize the window for better overview and for easier search

Sleep($Sleeptime);
Send("^l") ; go to the address bar
ClipPut("https://sap.able-group.de") ; go to the SAP-portal
Send("^v") ; paste
Sleep($Sleeptime);
Send("{ENTER}")
Sleep($Sleeptime);
ConsoleWrite("SAP Login ready?" & @CRLF)
;##########################################
; click on "Anmelden" (it is expected that the user has saved its credentials and they are automatically filled in)
; do it via ImageSearch - but just emulate this for now for the sake of easyness
ConsoleWrite("Click on Anmelden" & @CRLF)
; TODO TODO

Global $posX = 0
Global $posY = 0
Local $search = _ImageSearch('anmelden.bmp', 0, $posX, $posY, 0)
If $search = 1 Then
   MouseMove($posX, $posY, 5)
Else
   ConsoleWrite("Search for Anmelden not correct" & @CRLF)
   Exit 1
EndIf

ConsoleWrite("found at: " & $posX & ":" & $posY & @CRLF)
MouseClick("left") ; activate; was already moved to the respective position
Sleep(5000) ; wait some seconds

;##########################################
; wait for some time
ConsoleWrite("Click on Projekte rueckmelden" & @CRLF)
; TODO find "Projekt rueckmelden" and click it

$search = _ImageSearch('rueckmelden.bmp', 0, $posX, $posY, 0)
If $search = 1 Then
   MouseMove($posX, $posY, 5)
Else
   ConsoleWrite("Search for Rueckmelden not correct" & @CRLF)
   Exit 1
EndIf

ConsoleWrite("found at: " & $posX & ":" & $posY & @CRLF)
MouseClick("left") ; activate; was already moved to the respective position
Sleep(5000) ; wait some seconds

;##########################################
; wait for some more time

ConsoleWrite("Exit 0 now" & @CRLF)
Exit 0 ; all fine :)
