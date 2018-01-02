set WshShell = WScript.CreateObject("WScript.Shell")

intAnswer = _
    Msgbox("Do you want to the delete the .txt file?",_
        vbYesNo, "Delete File")

If intAnswer = vbYes Then
	wscript.echo("xDel")
	WScript.Quit 1
Else
	WScript.Quit 1
End if