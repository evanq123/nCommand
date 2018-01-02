set WshShell = WScript.CreateObject("WScript.Shell")
strDesktop = WshShell.SpecialFolders("Desktop")
intAnswer = _
    Msgbox("Do you want to the delete the .txt file?",_
        vbYesNo, "Delete File")
If intAnswer = vbYes Then	
	Set WshShell = WScript.CreateObject("WScript.Shell")
	WshShell.Run "attrib -r "strDesktop & \fileAssoc.txt" /S, 0, true)
	dim filesys
	Set filesys = CreateObject("Scripting.FileSystemObject") 
	filesys.CreateTextFile strDesktop & "\fileAssoc.txt", True 
		If filesys.FileExists (strDesktop & "\fileAssoc.txt") Then
			filesys.DeleteFile strDesktop & "\fileAssoc.txt"
			WScript.Quit 1
		End If
Else
	WScript.Quit 1
End If