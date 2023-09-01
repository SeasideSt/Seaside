tests-literals
testStringEscaping
	self assert: '''' gives: '"''"'.
	self assert: '"' gives: '"\""'.
	self assert: '\' gives: '"\\"'