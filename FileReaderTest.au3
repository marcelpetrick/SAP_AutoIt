; @author mail@marcelpetrick.it
; @date: 20170804
;
; test-framework for FileReader.au3

#include <FileReader.au3>

;testFunction() ; just to see how this works

Local $fileContent ; make this a 2x3 array ... or similar, if they are dynamic
Local Const $fileName = "inputData.txt" ; keeps the dynamic content: can be used to adjust without the need for recompilation of the script

readFileContent($fileName, $fileContent) ; contains all strings as array

; TODO add a check if the returnvalue has more than two entries
ConsoleWrite("UBound($fileContent): amount of strings = " & UBound($fileContent) & @CRLF) ; returns 4: four three lines and an empty one

For $i = 1 to UBound($fileContent) - 1
   ;ConsoleWrite("content:" & $fileContent[$i] & @CRLF)
   ; split each string at the delimiter ";"
   Local $splittedString = StringSplit($fileContent[$i], ";") ; TODO check before if each string contains also ;!!!
   ; TODO check if result is exactly three items big
   ; the first element has the number of returned strings! so $splittedString[0] == 0?
   ConsoleWrite("output:" & " // " & $splittedString[1] & " // " & $splittedString[2] & " // " & $splittedString[3] & @CRLF)
Next

; plan: put this into a function, which then can be used to call it externally: returnValue shall be a [n][3]-array
; TODO