# SAP_AutoIt
A little helper to automate the annoying data-input.
It requires a running and open Chrome-tab with the SAP-tab for "Rückmeldung" of the current project.
Inserts two lines of data automatically. Slow, because SAP reacts slow as well ;)

Planned are features like totally coordinate-independent input (currently just the top-left as reference-point is found by image-search).

The ImageSearch.au3 and dll are downloaded from https://www.autoitscript.com/forum/topic/189338-imagesearchau3-help/
Currently there is the issue that only the compiled x86_64-version is runnable. Interpreting from editor does not work (error 44).

author: mail@marcelpetrick.it
date: 20170801
version 0.1
