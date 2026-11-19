tests-utilities
testWhen
	self
		assert: (self jQuery when: 'ready')
		equals: self function, '.when("ready")'