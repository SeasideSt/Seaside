tests
testCondition
	self
		assert: (self mock condition: true)
		equals: 'if(true){mock}'.
	self
		assert: (self mock condition: false)
		equals: 'if(false){mock}'