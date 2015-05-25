tests-function
testAsFunction
	self
		assert: (self script asFunction: #(a))
		equals: 'function(a){}'.
	self
		assert: (self function asFunction: #(a b))
		equals: 'function(a,b){}'