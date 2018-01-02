intAnswer = _
    Msgbox("Would you like to restart now?",_
        vbYesNo, "Restart")
		
	If intAnswer = vbYes Then
			Set OpSysSet = GetObject("winmgmts:{authenticationlevel=Pkt," _
				& "(Shutdown)}").ExecQuery("select * from Win32_OperatingSystem where "_
				& "Primary=true")
			for each OpSys in OpSysSet
				retVal = OpSys.Reboot()
next
	Else
			WScript.Quit 1
			
	End If