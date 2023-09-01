tests-literals
testStringBasic
	self assert: 'abc' gives: '"abc"'.
	self assert: '123' gives: '"123"'