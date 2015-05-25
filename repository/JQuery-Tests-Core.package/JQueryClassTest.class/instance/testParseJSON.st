tests-utilities
testParseJSON
	self
		assert: (self jQuery parseJSON: '{ foo: 12 }')
		equals: self function , '.parseJSON("{ foo: 12 }")'