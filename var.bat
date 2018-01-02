:startUp
@ECHO OFF
TITLE nConsole (c) 2015 Evan Quach
< %systemdrive%\nCommand\def_txt\defCOLORs.SAV (
SET /P savCol=
)
%savCol%
FOR /F "usebackq delims=" %%i in (`cscript "%systemdrive%\nCommand\vbs\findDesktop.vbs"`) DO SET DESKTOPDIR=%%i
CLS
:shortcuts
REM "Games"
IF /I "%CMD%" EQU "bf4" ( ECHO Starting Battlefield 4 && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\Battlefield 4.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "battlefield 4" ( ECHO Starting Battlefield 4 && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\Battlefield 4.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "dark souls" ( ECHO Starting Dark Souls Prepare to Die Edition && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\Dark Souls Prepare to Die Edition.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "dao" ( ECHO Starting Dragon Age: Origins && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\Dragon Age Origins.lnk"&& ECHO. && GOTO END )
IF /I "%CMD%" EQU "dragon age" ( ECHO Starting Dragon Age: Origins && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\Dragon Age Origins.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "dragon age origins" ( ECHO Starting Dragon Age: Origins && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\Dragon Age Origins.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "dragon age inquisition" ( ECHO Starting Dragon Age: Inquisition && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\Dragon Age Inquisition.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "dragon age 3" ( ECHO Starting Dragon Age: Inquisition && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\Dragon Age Inquisition.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "da3" ( ECHO Starting Dragon Age: Inquisition && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\Dragon Age Inquisition.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "far cry 4" ( ECHO Starting Far Cry 4 && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\Far Cry 4.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "nba" ( ECHO Starting NBK 2k15 && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\NBA 2K15.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "nba2k15" ( ECHO Starting NBK 2k15 && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\NBA 2K15.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "nba 2k15" ( ECHO Starting NBK 2k15 && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\NBA 2K15.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "sc2" ( ECHO Starting Star Craft II && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\Star Craft II.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "starcraft 2" ( ECHO Starting Star Craft II && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\Star Craft II.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "starcraft2" ( ECHO Starting Star Craft II && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\Star Craft II.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "star craft 2" ( ECHO Starting Star Craft II && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\Star Craft II.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "this war of mine" ( ECHO Starting This War of Mine && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\This War of Mine.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "witcher 2" ( ECHO Starting The Witcher 2: Assissins of Kings Enhanced Edition && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\The Witcher 2 - Assassins of Kings Enhanced Edition.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "the witcher 2" ( ECHO Starting The Witcher 2: Assissins of Kings Enhanced Edition && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\The Witcher 2 - Assassins of Kings Enhanced Edition.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "watch dogs" ( ECHO Starting Watch_Dogs && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\Watch_Dogs.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "watch_dogs" ( ECHO Starting Watch_Dogs && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\Watch_Dogs.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "lol" ( ECHO Starting League of Legends && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\League of Legends.lnk" && ECHO. && GOTO END)
IF /I "%CMD%" EQU "league" ( ECHO Starting League of Legends && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\League of Legends.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "league of legends" ( ECHO Starting League of Legends && PAUSE && START "" "%DESKTOPDIR%\Game Shortcuts\League of Legends.lnk" && ECHO. && GOTO END )
REM "Software"
IF /I "%CMD%" EQU "steam" ( ECHO Starting Steam && PAUSE && START "" "%DESKTOPDIR%\Software\Games\Steam.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "origin" ( ECHO Starting Origin && PAUSE && START "" "%DESKTOPDIR%\Software\Games\Origin.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "itunes" ( ECHO Starting iTunes && PAUSE && START "" "%DESKTOPDIR%\Software\Media\iTunes.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "gpx" ( ECHO Starting Guitar Pro 6 && PAUSE && START "" "%DESKTOPDIR%\Software\Media\Guitar Pro 6.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "guitar pro" ( ECHO Starting Guitar Pro 6 && PAUSE && START "" "%DESKTOPDIR%\Software\Media\Guitar Pro 6.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "guitar pro 6" ( ECHO Starting Guitar Pro 6 && PAUSE && START "" "%DESKTOPDIR%\Software\Media\Guitar Pro 6.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "movies" ( ECHO Starting Popcorn Time && PAUSE && START "" "%DESKTOPDIR%\Software\Media\Popcorn Time.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "popcorn" ( ECHO Starting Popcorn Time && PAUSE && START "" "%DESKTOPDIR%\Software\Media\Popcorn Time.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "popcorn time" ( ECHO Starting Popcorn Time && PAUSE && START "" "%DESKTOPDIR%\Software\Media\Popcorn Time.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "paint" ( ECHO Starting Microsoft Paint && PAUSE && START "" "%DESKTOPDIR%\Software\PC\Paint.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "ms paint" ( ECHO Starting Microsoft Paint && PAUSE && START "" "%DESKTOPDIR%\Software\PC\Paint.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "calculator" ( ECHO Starting Wabbitemu (Graphic Calculator TI 84+ C Silver Edition) && PAUSE && START "" "%DESKTOPDIR%\Software\PC\Wabbitemu.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "graphing calculator" ( ECHO Starting Wabbitemu (Graphic Calculator TI 84+ C Silver Edition) && PAUSE && START "" "%DESKTOPDIR%\Software\PC\Wabbitemu.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "wabbitemu" ( ECHO Starting Wabbitemu (Graphic Calculator TI 84+ C Silver Edition) && PAUSE && START "" "%DESKTOPDIR%\Software\PC\Wabbitemu.lnk" && ECHO. && GOTO END )
IF /I "%CMD%" EQU "spotify" ( ECHO Starting Spotify && PAUSE && START "" "%DESKTOPDIR%\Software\Media\Spotify.lnk" && ECHO. && GOTO END )
REM Skyrim (SPECIAL CASE)
IF /I "%CMD%" EQU "skse" GOTO skyrim
IF /I "%CMD%" EQU "the elder scrolls V" GOTO skyrim
IF /I "%CMD%" EQU "the elder scrolls V: skyrim" GOTO skyrim
IF /I "%CMD%" EQU "elder scrolls V: skyrim" GOTO skyrim
IF /I "%CMD%" EQU "elder scrolls skyrim" GOTO skyrim
IF /I "%CMD%" EQU "the elder scrolls skyrim" GOTO skyrim
IF /I "%CMD%" EQU "skyrim" GOTO skyrim
IF /I "%CMD%" EQU "tesv" GOTO skyrim
:calltoTest
CALL %SYSTEMDRIVE%\nCommand\Usersetvar.bat %CMD%
CALL %SYSTEMDRIVE%\nCommand\varTesting.bat %CMD%


:END
GOTO END2
:skyrim
ECHO Pick: "normal"[n] or "skse"[s] The Elder Scrolls V: Skyrim
SET /p skysel=:
IF /I "%skysel%" EQU "n" GOTO n
IF /I "%skysel%" EQU "s" GOTO s
ECHO.
GOTO Skyrim
:n
ECHO Starting The Elder Scrolls V: Skyrim...
PAUSE
START "" "%DESKTOPDIR%\Game Shortcuts\Skyrim.lnk"
GOTO END2
:s
ECHO Starting The Elder Scrolls V: Skyrim (SKSE)...
PAUSE
START "" "%DESKTOPDIR%\Game Shortcuts\Skyrim (SKSE).lnk"
GOTO END2
:END2
SET varTestc=commands
CALL %SYSTEMDRIVE%\nCommand\nConsole.bat %varTestc%
GOTO END2