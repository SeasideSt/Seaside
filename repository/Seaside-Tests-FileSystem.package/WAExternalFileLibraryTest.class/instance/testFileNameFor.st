testing
testFileNameFor
	| platform |
	platform := GRPlatform current.
	self assert: (platform fileNameFor: platform defaultDirectoryPathString) = platform defaultDirectoryPathString.
	self assert: (platform fileNameFor: platform defaultDirectoryPathString, platform pathSeparator) = platform defaultDirectoryPathString