SETLOCAL
COPY "%SystemDrive%\nCommand\test\nConsole.bat" "%SystemDrive%\nCommand\"
START "" "%SystemDrive%\nCommand\nConsole.bat"
ENDLOCAL
EXIT 0