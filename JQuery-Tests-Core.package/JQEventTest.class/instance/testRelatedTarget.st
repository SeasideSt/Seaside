tests-accessing
testRelatedTarget
	self
		assert: self newEvent relatedTarget
		equals: 'arguments[0].relatedTarget'.
	self
		assert: self clickEvent relatedTarget
		equals: self function , '.Event("click").relatedTarget'