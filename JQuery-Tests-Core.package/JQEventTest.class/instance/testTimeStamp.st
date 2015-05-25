tests-accessing
testTimeStamp
	self
		assert: self newEvent timeStamp
		equals: 'arguments[0].timeStamp'.
	self
		assert: self clickEvent timeStamp
		equals: self function , '.Event("click").timeStamp'