tests
testConvert
	self
		assert: self function
		equals: 'function(){}'.
	self
		assert: self function asFunction
		equals: 'function(){}'.
	self 
		assert: 'alert("1")' asFunction
		equals: 'function(){alert("1")}'