REM v0.120a
@ECHO OFF
SET VAR=%1
:detctErrorlevel
>NUL 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
IF '%ERRORLEVEL%' NEQ 0 (
SET admError=%ERRORLEVEL%
)
TASDADAKODA NOT A COMMAND 2>NUL
IF '%ERRORLEVEL%' NEQ '0' (
SET typError=%ERRORLEVEL%
)
NET START | FIND "TSTFORERR.EXE" > NUL
IF '%ERRORLEVEL%' NEQ '0' (
SET tsknfErr=%ERRORLEVEL%
)
CLS
:VARIABLE TESTING
IF "%VAR%" EQU "" GOTO entComm
IF DEFINED %VAR% (
CALL %SYSTEMDRIVE%\nCommand\nConsole.bat %VAR%
) ELSE (
GOTO synError
)
:synError
SET varTestc=synErr
CALL %SYSTEMDRIVE%\nCommand\nConsole.bat %varTestc%
GOTO END
:entComm
SET varTestc=entComm
CALL %SYSTEMDRIVE%\nCommand\nConsole.bat %varTestc%
GOTO END
:END
EXIT /B