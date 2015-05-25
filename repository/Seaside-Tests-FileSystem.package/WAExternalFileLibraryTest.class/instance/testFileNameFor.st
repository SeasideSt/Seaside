testing
testFileNameFor
	self assert: (GRPlatform current fileNameFor: (GRPlatform current defaultDirectoryPathString)) = (GRPlatform current defaultDirectoryPathString).
	self assert: (GRPlatform current fileNameFor: (GRPlatform current defaultDirectoryPathString),(GRPlatform current pathSeparator)) = (GRPlatform current defaultDirectoryPathString).