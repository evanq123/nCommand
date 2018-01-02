REM v0.124a
:UserInputVarShortcuts
@ECHO OFF
ECHO You are now creating a command for a shortcut
ECHO If this is a Game, type [1]
ECHO If this is a Software, type [2]
ECHO.
GOTO VariableName

:Variablename
SET /P SOFTGAME=:
IF /I "%SOFTGAME%" EQU "1" GOTO GAMEC
IF /I "%SOFTGAME%" EQU "2" GOTO SOFTWAREC
ECHO Invalid answer.
GOTO Variablename

:GAMEC
ECHO Please type in the Program Name.
SET /P PROGRAM_NAME=:
ECHO.
ECHO Please set the command
ECHO that you want to use to call to the
ECHO program.
SET /P VARIABLE_NAME=:
ECHO.
ECHO Shortcut should be located in '%DESKTOPDIR%\Game Shortcuts'
ECHO What is the Game shortcut's name?
ECHO Without the '.lnk' [W/O EXTENSION]?
ECHO Example: 'shortcutname'
ECHO not 'shortcutname.ext'
ECHO.
SET /P SHORTCUT_NAME=:
ECHO Is this correct?
ECHO Program name: %PROGRAM_NAME% , Variable name: %VARIABLE_NAME%,
ECHO This is a Game shorcut called: %SHORTCUT_NAME%
ECHO And is located under: %DESKTOPDIR%\Game Shortcuts
ECHO.
GOTO ansGamescCall

:ansGamescCall
ECHO [Yes/No]?
SET /P ansGamsc=:
IF /I "%ansGamsc%" EQU "YES" GOTO GAMSCON
IF /I "%ansGamsc%" EQU "NO" GOTO ResetUserVar
ECHO Invalid answer.
GOTO ansGamscCall

:GAMSCON
SET "CMD=CMD"
ECHO IF /I "%%CMD%%" EQU "%%VARIABLE_NAME%%" (>>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO ECHO Starting %PROGRAM_NAME% >>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO PAUSE>>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO START "" "%DESKTOPDIR%\Game Shortcuts\%SHORTCUT_NAME%">>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO ECHO.>>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO GOTO END>>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO )>>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO Shortcut added.
ECHO.
GOTO commands

:SOFTWAREC
ECHO Please type in the Program Name.
SET /P PROGRAM_NAME=:
ECHO.
ECHO Please set the command
ECHO that you want to use to call to the
ECHO program.
SET /P VARIABLE_NAME=:
ECHO.
ECHO Shortcute should be located in:
ECHO '%DESKTOPDIR%\Software\[SUBFOLDER]'
ECHO What is the Software shortcut's name
ECHO Without the '.lnk' [W/O EXTENSION]?
ECHO Example: 'shortcutname'
ECHO not 'shortcutname.ext'
SET /P SHORTCUT_NAME=:
ECHO In '%DESKTOPDIR%\Software\' What [SUBFOLDER] is the shortcut in?
SET /P SOFTWARE_FOLD=:
ECHO Is this correct?
ECHO Program name: %PROGRAM_NAME% , Variable name: %VARIABLE_NAME%,
ECHO This is a Software shorcut called: %SHORTCUT_NAME%
ECHO And is located under: %DESKTOPDIR%\Software\%Software_fold%
ECHO.
GOTO ansSoftcCall

:ansSoftcCall
ECHO [Yes/No]?
SET /P ansSoftc=:
IF /I "%ansSoftc%" EQU "YES" GOTO Softcon
IF /I "%ansSoftc%" EQU "NO" GOTO ResetUserVar
ECHO Invalid answer.
GOTO ansSoftcCall

:Softcon
SET "CMD=CMD"
ECHO IF /I "%%CMD%%" EQU "%%VARIABLE_NAME%%" (>>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO ECHO Starting %PROGRAM_NAME% >>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO PAUSE>>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO START "" "%DESKTOPDIR%\Software\%SOFTWARE_FOLD%\%SHORTCUT_NAME%">>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO ECHO.>>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO GOTO END>>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO )>>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO Shortcut added.
ECHO.
GOTO commands

:ResetUserVar
ECHO Would you like to try to set another variable?
ECHO Saying [NO] would take you back to nConsole commands.
ECHO [YES/NO]
SET /P ansRestVar=:
IF /I "%ansRestVar%" EQU "YES" GOTO UserInputVarShortcuts
IF /I "%ansRestVar%" EQU "NO" GOTO Commands
ECHO Invalid answer.
GOTO ResetUserVar
ECHO.
GOTO commands