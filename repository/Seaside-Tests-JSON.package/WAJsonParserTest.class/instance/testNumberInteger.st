tests-literals
testNumberInteger
	self assert: (self parse: '0') = 0.
	self assert: (self parse: '1') = 1.
	self assert: (self parse: '-1') = -1.
	self assert: (self parse: '12') = 12.
	self assert: (self parse: '-12') = -12.
	self assert: (self parse: '1e2') = 100.
	self assert: (self parse: '1e+2') = 100