tests-function
testArguments
	self
		assert: (self function arguments: #(a))
		equals: 'function(a){}'.
	self
		assert: (self function arguments: #(a b))
		equals: 'function(a,b){}'