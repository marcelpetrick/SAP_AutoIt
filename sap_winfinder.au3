; includes
#include <Date.au3>
;#include <MsgBoxConstants.au3> ; todo remove this
#include <ImageSearch.au3>

; global constants
Global Const $sleepingTime = 200;
Global Const $logFunctionCall = True ;False True; determines if the entry of a function is logged to StdErr

; assign the hotkeys
HotKeySet("+y", "Example") ; go go go
HotKeySet("{F5}", "quitScript") ; stop, come back home!

; functions
Func Example()
    ; Wait 10 seconds for the Notepad window to appear.
	WinWait("Projektrückmeldung - ABLE GROUP - Google Chrome", "", 10)

    ; Retrieve the handle of the Notepad window using the classname of Notepad.
    Local $hWnd = WinGetHandle("Projektrückmeldung - ABLE GROUP - Google Chrome")
    If @error Then
        ;MsgBox($MB_SYSTEMMODAL, "", "An error occurred when trying to retrieve the window handle of Notepad.")
		logCall("error occured - no window with title &xyz found")
        Exit
    EndIf

    ; Display the handle of the Notepad window.
	logCall("handle of the window is: " & $hWnd)

	checkForImage()
	logCall("end of Example-function!")

 EndFunc   ;==>Example


; taken from https://www.autoitscript.com/forum/topic/148005-imagesearch-usage-explanation/
Func checkForImage()
   logCall("entered: checkForImage()")
   Local $y = 0, $x = 0
   Local $search = _ImageSearchArea('taeglich.png', 1, 100, 100, 900, 900, $x, $y, 0)
   logCall("after search")

   If ($search = 1) Then
	 ; logCall("found something ..")
	  MouseMove($x, $y, 10)
;	  logCall("found position: " & $x & "/" & $y)
   EndIf

EndFunc

; body: scripts sleeps before triggering the real functionality
 While 1
   Sleep($sleepingTime)
WEnd

; brief: write current string to StdErr if globally enabled
Func logCall(ByRef Const $string)
   If ($logFunctionCall) Then
	  ConsoleWrite(_NowTime(5) & ":" & $string & @CRLF)
   EndIf
EndFunc

; brief: interupts and exits script
Func quitScript()
   logCall("quitScript()")
   Exit
EndFunc
