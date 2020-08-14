set ver=0_8_80

@echo off

@rem get source file if not present
if not exist ..\results\generated\Lateef-Regular.xml (
	echo "file ..\results\generated\Lateef-Regular.xml is missing ... please build font first."
) else (
	if not exist ..\results\Lateef-Regular-graide.ttf psfufo2ttf ..\source\masters\Lateef-Regular.ufo ..\results\Lateef-Regular-graide.ttf
	py -3 C:\SRC\GitHub\graide\graide -p Lateef-Regular.cfg
	@rem graide%ver%_console.exe -p Lateef-Regular.cfg 
)