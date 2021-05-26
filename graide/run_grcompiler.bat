@echo on
setlocal enableextensions enabledelayedexpansion

rem first run grcompiler
call grcompiler %*
if %errorlevel% neq 0 exit /b %errorlevel%

rem clear out parameters until we have just the final two
:findlast
	if "%3" neq "" (
		shift
		goto findlast
	)
rem At this point %1 is the input font to, and %2 is the output from, grcompiler.

rem calculate path to .json file based on the output (%2) file name
set M=%~n2
set M=..\source\graphite\%M:-graide=%-octabox.json

rem and to octalap:
set octalap=C:\Users\bobh\AppData\Local\Programs\Python\Python37\Scripts\octalap

rem since the input file %1 is a temp file, we can re-use it as the input to octalap
cp %2 %1

rem finally run octalap
py -3 %octalap% -m %M% -o %2 %1

