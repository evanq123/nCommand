set WshShell = WScript.CreateObject("WScript.Shell")
strDesktop = WshShell.SpecialFolders("Desktop")


intAnswer = _
    Msgbox("Do you want to the delete the .txt file?",_
        vbYesNo, "Delete File")


If intAnswer = vbYes Then
	dim filesys
	Set filesys = CreateObject("Scripting.FileSystemObject") 
	If filesys.FileExists (strDesktop & "\fileAssoc.txt") Then
	filesys.DeleteFile strDesktop & "\fileAssoc.txt"
	WScript.Echo("Deleted files!")
	WScript.Quit 1
	Else
		WScript.Echo("This file does not exist!")
	End If
Else
	WScript.Quit 1
End if