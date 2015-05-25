tests-accessing
testNoop
	self
		assert: self jQuery noop
		equals: self function , '.noop'