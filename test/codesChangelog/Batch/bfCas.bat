REM v0.112a
:BF4 Cas
REM  find out how to set error level for this 	REM if ERRORLEVEL 5 GOTO AdminErr
@ECHO OFF
ECHO Run BF4 Loading Speed fix? [REQUIRES ADMIN] [y/n]
ECHO or type admin to restart into Administrator Console.
SET /p bf4ca=:
IF /I "%bf4ca%"=="y" GOTO bf4contcas
IF /I "%bf4ca%"=="n" GOTO commands
IF /I "%bf4ca%"=="admin" GOTO admin
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
	IF "%answDBF%"=="1" SET answDBF="%systemdrive%/Game Files/battlefield 4/Data"
	PAUSE
	ECHO 4th: Check your flash drive letter; the one with your cas file; [Drive]:\
	ECHO if it is not "H:\" press [1] if it "H" is you may press enter.
	ECHO to START the fix.
	SET /p ansBF=:
	IF "%ansBF%"=="1" GOTO flashLetter
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





:: PRE-ALPHA BF4 CAS BUILDING CONCEPT
:: cd /d "C:\Game_Files\Battlefield 4\Data"
:: MKLINK cas_01.cas H:\cas_01.cas
:: MKLINK cas_02.cas H:\cas_01.cas
:: MKLINK cas_03.cas H:\cas_01.cas
:: MKLINK cas_04.cas H:\cas_01.cas
:: MKLINK cas_05.cas H:\cas_01.cas
:: MKLINK cas_06.cas H:\cas_01.cas
:: MKLINK cas_07.cas H:\cas_01.cas
:: MKLINK cas_01.cas H:\cas_01.cas
:: MKLINK cas_01.cas H:\cas_01.cas
:: MKLINK cas_01.cas H:\cas_01.cas
:: MKLINK cas_01.cas H:\cas_01.cas
:: MKLINK cas_01.cas H:\cas_01.cas
:: MKLINK cas_01.cas H:\cas_01.cas
:: MKLINK cas_01.cas H:\cas_01.cas
:: MKLINK cas_01.cas H:\cas_01.cas
:: MKLINK cas_01.cas H:\cas_01.cas
:: MKLINK cas_01.cas H:\cas_01.cas
:: MKLINK cas_01.cas H:\cas_01.cas
:: MKLINK cas_01.cas H:\cas_01.cas
:: MKLINK cas_01.cas H:\cas_01.cas
:: MKLINK cas_01.cas H:\cas_01.cas