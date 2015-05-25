tests-adding
testAddToPathEmptyString
	url addToPath: ''.
	self assert: url path isEmpty.
	self assert: url greaseString = '/'