accessing
temporaryDirectory
	"the directory in which the file is located in which my contents are stored on the server"

	^ (FileDirectory default directoryNamed: 'seasidetmp') assureExistence