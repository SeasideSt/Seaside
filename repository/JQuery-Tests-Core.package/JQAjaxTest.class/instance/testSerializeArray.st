tests-convenience
testSerializeArray
	self
		assert: (self jQuery this serializeArray)
		equals: self function , '(this).serializeArray()'