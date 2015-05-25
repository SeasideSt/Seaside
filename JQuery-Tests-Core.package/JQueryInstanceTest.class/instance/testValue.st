tests-manipulating
testValue
	self 
		assert: ((self jQuery: 'input') value)
		equals: self function , '("input").val()'.
	self 
		assert: ((self jQuery: 'input') value: 'bar')
		equals: self function , '("input").val("bar")'