tests-literals
testString
	self assert: (self parse: '""') equals: ''.
	self assert: (self parse: '"foo"') equals: 'foo'.
	self assert: (self parse: '"foo bar"') equals: 'foo bar'.
	self assert: (self parse: '" foo "') equals: ' foo '