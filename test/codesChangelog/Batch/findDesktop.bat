REM v0.112a
FOR /F "usebackq delims=" %%i in (`cscript "%systemdrive%\nCommand\vbs\findDesktop.vbs"`) DO SET DESKTOPDIR=%%i
ECHO %desktopdir%
cd %desktopdir%






REM PRE ALPHA CODE
FOR /F "usebackq delims=" %%i in (`cscript "!SYSTEMDRIVE!\CowCMD\vbs\findDesktop.vbs"`) DO SET DESKTOPDIR=%%i
ECHO !DESKTOPDIR!
SETLOCAL
cd !DESKTOPDIR!