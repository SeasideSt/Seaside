tests
testUtilityAliases
	self
		assert: (self jQuery when: 'ready')
		equals: self function , '.when("ready")'.
	self
		assert: (self jQuery each: #(1 2 3))
		equals: self function , '.each([1,2,3])'.
	self
		assert: (self jQuery grep: #(1 2 3))
		equals: self function , '.grep([1,2,3])'.
	self
		assert: (self jQuery map: #(1 2 3))
		equals: self function , '.map([1,2,3])'.
	self
		assert: (self jQuery extend: 'options')
		equals: self function , '.extend("options")'