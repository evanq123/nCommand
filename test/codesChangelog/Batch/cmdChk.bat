REM v0.112a
	FOR /F %%G IN ('Tasklist /FI "IMAGENAME eq cmd.exe" 2^>NUL ^| FIND /I /c "cmd.exe"') DO IF %%G LEQ 2 (
	ECHO AdminConsole not activated. 
	GOTO commands
	) ELSE (
	ECHO LAUNCHING ADMIN CONSOLE
	GOTO QKEXIT )

	
	
	
REM ALPHA CONCEPT CODE
	FOR /l %%i IN (1 , 2 , 100) DO ECHO Loading - %%i^% & ping localhost -n 1 > NUL & CLS 
	TIMEOUT /t 1 /nobreak > NUL
	TASKLIST /FI "IMAGENAME eq cmd.exe" /FO CSV > "%TEMP%\search.log"
	FINDSTR /N "cmd.exe" "%TEMP%\search.log" > "%TEMP%\found.log"
	FOR TOKENS=1 %%G IN (%TEMP%\found.log) DO ECHO %%G