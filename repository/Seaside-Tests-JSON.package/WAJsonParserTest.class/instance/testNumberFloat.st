tests-literals
testNumberFloat
	self assert: (self parse: '0.0') equals: 0.0.
	self assert: (self parse: '0.12') equals: 0.12.
	self assert: (self parse: '-0.12') equals: -0.12.
	self assert: (self parse: '12.34') equals: 12.34.
	self assert: (self parse: '-12.34') equals: -12.34.
	self assert: (self parse: '1.2e0') equals: 1.2.
	self assert: (self parse: '1.2e+1') equals: 12.0.
	self assert: (self parse: '1.2e-1') equals: 1.2e-1