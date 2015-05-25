tests
testFragment
	url fragment: 'id'.
	self assert: url fragment = 'id'.
	self assert: url greaseString = '/#id'