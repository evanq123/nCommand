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