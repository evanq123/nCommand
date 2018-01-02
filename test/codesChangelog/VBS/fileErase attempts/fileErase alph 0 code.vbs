set WshShell = WScript.CreateObject("WScript.Shell")
strDesktop = WshShell.SpecialFolders("Desktop")
dim filesys
Set filesys = CreateObject("Scripting.FileSystemObject") 
filesys.CreateTextFile "c:\somefile.txt", True 
If filesys.FileExists("c:\somefile.txt") Then
   filesys.DeleteFile "c:\somefile.txt" 
   Response.Write("File deleted")
End If 