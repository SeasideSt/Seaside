as yet unclassified
startOn: aPortNumber andServeFilesFrom: aDirectoryPathString
	self startOn: aPortNumber.
	self default server delegate serveFilesFrom: aDirectoryPathString