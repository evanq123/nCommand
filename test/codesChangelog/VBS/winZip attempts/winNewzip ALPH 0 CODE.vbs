sNewZip = (WScript.Arguments(0))
Sub NewZip(sNewZip)

  Set oNewZipFSO = CreateObject("Scripting.FileSystemObject")
  Set oNewZipFile = oNewZipFSO.CreateTextFile(sNewZip)
    
  oNewZipFile.Write Chr(80) & Chr(75) & Chr(5) & Chr(6) & String(18, 0)
  
  oNewZipFile.Close
  Set oNewZipFSO = Nothing

  Wscript.Sleep(500)
End Sub