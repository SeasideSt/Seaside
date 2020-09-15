tests-adding
testRawAddToPath
	url rawAddToPath: 'a/b'.
	self assert: url greaseString = '/a%2Fb'