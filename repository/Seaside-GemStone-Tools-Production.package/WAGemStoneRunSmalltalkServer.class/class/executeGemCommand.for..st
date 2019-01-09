running script
executeGemCommand: command for: server

	| commandLine |
	Transcript cr; show: '---', command, ' Seaside gems', ' ('; show: TimeStamp now printString; show: ')'.
	commandLine := 
		(GsFile _expandEnvVariable: 'GEMSTONE' isClient: false), 
		'/seaside/bin/runSmalltalkServer ', 
		command, 
		' ', 
		server name,
		' ', 
		server portString.
	Transcript cr; show: (System performOnServer: commandLine) withSqueakLineEndings.
	Transcript cr; show: '---Finished Seaside gems ', command, ' ('; show: TimeStamp now printString; show: ')'.