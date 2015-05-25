tests-comparing
testHash
	url host: 'seaside.st'.
	self assert: url hash = url hash.
	self assert: url hash = url copy hash