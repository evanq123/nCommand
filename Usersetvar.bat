@ECHO OFF
TITLE nConsole (c) 2015 Evan Quach
< %systemdrive%\nCommand\def_txt\defCOLORs.SAV (
SET /P savCol=
)
%savCol%
FOR /F "usebackq delims=" %%i in (`cscript "%systemdrive%\nCommand\vbs\findDesktop.vbs"`) DO SET DESKTOPDIR=%%i
CLS
SET CMD=%1
GOTO USEVARSETS
:END
SET CMD=tskComp
CALL %SYSTEMDRIVE%\nCommand\varTesting.bat %CMD%
EXIT /B
GOTO ENDS
:USEVARSETS
REM BEGINS SHORTCUTS VAR.
