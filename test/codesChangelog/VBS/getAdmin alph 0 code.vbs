SET UAC = CreateObject("Shell.Application") 
UAC.ShellExecute "cmd.exe", "/c C:\CowCMD\nConsole.bat ", "", "runas", 1 
