tests-utilities
testError
	self
		assert: (self jQuery error: 'Doomsday Device')
		equals: self function , '.error("Doomsday Device")'