tests-utilities
testIsPlainObject
	self
		assert: (self jQuery isPlainObject: Dictionary new)
		equals: self function , '.isPlainObject({})'