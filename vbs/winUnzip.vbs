sUnzipFileName = (WScript.Arguments(0))
sUnzipDestination = (WScript.Arguments(1))
Function WindowsUnZip(sUnzipFileName, sUnzipDestination)

  Set oUnzipFSO = CreateObject("Scripting.FileSystemObject")
 
  If Not oUnzipFSO.FolderExists(sUnzipDestination) Then
    oUnzipFSO.CreateFolder(sUnzipDestination)
  End If

  With CreateObject("Shell.Application")
       .NameSpace(sUnzipDestination).Copyhere .NameSpace(sUnzipFileName).Items
  End With

  Set oUnzipFSO = Nothing
End Function