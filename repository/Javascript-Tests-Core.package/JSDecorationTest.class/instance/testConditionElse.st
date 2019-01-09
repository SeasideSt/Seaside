tests
testConditionElse
	self
		assert: (self mock condition: true else: false)
		equals: 'if(true){mock}else{false}'.
	self
		assert: (self mock condition: false else: true)
		equals: 'if(false){mock}else{true}'