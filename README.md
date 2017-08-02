# SAP_AutoIt
A little helper to automate the annoying data-input.
It will: open a chrome-instance; go to the url; login; switch inside SAP to the fitting sheet; then check where to insert the two rows of data and do this.
Has a lot of second-long pauses to avoid issues, because ... well ... SAP is slow.

Planned are features like totally coordinate-independent input (currently just the top-left as reference-point is found by image-search).

The ImageSearch.au3 and dll are downloaded from https://www.autoitscript.com/forum/topic/189338-imagesearchau3-help/
Currently there is the issue that only the compiled x86_64-version is runnable. Interpreting from editor does not work (error 44).

author: mail@marcelpetrick.it
date: 20170802
version 0.2
