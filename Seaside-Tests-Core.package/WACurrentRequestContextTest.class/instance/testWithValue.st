tests
testWithValue
	WACurrentRequestContext
		use: 1
		during: [ self assert: WACurrentRequestContext value = 1 ]