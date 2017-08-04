; @author mail@marcelpetrick.it
; @date: 20170804
;
; planned behaviour:
; 0. function callable from outside (==another project)
; 1. function reads content of a textfile
; 2. function returns values as string-array (most likely: 2x3: "item, start, end")

#include <Array.au3>
#include <File.au3>

Func testFunction()
   ConsoleWrite("called FileReader::testfunction" & @CRLF)
EndFunc

Func readFileContent($fileName, ByRef $content)
   ;ConsoleWrite("begin: FileReader::readFileContent" & @CRLF)
   _FileReadToArray($fileName, $content) ; read the whole file-content: easier than expected!
   ;ConsoleWrite("end: FileReader::readFileContent" & @CRLF)
EndFunc
