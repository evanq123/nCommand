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
ECHO Type "admin" to gain Adminstrator Privalages for this CMD.
ECHO Press "g" to return to nCommands
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
IF /I "%CMD%" EQU "g" GOTO restscript
%CMD%
GOTO commands

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

:Custom COLORs
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

:restscript
REM PLACE VAR
@ECHO OFF
ECHO Returning to nCommand...
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