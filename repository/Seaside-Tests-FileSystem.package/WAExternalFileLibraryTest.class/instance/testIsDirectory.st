testing
testIsDirectory
	self assert: (GRPlatform current isDirectory: (GRPlatform current defaultDirectoryPathString))