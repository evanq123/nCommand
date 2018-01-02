set WshShell = WScript.CreateObject("WScript.Shell")
strDesktop = WshShell.SpecialFolders("Desktop")
Set objFSO = CreateObject("Scripting.FileSystemObject") 
Set objFile = objFSO.GetFile(strDesktop & "\fileAssoc.txt") 

intAnswer = _
    Msgbox("Do you want to the delete the .txt file?",_
        vbYesNo, "Delete File")
		
If intAnswer = vbYes Then	
	dim filesys
	Set filesys = CreateObject("Scripting.FileSystemObject") 
	filesys.CreateTextFile objFile, True 
	If filesys.FileExists (objFile) Then
	
		If objFile.Attributes = objFile.Attributes AND 1 Then    
		objFile.Attributes = objFile.Attributes XOR 1   
		WScript.Echo("Removed read-only property... Deleting file(s)") 
			filesys.DeleteFile objFile
			WScript.Quit 1
		WScript.Echo("Deleted files!")
		End If
		
	Else
		WScript.Echo("This file does not exist!")
	End If
	
Else
	WScript.Quit 1
End If