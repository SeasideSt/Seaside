tests-utilities
testJsonFromString
	self
		assert: (self jQuery jsonFromString: '{ foo: 12 }')
		equals: 'JSON.parse("{ foo: 12 }")'