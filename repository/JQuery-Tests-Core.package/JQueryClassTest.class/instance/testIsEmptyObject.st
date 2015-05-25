tests-utilities
testIsEmptyObject
	self
		assert: (self jQuery isEmptyObject: Dictionary new)
		equals: self function , '.isEmptyObject({})'