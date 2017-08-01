#AutoIt3Wrapper_UseX64 = Y
#include <ImageSearch.au3>
; famous error:
; "C:\Program Files (x86)\AutoIt3\Include\ImageSearch.au3" (44) : ==> Subscript used on non-accessible variable.:

HotKeySet("p", "checkForImage")

; if there is no pause, then the insertion is missing sometimes because of SAP-hiccups
Global $Sleeptime = 666
; just as temporary variables ... TODO
Global $y = 0
Global $x = 0

; Functions
Func checkForImage()
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

EndFunc

while 1
   sleep(200)
WEnd


; Global $PspElement= "IN-VT-P1224106-0001"
; Global BeginUhrzeit0 = "09:15" ; also doable as Array, because begin&end belong together
; Global EndeUhrzeit0 = "12:00"
; TODO also add the second row

; 80,160 (x,y) first field
; 1380,0 start time
; 1500,0 end time


; ClipPut($PasteString)
; Send("^v")