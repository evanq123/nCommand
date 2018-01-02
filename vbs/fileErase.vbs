Set WshShell = WScript.CreateObject("WScript.Shell")
strDesktop = WshShell.SpecialFolders("Desktop")
directory = strDesktop
wscript.echo(strdesktop)

intAnswer = _
    Msgbox("Do you want to the delete the .txt file?",_
        vbYesNo, "Delete File")


If intAnswer = vbYes Then
	Dim filesys
	Set filesys = CreateObject("Scripting.FileSystemObject") 
	If filesys.FileExists (strDesktop & "\fileAssoc.txt") Then
		Set objfso = CreateObject("Scripting.FileSystemObject")
		objFSO.DeleteFile(strDesktop & "\fileAssoc.txt"), True
		WScript.Echo("Deleted file!")
		WScript.Quit 1
	Else
		WScript.Echo("This file does not exist!")
	End If
	Else
		WScript.Quit 1
End if