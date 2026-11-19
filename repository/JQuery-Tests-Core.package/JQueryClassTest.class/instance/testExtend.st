tests-utilities
testExtend
	self
		assert: (self jQuery extend: 'options')
		equals: self function, '.extend("options")'