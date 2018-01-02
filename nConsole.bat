REM Description: nConsole is an improved version of Windows Command Prompt, with quick shortcuts,
REM ability to open programs with a phrase,
REM includes custom made tools,
REM and an overall cleaner aesthetic making this GUI more user friendly
REM than the default Windows Command Prompt.

REM File Directories:
REM Default Game short cuts are in '%SYSTEMDRIVE%\DOCUME~1\%USERNAME%\Desktop\Game Shortcuts'
REM Default file location is under '%SYSTEMDRIVE%\nCommand'
REM The Software Shortcuts are in '%SYSTEMDRIVE%\DOCUME~1\%USERNAME%\Desktop\Software' with sub-folders 
REM in the directory: "Games" "Media" "PC" "Social"

REM Tips:
REM I recommended downloading "NOTEPAD++", or you may manually change all "NOTEPAD++" commands to "NOTEPAD" 
REM in the source code.
REM You can type 'GET NOTEPAD++' as a command for nConsole to download "NOTEPAD++"
REM Or type 'DOWN PREREQ' to get all prerequisites.
REM Under '%SYSTEMDRIVE%\nCommand\test' there is a copy of this batch for compiling. You can type 'EDIT' in 
REM nConsole to open up the source codes
REM and type 'COMPILE' to quickly edit and apply changes to nConsole.
REM Type 'EDITL' to open up nConsole's folder.
REM Near the bottom of the code, there is a code checker. Follow listed instructions in the code to 
REM test it out. Then 'COMPILE' and type in 'CODE' to test and check for ERRORLEVELS.
REM Typing 'DEBUG' can also open up a debugger, but there may be a lot of false positives.
REM You can type 'nComp' to compress the nConsole directory to create a new build.

REM Features:
REM Easy colour changing w/ default saves
REM Compiler tool
REM Source code accessibility
REM Battlefield 4 loading speed fixer
REM File type association fixer
REM Code tester and advance ERRORLEVEL checker
REM Debugging tool (for nConsole ALPHA debugging only)
REM User Action Control switch [ON/OFF]
REM Easy AdminConsole accessibility
REM Notepad++ download and other prerequisites
REM Shortcut Launcher
REM Redesigned default Command Prompt commands
REM Quick CD [Change Directory] shortcuts
REM Quick nConsole build.

REM This program was created by (c)Evan Quach.

@ECHO OFF
IF NOT "%OS%" EQU "Windows_NT" GOTO DontRun
VER | FIND "Windows NT" >NUL && GOTO DontRun
VER | FIND "Windows 2000" >NUL && GOTO DontRun

:startup
SETLOCAL
@ECHO OFF
TITLE nConsole (c) 2015 Evan Quach
< %systemdrive%\nCommand\def_txt\defCOLORs.SAV (
SET /P savCol=
)
%savCol%
FOR /F "usebackq delims=" %%i in (`cscript "%systemdrive%\nCommand\vbs\findDesktop.vbs"`) DO SET DESKTOPDIR=%%i
CD %DESKTOPDIR%
CLS
GOTO DetctErrorlevel

:Compile
START "" "%SYSTEMDRIVE%\nCommand\test\compile.bat"
GOTO QKEXIT

:detctErrorlevel
>NUL 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
IF '%ERRORLEVEL%' NEQ '0' (
SET admError=%ERRORLEVEL%
)
INVALID COMMAND NOT A COMMAND >NUL
IF '%ERRORLEVEL%' NEQ '0' (
SET typError=%ERRORLEVEL%
)
NET START | FIND "TSTFORERR.EXE" > NUL
IF '%ERRORLEVEL%' NEQ '0' (
SET tsknfErr=%ERRORLEVEL%
)
CLS

:VARIABLERETURN
@ECHO OFF
IF "%1" EQU "" ( 
GOTO INTRO 
)
IF "%1" EQU "commands" ( 
GOTO COMMANDS 
)
IF "%1" EQU "synErr" ( 
ECHO Command not found, please recheck spelling && GOTO commands 
)
IF "%1" EQU "entComm" ( 
ECHO Please enter a command && GOTO COMMANDS 
)
IF "%1" EQU "accComm" (
GOTO commands 
) ELSE (
ECHO Command: "%1"
ECHO Executing...
ECHO.
%1
GOTO commands
)

:Intro
@ECHO OFF
ECHO Enter a Command, type "hcommands" for list of custom commands.
ECHO.
ECHO Type help to see list of common commands like cd, rd, md, del,
ECHO ren, replace, copy, xcopy, move, attrib, tree, edit, and cls.
ECHO Type [command]/? for detailed info.
ECHO.
ECHO Type "admin" to gain Adminstrator Privalages for this CMD.
GOTO Commands

:cmd
SETLOCAL
REM @ECHO ON
ECHO Directory: "%CD%" [Press h for help]
ECHO.
SET "CMD="
SET /p CMD=Command:

REM  "COLOR Changers"
IF /I "%CMD%" EQU "red" GOTO red
IF /I "%CMD%" EQU "green" GOTO green
IF /I "%CMD%" EQU "white" GOTO white
IF /I "%CMD%" EQU "black" GOTO black
IF /I "%CMD%" EQU "yellow" GOTO yellow
IF /I "%CMD%" EQU "original" GOTO original
IF /I "%CMD%" EQU "blue" GOTO blue
IF /I "%CMD%" EQU "purple" GOTO purple
IF /I "%CMD%" EQU "colors" GOTO custom COLORs
IF /I "%CMD%" EQU "color" GOTO custom COLORs
IF /I "%CMD%" EQU "change colors" GOTO custom COLORs
IF /I "%CMD%" EQU "savCol" GOTO saveCOLORs
IF /I "%CMD%" EQU "save colors" GOTO saveCOLORs
IF /I "%CMD%" EQU "save my colors" GOTO saveCOLORs

REM  "Tools"
IF /I "%CMD%" EQU "compile" GOTO compile
IF /I "%CMD%" EQU "edit" GOTO edit
IF /I "%CMD%" EQU "editl" GOTO editlocation
IF /I "%CMD%" EQU "bf4 cas" GOTO BF4 cas
IF /I "%CMD%" EQU "ext" GOTO file type association
IF /I "%CMD%" EQU "code" GOTO code test
IF /I "%CMD%" EQU "uac" GOTO uac
IF /I "%CMD%" EQU "download notepad++" GOTO downNotepp
IF /I "%CMD%" EQU "notepad++ download" GOTO downNotepp
IF /I "%CMD%" EQU "get notepad++" GOTO downNotepp
IF /I "%CMD%" EQU "download notepad" GOTO downNotepp
IF /I "%CMD%" EQU "notepad download" GOTO downNotepp
IF /I "%CMD%" EQU "get notepad" GOTO downNotepp
IF /I "%CMD%" EQU "debug" GOTO debug
IF /I "%CMD%" EQU "download prerequisites" GOTO prereqDowns
IF /I "%CMD%" EQU "prereq" GOTO prereqDowns
IF /I "%CMD%" EQU "prerequisites" GOTO prereqDowns
IF /I "%CMD%" EQU "down prereq" GOTO prereqDowns
IF /I "%CMD%" EQU "down prerequisites" GOTO prereqDowns
IF /I "%CMD%" EQU "prereqs" GOTO prereqDowns
IF /I "%CMD%" EQU "nComp" GOTO nCompressor
IF /I "%CMD%" EQU "nCompress" GOTO nCompressor
IF /I "%CMD%" EQU "nCompressor" GOTO nCompressor
IF /I "%CMD%" EQU "build" GOTO nCompressor
IF /I "%CMD%" EQU "add shortcut" GOTO UserInputVarShortcuts
IF /I "%CMD%" EQU "custom shortcut" GOTO UserInputVarShortcuts
IF /I "%CMD%" EQU "add shortcuts" GOTO UserInputVarShortcuts
IF /I "%CMD%" EQU "custom shortcuts" GOTO UserInputVarShortcuts
IF /I "%CMD%" EQU "shortcut" GOTO UserInputVarShortcuts
IF /I "%CMD%" EQU "shortcuts" GOTO UserInputVarShortcuts
IF /I "%CMD%" EQU "create shortcuts" GOTO UserInputVarShortcuts
IF /I "%CMD%" EQU "create shortcut" GOTO UserInputVarShortcuts
IF /I "%CMD%" EQU "addlnk" GOTO UserInputVarShortcuts

REM  "cd/open"
IF /I "%CMD%" EQU "sys32" GOTO sys32
IF /I "%CMD%" EQU "system32" GOTO sys32
IF /I "%CMD%" EQU "windows" GOTO sys32
IF /I "%CMD%" EQU "home" GOTO home
IF /I "%CMD%" EQU "user" GOTO home
IF /I "%CMD%" EQU "desktop" GOTO desktop
IF /I "%CMD%" EQU "appdata" GOTO appdata
IF /I "%CMD%" EQU "cdrive" GOTO cdrive

REM  "Commands"
IF /I "%CMD%" EQU "xx" GOTO bomb
IF /I "%CMD%" EQU "tasks" GOTO tasks
IF /I "%CMD%" EQU "help" GOTO help
IF /I "%CMD%" EQU "h" GOTO Intro
IF /I "%CMD%" EQU "admin" GOTO Admin
IF /I "%CMD%" EQU "r" GOTO CLS
IF /I "%CMD%" EQU "clear" GOTO CLS
IF /I "%CMD%" EQU "CLS" GOTO CLS
IF /I "%CMD%" EQU "exit" GOTO exit
IF /I "%CMD%" EQU "clean" GOTO disk cleanup
IF /I "%CMD%" EQU "cleanmgr" GOTO disk cleanup
IF /I "%CMD%" EQU "disk cleanup" GOTO disk cleanup
IF /I "%CMD%" EQU "cmd" GOTO copyrights
IF /I "%CMD%" EQU "restart" GOTO restscript
IF /I "%CMD%" EQU "unreg" GOTO UnregCMD

:shortcutVars
CALL %SYSTEMDRIVE%\nCommand\var.bat %CMD%
GOTO commands

:UnregCMD
CLS
ECHO Entering unregulated Command Prompt.
ECHO You can enter normal CMD commands here,
ECHO Other commands will not work.
ECHO Can possibly break batch and enter default command prompt.
ECHO If you want to exit, press "G" now.
SET /p CMD=Command:
IF /I "%CMD%" EQU "g" (
CLS
ECHO Returning to nCommand...
GOTO COMMANDS
)
START "" "%SYSTEMDRIVE%\nCommand\test\unRegcommand.bat"
GOTO QKEXIT

:copyrights
@ECHO OFF
ECHO.
ECHO nConsole[Version 0.124 ALPHA] 
ECHO Redesigned by (c) 2015 Evan Quach for
ECHO Microsoft Windows Command Prompt
ECHO (c) 2013 Microsoft Corporation. All rights reserved.
ECHO.
GOTO commands

REM  Syntax
REM  COLOR [background][foreground]

:Custom colors
@ECHO OFF
ECHO.
ECHO 0 = Black 
ECHO 8 = Gray 
ECHO 1 = Blue 
ECHO 9 = Light Blue 
ECHO 2 = Green 
ECHO A = Light Green 
ECHO 3 = Aqua 
ECHO B = Light Aqua 
ECHO 4 = Red 
ECHO C = Light Red 
ECHO 5 = Purple 
ECHO D = Light Purple 
ECHO 6 = Yellow 
ECHO E = Light Yellow 
ECHO 7 = White 
ECHO F = Bright White 
ECHO.
GOTO background

	:background
	@ECHO OFF
	ECHO Pick a background color.
	SET /p back=background:
	COLOR %back%%fore%
	ECHO Pick the word color.
	SET /p fore=foreground:
	ECHO Changing color...
	COLOR %back%%fore%
	ECHO Color Changed.
	ECHO.
	GOTO defcol
	
:defcol
ECHO Would you like to save as default colors? [y/n]
ECHO "n" returns you to CMD
ECHO If you want to revert back to default colors, type "revert".
ECHO.
SET /p defcol=:
IF /I "%defcol%" EQU "y" GOTO savecolors
IF /I "%defcol%" EQU "n" GOTO commands
IF /I "%defcol%" EQU "revert" GOTO revertcolors
ECHO.
GOTO defcol

	:savecolors
	(
	ECHO COLOR %back%%fore%
	) > "%systemdrive%\nCommand\def_txt\defCOLORs.SAV"
	ECHO Save Completed.
	ECHO.
	GOTO commands
	
	:revertcolors
	@ECHO OFF
	ECHO Reverting colors...
	< %systemdrive%\nCommand\def_txt\defCOLORs.SAV (
	SET /P savCol=
	)
	ECHO %savCol% >NUL
	%savCol% >NUL
	ECHO Colors changed back to default.
	GOTO commands
	
:purple
COLOR 05
SET back=0
SET fore=5
ECHO Colors Changed.
GOTO defcol

:blue
COLOR 03
SET back=0
SET fore=3
ECHO Colors Changed.
GOTO defcol

:original
COLOR 1F
SET back=1
SET fore=F
ECHO Colors Changed.
GOTO defcol

:Yellow
COLOR 0e
SET back=0
SET fore=e
ECHO Colors Changed.
GOTO defcol

:white
COLOR 0f
SET back=0
SET fore=f
ECHO Colors Changed.
GOTO defcol

:black
COLOR 70
SET back=7
SET fore=0
ECHO Colors Changed.
GOTO defcol

:red
COLOR 0c
SET back=0
SET fore=c
ECHO Colors Changed.
GOTO defcol

:green
COLOR 0a
SET back=0
SET fore=a
ECHO Colors Changed.
GOTO defcol

REM  "cd/open files folders"
:appdata
EXPLORER %APPDATA%
GOTO commands

:home
CD /d %USERPROFILE%
GOTO commands

:desktop
CD /d %DESKTOPDIR%
GOTO commands

:Sys32
CD /d %systemdrive%\Windows\system32
GOTO commands

:cdrive
CD /d %systemdrive%\
GOTO commands

REM  "Secret Folder"
:Bomb
ECHO.
ECHO You will need 3 passwords
ECHO Type in the first password
SET /p pass1=:
IF "%pass1%" EQU "1220115" GOTO Lock
GOTO retry

:Lock
ECHO.
ECHO Type in second password:
SET /p pass2=:
IF "%pass2%" EQU "miumiu123" GOTO Initializing
GOTO Retry

:Initializing
ECHO.
ECHO Type in last password
SET /p pass3=:
IF "%pass3%" EQU "evanq123" GOTO open secrets
GOTO Retry

:open secrets
ECHO.
EXPLORER I:\eBooks\Calibre Library\Jerkin McCain
ECHO Success.
GOTO commands

:retry
CLS
ECHO Retry? [yes/no]
SET /p ret=:
IF /I "%ret%" EQU "yes" GOTO bomb
IF /I "%ret%" EQU "no" GOTO commands
GOTO retry

REM  "Commands"
:tasks
TASKLIST
ECHO ---End of tasks lists---
GOTO commands

:CLS
CLS
ECHO Text Cleared.
GOTO cmd

:help
help
GOTO commands

:Disk Cleanup
ECHO Starting Disk Cleanup...
CLEANMGR & GOTO commands 
GOTO commands

:commands
REM PLACE VAR
@ECHO OFF
SET "noteopen="
SET "pass1="
SET "pass2="
SET "pass3="
SET "ret="
SET "cmd="
SET "ans1="
SET "anuac="
SET "bf4ca="
SET "ansbf4="
SET "ansdb4="
SET "flaD="
SET "admcont="
SET "exan="
SET "BUILDNUMBER="
SET "BNA1="
SET "SOFTGAME="
SET "PROGRAM_NAME="
SET "VARIABLE_NAME="
SET "SHORTCUT_NAME="
SET "ansGamsc="
SET "Software_fold="
SET "ansSoftc="
SET "ansRestVar="
SET "varTestc="
SET "var="
SET "skysel="
ECHO.
ECHO [Press r to clear]
GOTO cmd

REM  "Tools"
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
ECHO IF /I "%%CMD%%" EQU "%VARIABLE_NAME%" (>>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO 	ECHO Starting %PROGRAM_NAME% >>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO 	PAUSE>>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO 	START "" "%DESKTOPDIR%\Game Shortcuts\%SHORTCUT_NAME%.lnk">>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO 	ECHO.>>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO 	GOTO END>>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
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
ECHO IF /I "%%CMD%%" EQU "%VARIABLE_NAME%" (>>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO 	ECHO Starting %PROGRAM_NAME% >>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO 	PAUSE>>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO 	START "" "%DESKTOPDIR%\Software\%SOFTWARE_FOLD%\%SHORTCUT_NAME%.lnk">>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO 	ECHO.>>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
ECHO 	GOTO END>>"%SYSTEMDRIVE%\nCommand\userSetvar.bat"
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

:edit
ECHO Opening source code...
START notepad++ "%systemdrive%\nCommand\Test\nConsole.bat"
START notepad++ "%systemdrive%\nCommand\Test\testing codes.bat"
START notepad++ "%systemdrive%\nCommand\Test\testing codes.txt"
START notepad++ "%systemdrive%\nCommand\var.bat"
START notepad++ "%systemdrive%\nCommand\varTesting.bat"
START notepad++ "%systemdrive%\nCommand\Variables.txt"
START notepad++ "%systemdrive%\nCommand\Changelog.txt"
START notepad++ "%systemdrive%\nCommand\Description.txt"
GOTO commands

:editlocation
ECHO Opening location of files
EXPLORER "%systemdrive%\nCommand"
GOTO commands

:file type association
ECHO Open .REG folder and instructions? [RECOMMENDED] [y/n]
SET /p regans=:
IF /I '%REGANS%' EQU 'Y' (
ECHO Opening folder location...
EXPLORER "%systemdrive%\nCommand\REGWin8\"
ECHO Opening Read Me.txt...
START notepad++ "%systemdrive%\nCommand\REGWin8\Read me.txt"
)
IF /I '%REGANS%' EQU 'N' (
GOTO FTA2
)

:fta2
ECHO Run Diagnostics? [REQUIRES ADMIN] [y/n]
ECHO or type 'admin' to restart into Administrator Console.
SET /p ans1=:
IF /I "%ans1%" EQU "y" GOTO fix
IF /I "%ans1%" EQU "n" GOTO commands
IF /I "%ans1%" EQU "admin" GOTO admin
ECHO.
GOTO fta2

	:fix
	@ECHO OFF
	ECHO repairing .EXE and .REG files...
	ASSOC .EXE=exefile
	IF '%ERRORLEVEL%' NEQ '0' GOTO undefErr
	ASSOC .REG=regfile
	IF '%ERRORLEVEL%' NEQ '0' GOTO undefErr
	ECHO Gathering current file associations...
	CD /d "%DESKTOPDIR%"
	ASSOC .txt
	ASSOC .doc
	ASSOC > "fileAssoc.txt"
	ATTRIB +r "%DESKTOPDIR%\fileAssoc.txt"
	ECHO Text added to desktop.
	ECHO Opening .txt doc in Notepad++...
	START notepad++ "%DESKTOPDIR%\fileAssoc.txt"
	@ECHO OFF
	FOR /F "usebackq delims=" %%d in (`cscript "%systemdrive%\nCommand\vbs\fileConf.vbs"`) DO SET VBSCONFDEL=%%d
	TIMEOUT /t 1 /nobreak > NUL
	IF "%VBSCONFDEL%" EQU "xDel" (
	ATTRIB -r "%DESKTOPDIR%\fileAssoc.txt"
	DEL "%DESKTOPDIR%\fileAssoc.txt"
	ECHO File Deleted.
	GOTO Commands
	) ELSE (
	ECHO Text saved in '%DESKTOPDIR%'
	GOTO commands
	)
	
:UAC
@ECHO OFF
ECHO.
ECHO CHANGING USER ACCOUNT CONTROL REQUIRES ADMINISTRATOR PRIVALEGES
ECHO THIS WILL CHANGE REGISTRY FILES; USE AT YOUR OWN RISKS
ECHO.
ECHO Enter [1] to turn OFF UAC
ECHO Enter [2] to turn ON UAC
ECHO Enter [3] to Return
SET /p anuac=:
IF "%anuac%" EQU "1" GOTO UACOFF
IF "%anuac%" EQU "2" GOTO UACon
IF "%anuac%" EQU "3" GOTO commands
GOTO UAC

	:UACOFF
	"%windir%\System32\reg.exe" ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
	IF '%ERRORLEVEL%' NEQ '0' GOTO undefErr
	GOTO UACend

	:UACon
	"%windir%\System32\reg.exe" ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f
	IF '%ERRORLEVEL%' NEQ '0' GOTO undefErr
	GOTO UACend
	
	:UACend
	@ECHO OFF
	ECHO Changes will become effective on reboot.
	ECHO.
	cscript "%systemdrive%\nCommand\vbs\compRestart.vbs" //Nologo
	GOTO commands

:Admin
>NUL 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
IF '%ERRORLEVEL%' NEQ '0' (
    ECHO Requesting administrative privileges...
    GOTO UACPrompt
) ELSE ( GOTO gotAdmin )

	:UACPrompt
	@ECHO OFF
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%temp%\getAdmin.vbs"
    SET PARAMS = %*:"=""
    ECHO UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getAdmin.vbs"
    "%temp%\getAdmin.vbs"
    DEL "%temp%\getAdmin.vbs"
	FOR /F %%G IN ('Tasklist /FI "IMAGENAME eq cmd.exe" 2^>NUL ^| FIND /I /c "cmd.exe"') DO IF %%G LEQ 2 (
	ECHO AdminConsole not activated. 
	GOTO commands
	) ELSE (
	ECHO LAUNCHING ADMIN CONSOLE
	GOTO QKEXIT )
	
	:gotAdmin
	@ECHO OFF 
	ECHO You are already in AdminConsole.
	GOTO commands
	
:BF4 Cas
@ECHO OFF
ECHO Run BF4 Loading Speed fix? [REQUIRES ADMIN] [y/n]
ECHO or type admin to restart into Administrator Console.
SET /p bf4ca=:
IF /I "%bf4ca%" EQU "y" GOTO bf4contcas
IF /I "%bf4ca%" EQU "n" GOTO commands
IF /I "%bf4ca%" EQU "admin" GOTO admin
ECHO.
GOTO BF4 Cas

	:bf4contcas
	@ECHO OFF
	ECHO 
	ECHO Running Battlefield 4 .CAS compiler...
	ECHO You are about to make a system link between your flashdrive and game folder
	ECHO Detecting Admin Console...
	>NUL 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
	IF '%ERRORLEVEL%' NEQ '0' GOTO undefErr
	ECHO.
	PAUSE
	ECHO.
	ECHO 1st: move all ".cas" files for BF4 into your flash drive.
	ECHO DO NOT CREATE A NEW FOLDER, COPY .CAS FILES DIRECTLY ONTO YOUR FLASH DRIVE.
	ECHO it is located in your game file inside 
	ECHO [Look for the game directory on origin]"/Battlefield 4/Data"
	ECHO if there are more than 21 .cas files, then this tool is outdated. 
	ECHO if you can read the program. You can just add a command for cas_22.cas etc. 
	ECHO.
	PAUSE
	ECHO.
	ECHO 2nd: backup the ".cas" files to a different folder 
	ECHO NOT in the "\Battlefield 4\Data" folder.
	ECHO or create a folder called BF4 CAS FILES inside your 
	ECHO "\Battlefield 4\Data" folder.
	ECHO and move the ".cas" files in there.
	ECHO.
	PAUSE
	ECHO.
	CLS
	ECHO 3rd: If your battlefield .cas were not located under 
	ECHO "%systemdrive%:\Game files\battlefield 4"
	ECHO enter your directory here as "%systemdrive%\...\...\Battlefield 4\Data" 
	ECHO replace the "..." with your directory.
	ECHO if they are, press [1]
	ECHO.
	ECHO Enter directory here: the first part is: %systemdrive%/ 
	ECHO OR if it IS under "%systemdrive%\Game files\battlefield 4\Data", press [1]
	SET /p answDBF=:
	IF "%answDBF%" EQU "1" SET answDBF="%systemdrive%/Game Files/battlefield 4/Data"
	PAUSE
	ECHO 4th: Check your flash drive letter; the one with your cas file; [Drive]:\
	ECHO if it is not "H:\" press [1] if it "H" is you may press enter.
	ECHO to START the fix.
	SET /p ansBF=:
	IF "%ansBF%" EQU "1" GOTO flashLetter
	ECHO.
	ECHO IS 
	ECHO Your Directory is:%answDBF%
	CD /d "%answDBF%"
	MKLINK cas_01.cas H:\cas_01.cas
	MKLINK cas_02.cas H:\cas_02.cas
	MKLINK cas_03.cas H:\cas_03.cas
	MKLINK cas_04.cas H:\cas_04.cas
	MKLINK cas_05.cas H:\cas_05.cas
	MKLINK cas_06.cas H:\cas_06.cas
	MKLINK cas_07.cas H:\cas_07.cas
	MKLINK cas_08.cas H:\cas_08.cas
	MKLINK cas_09.cas H:\cas_09.cas
	MKLINK cas_10.cas H:\cas_10.cas
	MKLINK cas_11.cas H:\cas_11.cas
	MKLINK cas_12.cas H:\cas_12.cas
	MKLINK cas_13.cas H:\cas_13.cas
	MKLINK cas_14.cas H:\cas_14.cas
	MKLINK cas_15.cas H:\cas_15.cas
	MKLINK cas_16.cas H:\cas_16.cas
	MKLINK cas_17.cas H:\cas_17.cas
	MKLINK cas_18.cas H:\cas_18.cas
	MKLINK cas_19.cas H:\cas_19.cas
	MKLINK cas_20.cas H:\cas_20.cas
	MKLINK cas_21.cas H:\cas_21.cas
	@ECHO OFF
	ECHO MSLINK Complete.
	PAUSE
	GOTO commands
	
	:flashLetter
	@ECHO OFF
	ECHO Type your flashdrive letter here
	ECHO without the ":\" for example- F
	SET /p flaD=:
	ECHO Your Directory is:%answDBF%
	CD /d "%answDBF%"
	MKLINK cas_01.cas %flaD%:\cas_01.cas
	MKLINK cas_02.cas %flaD%:\cas_02.cas
	MKLINK cas_03.cas %flaD%:\cas_03.cas
	MKLINK cas_04.cas %flaD%:\cas_04.cas
	MKLINK cas_05.cas %flaD%:\cas_05.cas
	MKLINK cas_06.cas %flaD%:\cas_06.cas
	MKLINK cas_07.cas %flaD%:\cas_07.cas
	MKLINK cas_08.cas %flaD%:\cas_08.cas
	MKLINK cas_09.cas %flaD%:\cas_09.cas
	MKLINK cas_10.cas %flaD%:\cas_10.cas
	MKLINK cas_11.cas %flaD%:\cas_11.cas
	MKLINK cas_12.cas %flaD%:\cas_12.cas
	MKLINK cas_13.cas %flaD%:\cas_13.cas
	MKLINK cas_14.cas %flaD%:\cas_14.cas
	MKLINK cas_15.cas %flaD%:\cas_15.cas
	MKLINK cas_16.cas %flaD%:\cas_16.cas
	MKLINK cas_17.cas %flaD%:\cas_17.cas
	MKLINK cas_18.cas %flaD%:\cas_18.cas
	MKLINK cas_19.cas %flaD%:\cas_19.cas
	MKLINK cas_20.cas %flaD%:\cas_20.cas
	MKLINK cas_21.cas %flaD%:\cas_21.cas
	@ECHO OFF
	ECHO MSLINK Complete.
	PAUSE
	GOTO commands
	
:downNotepp
@ECHO OFF
ECHO Starting Notepad ++ Installer 6.7.4...
START "" "%systemdrive%\nCommand\prerequisites\Notepadpp6.7.4.Installer.exe"
GOTO commands

:prereqDowns
@ECHO OFF
ECHO If any of these programs are already download, you may press cancel when prompted.
ECHO.
PAUSE
ECHO Starting Notepad ++ Installer 6.7.4...
START "" "%systemdrive%\nCommand\prerequisites\Notepadpp6.7.4.Installer.exe"
ECHO.
PAUSE
ECHO Starting 7-Zip Installer 9.38 BETA...
START "" "%systemdrive%\nCommand\prerequisites\7-ZIP9.38.Beta.Installer.exe"
PAUSE
REM ADD MORE PREREQS HERE
ECHO Prerequisites downloaded.
GOTO commands

REM ERROR LEVELS
:UndefErr
@ECHO OFF
ECHO.
ECHO %ERRORLEVEL%
ECHO RUNNING ERRORCODE CHECKER TO CONFIRM.
GOTO ChkErr

:adminerr
@ECHO OFF
ECHO.
ECHO.
ECHO The command requires eleveated control.
ECHO Do you want to relaunch into Administrator Console? [y/n]
SET /p admcont=:
IF /I "%admcont%" EQU "y" GOTO admin
IF /I "%admcont%" EQU "n" GOTO commands
ECHO.
GOTO adminerr

:tasknfErr
ECHO Error: Task/file not found!
ECHO.
GOTO commands

:debug
"%SystemDrive%\nCommand\Test\Debugging\BatCodeCheck.exe" "%SystemDrive%\nCommand\nConsole.bat" /L[:"%systemdrive%\nCommand\nConsole.log"] /E
PAUSE
ECHO.
GOTO deblog

:deblog
@ECHO OFF
ECHO OPEN LOGS? [y/n]
SET /P noteopen=:
IF /I "%noteopen%" EQU "y" (
ECHO Opening notepad++...
START notepad++ "%systemdrive%\nCommand\nConsole.log"
GOTO commands
)
IF /I "%noteopen%" EQU "n" (
ECHO The .log file is still stored under the nConsole
ECHO directory.
GOTO commands
)
%noteopen% > NUL
ECHO.
GOTO deblog

:Code test
REM @ECHO ON
REM INSERT ANY CODE HERE "WITHOUT THE "GOTO" OR EXIT COMMANS AT THE END
REM ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
netsh wlan connect NAME=WXB7S SSID=WXB7S 
REM ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GOTO chkErr

:chkErr
ENDLOCAL
IF ERRORLEVEL 0 (
@ECHO OFF
ECHO Code is working.
GOTO commands
) ELSE (
GOTO chkErrorlev
)

:ChkErrorlev
ECHO 1st CONFIRMATION: ERRORLEVEL %ERRORLEVEL%
@ECHO OFF
FOR %%A IN (0 1 2 3 4 5 6 7 8 9) DO SET ERR%%A=
FOR %%A IN (0 1 2 3 4 5 6 7 8 9) DO IF ERRORLEVEL %%A000 SET ERR1000=%%A
IF %ERR1000% EQU 0 IF NOT "%1" EQU "/0" SET ERR1000=
FOR %%A IN (0 1 2 3 4 5 6 7 8 9) DO IF ERRORLEVEL %ERR1000%%%A00 SET ERR100=%%A
IF "%ERR1000%" EQU "" IF %ERR100% EQU 0 SET ERR100=
FOR %%A IN (0 1 2 3 4 5 6 7 8 9) DO IF ERRORLEVEL %ERR1000%%ERR100%%%A0 SET ERR10=%%A
IF "%ERR1000%" EQU "" IF "%ERR100%" EQU "" IF %ERR10% EQU 0 SET ERR10=
FOR %%A IN (0 1 2 3 4 5 6 7 8 9) DO IF ERRORLEVEL %ERR1000%%ERR100%%ERR10%%%A SET ERR1=%%A
SET ERRORLEV=%ERR1000%%ERR100%%ERR10%%ERR1%
FOR %%A IN (0 1 2 3 4 5 6 7 8 9) DO SET ERR%%A=
ECHO 2nd CONFIRMATION: ERRORLEVEL %ERRORLEV%
IF '%ERRORLEVEL%' EQU '%ERRORLEV%' (
SET confErr=%ERRORLEV%
GOTO advErrors
) ELSE (
ECHO Something went wrong! Confirmations shows
ECHO different results, please log the error.
REM  WORK IN PROGRESS : ADDING BUGLOGGER
PAUSE
GOTO commands
)

:advErrors
IF '%confErr%' EQU '%admError%' (
GOTO adminerr
)
IF '%confErr%' EQU '%typError%' (
@ECHO OFF
ECHO Command is nonexistant, please recheck spelling.
GOTO commands
)
IF '%confErr%' EQU '%tsknfErr%' (
GOTO tasknfErr
) ELSE (
GOTO commands
)

:restscript
REM PLACE VAR
@ECHO OFF
ECHO Restarting...
SET "noteopen="
SET "pass1="
SET "pass2="
SET "pass3="
SET "ret="
SET "cmd="
SET "ans1="
SET "anuac="
SET "bf4ca="
SET "ansbf4="
SET "ansdb4="
SET "flaD="
SET "admcont="
SET "exan="
SET "BUILDNUMBER="
SET "BNA1="
SET "SOFTGAME="
SET "PROGRAM_NAME="
SET "VARIABLE_NAME="
SET "SHORTCUT_NAME="
SET "ansGamsc="
SET "Software_fold="
SET "ansSoftc="
SET "ansRestVar="
SET "varTestc="
SET "var="
SET "skysel="
START "" "%systemdrive%\nCommand\nConsole.bat"
GOTO QKEXIT

:exit
ECHO Are you sure you want to Exit?
ECHO Type "yes" or "no"
SET /p exan=:
IF /I "%exan%" EQU "yes" GOTO QKEXIT
IF /I "%exan%" EQU "no" GOTO commands
GOTO exit

:DontRun
@ECHO OFF
ECHO Program is not supported  on Windows NT 4 and under. Req: Windows 2000 or higher.
PAUSE
GOTO QKEXIT

:QKEXIT
REM PLACE VAR
SET "noteopen="
SET "pass1="
SET "pass2="
SET "pass3="
SET "ret="
SET "cmd="
SET "ans1="
SET "anuac="
SET "bf4ca="
SET "ansbf4="
SET "ansdb4="
SET "flaD="
SET "admcont="
SET "exan="
SET "BUILDNUMBER="
SET "BNA1="
SET "SOFTGAME="
SET "PROGRAM_NAME="
SET "VARIABLE_NAME="
SET "SHORTCUT_NAME="
SET "ansGamsc="
SET "Software_fold="
SET "ansSoftc="
SET "ansRestVar="
SET "varTestc="
SET "var="
SET "skysel="
GOTO EOF

:EOF
ENDLOCAL
EXIT 0
GOTO QKEXIT