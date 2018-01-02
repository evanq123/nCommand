REM v0.112a
:file type association
REM  Work in Progress. WORKING ON AUTOMATIC .REG MERGE TO CMD
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
IF /I "%ans1%"=="y" GOTO fix
IF /I "%ans1%"=="n" GOTO commands
IF /I "%ans1%"=="admin" GOTO admin
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
	IF "%VBSCONFDEL%"=="xDel" (
	ATTRIB -r "%DESKTOPDIR%\fileAssoc.txt"
	DEL "%DESKTOPDIR%\fileAssoc.txt"
	ECHO File Deleted.
	GOTO Commands
	) ELSE (
	ECHO Text saved in '%DESKTOPDIR%'
	GOTO commands
	)




REM v0.0020 code needs to work on filedelete.vbs
:file type association
 Work in Progress! WORKING ON AUTOMATIC .REG MERGE TO CMD
ECHO Opening folder location...
EXPLORER "%systemdrive%\nCommand\REGWin8\"
ECHO Opening Read Me.txt...
START notepad++ "%systemdrive%\nCommand\REGWin8\Read me.txt"
ECHO Run Diagnostics? [REQUIRES ADMIN] [y/n]
ECHO or type admin to restart into Administrator Console.
SET /p CMD=:
IF /I "%CMD%"=="y" GOTO fix
IF /I "%CMD%"=="n" GOTO commands
IF /I "%CMD%"=="admin" GOTO admin
ECHO.
GOTO file type association

	:fix
	@ECHO OFF
	ECHO repairing .EXE and .REG files...
	ASSOC .EXE=exefile
	IF ERRORLEVEL 5 GOTO AdminErr
	ASSOC .REG=regfile
	IF ERRORLEVEL 5 GOTO AdminErr
	ECHO Gathering current file associations...
	CD /d "%desktopdir%"
	ASSOC .txt
	ASSOC .doc
	ASSOC>"fileAssoc.txt"
	ATTRIB +r "%desktopdir%\fileAssoc.txt"
	ECHO Text added to desktop!
	ECHO Opening .txt doc in Notepad++...
	START notepad++ "%desktopdir%\fileAssoc.txt"
	@ECHO OFF
	CSRIPT "%systemdrive%\nCommand\vbs\fileErase.vbs" //Nologo
	PAUSE
	GOTO commands

REM	EARLY CONCEPT CODE TESTING
	@echo on
	echo repairing .EXE and .REG files...
	assoc .EXE=exefile
	assoc .REG=regfile
	echo Gathering current file associations...
	cd /d "%DESKTOPDIR%"
	ASSOC .txt
	ASSOC .doc
	ASSOC >fileAssoc.txt
	attrib +r "%DESKTOPDIR%\fileAssoc.txt"
	echo Text added to desktop!
	echo Opening .txt doc in Notepad++...
	start notepad++ "%DESKTOPDIR%\fileAssoc.txt"
	@echo off
	cscript "%SystemDrive%\nCommand\vbs\fileErase.vbs" //Nologo
	pause
	goto commands