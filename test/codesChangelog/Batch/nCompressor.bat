REM v0.123a
:nCompressor
@ECHO OFF
ECHO What is the Buildnumber of this build?
ECHO.
GOTO nCompressor2

:nCompressor2
@ECHO OFF
SET /P BUILDNUMBER=:
ECHO '%BUILDNUMBER%' The file will look like:
GOTO nCompressorC

:nCompressorC
@ECHO OFF
ECHO 'nCommand v%BUILDNUMBER% ALPHA' Do you want to continue?
ECHO [1]Yes 
ECHO [2]Rename 
ECHO [3]Exit
SET /P BNA1=:
IF "%BNA1%" EQU "1" GOTO nCompressor3
IF "%BNA1%" EQU "2" GOTO nCompressor2
IF "%BNA1%" EQU "3" GOTO commands
GOTO nCompressorC

:nCompressor3
@ECHO OFF
ECHO D | XCOPY "%SYSTEMDRIVE%\nCommand" "%TEMP%\nCommand v%BUILDNUMBER% ALPHA\nCommand" /K /E /H /A /Y
MOVE /Y "%TEMP%\nCommand v%BUILDNUMBER% ALPHA" "%SYSTEMDRIVE%\nCommand\build_zip"
ECHO Build moved to "%SYSTEMDRIVE%\nCommand\build_zip".
ECHO WindowsZip "%SYSTEMDRIVE%\nCommand\build_zip\nCommand v%BUILDNUMBER% ALPHA\", "%SYSTEMDRIVE%\nCommand\build_zip\nCommand v%BUILDNUMBER% ALPHA.zip">>"%SYSTEMDRIVE%\nCommand\vbs\winZip.vbs"
CSCRIPT "%SYSTEMDRIVE%\nCommand\vbs\winZip.vbs" //nologo
DEL "%SYSTEMDRIVE%\nCommand\vbs\winZip.vbs"
XCOPY "%SYSTEMDRIVE%\nCommand\vbs\winZip_base\winZip.vbs" "%SYSTEMDRIVE%\nCommand\vbs\"
MOVE /Y "%SYSTEMDRIVE%\nCommand\build_zip\nCommand v%BUILDNUMBER% ALPHA.zip" "%DESKTOPDIR%"
RD /S /Q "%SYSTEMDRIVE%\nCommand\build_zip\nCommand v%BUILDNUMBER% ALPHA"
ECHO File 'nCommand v%BUILDNUMBER% ALPHA.zip' is in '%DESKTOPDIR%'
ECHO.
GOTO Desktop