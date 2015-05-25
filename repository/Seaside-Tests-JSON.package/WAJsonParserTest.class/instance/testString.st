tests-literals
testString
	self assert: (self parse: '""') = ''.
	self assert: (self parse: '"foo"') = 'foo'.
	self assert: (self parse: '"foo bar"') = 'foo bar'.
	self assert: (self parse: '" foo "') = ' foo '