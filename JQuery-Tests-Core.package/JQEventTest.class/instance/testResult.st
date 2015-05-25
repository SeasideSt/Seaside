tests-accessing
testResult
	self
		assert: self newEvent result
		equals: 'arguments[0].result'.
	self
		assert: self clickEvent result
		equals: self function , '.Event("click").result'