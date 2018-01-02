REM v0.120a [IN A NEW BATCH]
SETLOCAL
COPY "%SystemDrive%\nCommand\test\nConsole.bat" "%SystemDrive%\nCommand\"
START "" "%SystemDrive%\nCommand\nConsole.bat"
ENDLOCAL
EXIT 0


REM v0.112a
:Compile
COPY "%SystemDrive%\nCommand\test\nConsole.bat" "%SystemDrive%\nCommand\"
START "" "%SystemDrive%\nCommand\nConsole.bat"
TIMEOUT /t 1 /nobreak > NUL
GOTO QKEXIT
GOTO Compile

REM v0.0020a
COPY "%SystemDrive%\nCommand\test\nConsole.bat" "%SystemDrive%\nCommand\"
START "" "%SystemDrive%\nCommand\nConsole.bat"
GOTO QKEXIT

REM PRE-ALPHA CODES ORIGINAL
Echo
Copy "%SystemDrive%\CowCMD\test\nConsole.bat" "%SystemDrive%\CowCMD\"
start "" "%SystemDrive%\CowCMD\nConsole.bat"
exit