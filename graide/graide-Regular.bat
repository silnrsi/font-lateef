@echo off
rem Batch file to run graide on Lateef-Regular

rem Configuration

rem Whether to run graide from an exe or from the source clone:
rem set useSource=yes
set useSource=no

rem if useSource is not "yes", then the following two values are used to construct 
rem name of graide executable using the expression "graide%ver%%suffix%.exe"

rem ver = version info for use in finding the correct version of graide.exe:
set ver=1_0_0
rem set ver=

rem suffix = _console if there is a special console variant of graide.exe; else nothing:
rem set suffix=_console
set suffix=

rem Which graphite2.dll to use. If not the system default, then:
rem    The .exe needs 32 bit
rem    Running graide from source needs 64 bit (assuming python 64 is installed)
if "%useSource%" == "yes" (
	set PYGRAPHITE2_LIBRARY_PATH=C:\DosUtils\graphite2.dll\2021-05-20-graphite2-64-prod.dll
) else (
	set PYGRAPHITE2_LIBRARY_PATH=C:\DosUtils\graphite2.dll\2021-05-20-graphite2-32-prod.dll
)
rem alternatively you can use the system default:
set PYGRAPHITE2_LIBRARY_PATH=

rem done with configuration

rem test whether build was done:
if not exist ..\results\generated\Lateef-Regular.xml (
	echo "file ..\results\generated\Lateef-Regular.xml is missing ... please build font first."
) else (
    rem build was done... now create the TTF we'll use:
	if not exist ..\results\Lateef-Regular-graide.ttf psfufo2ttf ..\results\source\instances\Lateef-Regular.ufo ..\results\Lateef-Regular-graide.ttf
	
	rem Run graide either from source or from an exe:
	if "%useSource%" == "yes" (
		echo running Graide from source ...
		py -3 C:\SRC\GitHub\graide\graide -p Lateef-Regular.cfg
	) else (
		echo running graide%ver%%suffix%.exe ...
		graide%ver%%suffix%.exe -p Lateef-Regular.cfg 
	)
)
