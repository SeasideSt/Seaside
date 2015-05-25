tests-utilities
testGoto
	self assert: (self script goto: 'http://www.seaside.st') equals: 'window.location="http://www.seaside.st"'