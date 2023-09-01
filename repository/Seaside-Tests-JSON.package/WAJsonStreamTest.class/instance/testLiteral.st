tests-literals
testLiteral
	self assert: true gives: 'true'.
	self assert: false gives: 'false'.
	self assert: nil gives: 'null'