tests
testPath
	self assert: url greaseString = '/'.
	url path add: 'aa'.
	self assert: url greaseString = '/aa'.
	url path add: 'bb'.
	self assert: url greaseString = '/aa/bb'.
	self assert: url path asArray = #('aa' 'bb' )