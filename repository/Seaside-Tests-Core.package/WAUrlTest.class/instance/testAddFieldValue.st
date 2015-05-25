tests-adding
testAddFieldValue
	url 
		addField: 'x'
		value: 1.
	self assert: url greaseString = '/?x=1'.
	url 
		addField: 'y'
		value: 2.
	self assert: url greaseString = '/?x=1&y=2'.
	url 
		addField: 'x'
		value: 3.
	self assert: url greaseString = '/?x=1&y=2&x=3'