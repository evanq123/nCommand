sZipFile =( WScript.Arguments(0))
sNewZip = (WScript.Arguments(1))
Function WindowsZip(sFile, sZipFile)

  Set oZipShell = CreateObject("WScript.Shell")  
  Set oZipFSO = CreateObject("Scripting.FileSystemObject")
  
  If Not oZipFSO.FileExists(sZipFile) Then
    NewZip(sZipFile)
  End If

  Set oZipApp = CreateObject("Shell.Application")
  
  sZipFileCount = oZipApp.NameSpace(sZipFile).items.Count

  aFileName = Split(sFile, "\")
  sFileName = (aFileName(Ubound(aFileName)))
  
  sDupe = False
  For Each sFileNameInZip In oZipApp.NameSpace(sZipFile).items
    If LCase(sFileName) = LCase(sFileNameInZip) Then
      sDupe = True
      Exit For
    End If
  Next
  
  If Not sDupe Then
    oZipApp.NameSpace(sZipFile).Copyhere sFile

    On Error Resume Next
    sLoop = 0
    Do Until sZipFileCount < oZipApp.NameSpace(sZipFile).Items.Count
      Wscript.Sleep(100)
      sLoop = sLoop + 1
    Loop
    On Error Goto 0
  End If
End Function