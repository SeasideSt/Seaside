tests-accessing
testPageY
	self
		assert: self newEvent pageY
		equals: 'arguments[0].pageY'.
	self
		assert: self clickEvent pageY
		equals: self function , '.Event("click").pageY'