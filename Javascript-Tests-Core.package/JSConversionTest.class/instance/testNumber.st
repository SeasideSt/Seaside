tests
testNumber
	self assert: 123 equals: '123'.
	self assert: Float nan equals: 'NaN'.
	self assert: Float infinity equals: 'Infinity'.
	self assert: Float infinity * -1 equals: '-Infinity'