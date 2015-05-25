tests-utilities
testIsWindow
	self
		assert: (self jQuery isWindow: Dictionary new)
		equals: self function , '.isWindow({})'