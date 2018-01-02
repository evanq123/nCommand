REM v0.112a
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
	
	
	
REM PRE-ALPHA CODE
:Admin
>NUL 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
IF '%ERRORLEVEL%' NEQ '0' (
    ECHO Requesting administrative privileges...
    GOTO UACPrompt
) ELSE ( GOTO gotAdmin )

	:UACPrompt
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%temp%\getAdmin.vbs"
    SET PARAMS = %*:"=""
    ECHO UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getAdmin.vbs"
    "%temp%\getAdmin.vbs"
    del "%temp%\getAdmin.vbs"
	>NUL 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
   IF '%ERRORLEVEL%' NEQ '0' (
	@ECHO OFF
	ECHO ERRORLEVEL %ERRORLEVEL%
	ECHO AdminConsole failed to start.
	ECHO.
	GOTO commands
	) ELSE (
	GOTO QKEXIT
	)
	
	:gotAdmin
	@ECHO OFF 
	ECHO You are already in AdminConsole.
	GOTO commands

REM PRE ALPHA CODE
>NUL 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
IF '%errorlevel%' NEQ '0' (
    ECHO Requesting administrative privileges...
    GOTO UACPrompt
) ELSE ( GOTO gotAdmin )

:UACPrompt
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    SET PARAMS = %*:"=""
    ECHO UAC.ShellExecute "cmd.exe", "/c %~s0 %PARAMS%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    EXIT /B

:gotAdmin
	@ECHO OFF You are already admin!