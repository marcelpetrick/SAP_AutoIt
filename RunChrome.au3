; task: open a browser (chrome in that case); go to the SAP-portal, login, switch to the "Rückmelden"-page

#AutoIt3Wrapper_UseX64 = Y
#include <ImageSearch.au3>

;###### the copy&paste-d function from simplest.au3

; Functions
Func pasteData()
   Local $Sleeptime = 666 ; if there is no pause, then the insertion is missing sometimes because of SAP-hiccups
   Local $y = 0
   Local $x = 0

   Local $search = _ImageSearch('checkImage.bmp', 0, $x, $y, 0)
   If $search = 1 Then
	  MouseMove($x, $y, 5)
   EndIf

   ConsoleWrite($x & ":" & $y & @CRLF)

   ; TODO something like: paste(string, x, y)
   ; also check if successful! else: stop!!!

   MouseMove($x + 80, $y + 160, 5) ; local offset
   MouseClick("left") ; activate
   Local $PspElement= "IN-VT-P1224106-0001" ; the string to use
   ClipPut($PspElement) ; copy
   Send("^v") ; paste
   ConsoleWrite("pasted now hopefully the $PspElement?"& @CRLF)
   Sleep($Sleeptime);
   Send("{ENTER}")
   Sleep($Sleeptime);

   MouseMove($x + 1400, $y + 160 + 0, 5) ; local offset
   MouseClick("left") ; activate
   Local $BeginUhrzeit0 = "09:15"
   ClipPut($BeginUhrzeit0) ; copy
   Send("^v") ; paste
   ConsoleWrite("pasted now hopefully the $BeginUhrzeit0"& @CRLF)
   Sleep($Sleeptime);
   Send("{ENTER}")
   Sleep($Sleeptime);

   MouseMove($x + 1530, $y + 160 + 0, 5) ; local offset
   MouseClick("left") ; activate
   Local $EndeUhrzeit0 = "12:00"
   ClipPut($EndeUhrzeit0) ; copy
   Send("^v") ; paste
   ConsoleWrite("pasted now hopefully the $EndeUhrzeit0"& @CRLF)
   Sleep($Sleeptime);
   Send("{ENTER}")
   Sleep($Sleeptime);

   ; next line: 190 for y

      MouseMove($x + 80, $y + 190, 5) ; local offset
   MouseClick("left") ; activate
   ;Local $PspElement= "IN-VT-P1224106-0001" ; the string to use
   ClipPut($PspElement) ; copy
   Send("^v") ; paste
   ConsoleWrite("pasted now hopefully the $PspElement?"& @CRLF)
   Sleep($Sleeptime);
   Send("{ENTER}")
   Sleep($Sleeptime);

   MouseMove($x + 1400, $y + 190 + 0, 5) ; local offset
   MouseClick("left") ; activate
   Local $BeginUhrzeit1 = "12:30"
   ClipPut($BeginUhrzeit1) ; copy
   Send("^v") ; paste
   ConsoleWrite("pasted now hopefully the $BeginUhrzeit1"& @CRLF)
   Sleep($Sleeptime);
   Send("{ENTER}")
   Sleep($Sleeptime);

   MouseMove($x + 1530, $y + 190 + 0, 5) ; local offset
   MouseClick("left") ; activate
   Local $EndeUhrzeit1 = "18:00"
   ClipPut($EndeUhrzeit1) ; copy
   Send("^v") ; paste
   ConsoleWrite("pasted now hopefully the $EndeUhrzeit1"& @CRLF)
   Sleep($Sleeptime);
   Send("{ENTER}")
   Sleep($Sleeptime);

EndFunc ; end of pasteData()

;################

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
Sleep(3 * $Sleeptime);
Send("{ENTER}")
Sleep(3 * $Sleeptime);
ConsoleWrite("SAP Login ready?" & @CRLF)
;##########################################
; click on "Anmelden" (it is expected that the user has saved its credentials and they are automatically filled in)
; do it via ImageSearch - but just emulate this for now for the sake of easyness
ConsoleWrite("Click on Anmelden" & @CRLF)
; TODO TODO

Local $posX = 0
Local $posY = 0
Local $search = _ImageSearch('anmelden.bmp', 0, $posX, $posY, 0)
If $search = 1 Then
   MouseMove($posX, $posY, 5)
Else
   ConsoleWrite("Search for Anmelden not correct" & @CRLF)
   Exit 1
EndIf

ConsoleWrite("found at: " & $posX & ":" & $posY & @CRLF)
MouseClick("left") ; activate; was already moved to the respective position
Sleep(6000) ; wait some seconds

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
Sleep(6000) ; wait some seconds

;##########################################
; now, that we are logged in and at the correct sheet: enter the data :)))
;##########################################

pasteData() ; call now the function to insert the data into the cells




;##########################################
ConsoleWrite("Exit 0 now" & @CRLF)
Exit 0 ; all fine :)
