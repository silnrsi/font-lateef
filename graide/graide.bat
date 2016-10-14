set ver=0_8_75

@echo off

@rem get source file if not present
if not exist ..\results mkdir ..\results
if not exist ..\results\LateefGraide.ttf copy ..\source\LateefReg.ttf ..\results\LateefGraide.ttf

if '%1'=='-c' (
graide%ver%_console.exe -p graide.cfg 
) ELSE (
graide%ver%.exe -p graide.cfg 
)