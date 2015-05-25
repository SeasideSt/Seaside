tests
testHost
	url host: 'seaside.st'.
	self assert: url host = 'seaside.st'.
	self assert: url greaseString = 'http://seaside.st/'