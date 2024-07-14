tests-literals
testNumberInteger
	self assert: (self parse: '0') equals: 0.
	self assert: (self parse: '1') equals: 1.
	self assert: (self parse: '-1') equals: -1.
	self assert: (self parse: '12') equals: 12.
	self assert: (self parse: '-12') equals: -12.
	self assert: (self parse: '1e2') equals: 100.
	self assert: (self parse: '1e+2') equals: 100