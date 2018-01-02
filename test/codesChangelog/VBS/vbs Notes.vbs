
Set objFSO = CreateObject("Scripting.FileSystemObject") 
Set objFile = objFSO.GetFile("C:TestFile.txt")  
'Checking whether file is read-only 
If objFile.Attributes = objFile.Attributes AND 1 Then  
WScript.Echo("File is read only") 
End If  

'Checking whether file is hidden 
If objFile.Attributes = objFile.Attributes AND 2 Then    
WScript.Echo("File is Hidden") 
End If  

'Changing the file to hidden 
objFile.Attributes = objFile.Attributes OR 2  

'Removing the read-only property 
If objFile.Attributes = objFile.Attributes AND 1 Then    
objFile.Attributes = objFile.Attributes XOR 1   
WScript.Echo("Removed read-only property") 
End If