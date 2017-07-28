#AutoIt3Wrapper_UseX64 = Y
#include <ImageSearch.au3>

HotKeySet("p", "checkForImage")

global $y = 0, $x = 0

Func checkForImage()
   Local $search = _ImageSearch('checkImage.bmp', 0, $x, $y, 0)
   If $search = 1 Then
	  MouseMove($x, $y, 10)
   EndIf

   ConsoleWrite($x & ":" & $y & @CRLF)
EndFunc

while 1
   sleep(200)
WEnd
