intAnswer = _
    Msgbox("Would you like to restart now?",_
        vbYesNo, "Restart")
		
	If intAnswer = vbYes Then
			Set OpSysSet = GetObject("winmgmts:{authenticationlevel=Pkt," _
				& "(Shutdown)}").ExecQuery("select * from Win32_OperatingSystem where "_
				& "Primary=true")
			For Each OpSys In OpSysSet
				retVal = OpSys.Reboot()
Next
	Else
			WScript.Quit 1	
			
	End If