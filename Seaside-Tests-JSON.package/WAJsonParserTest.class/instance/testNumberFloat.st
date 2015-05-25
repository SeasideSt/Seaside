tests-literals
testNumberFloat
	self assert: (self parse: '0.0') = 0.0.
	self assert: (self parse: '0.12') = 0.12.
	self assert: (self parse: '-0.12') = -0.12.
	self assert: (self parse: '12.34') = 12.34.
	self assert: (self parse: '-12.34') = -12.34.
	self assert: (self parse: '1.2e0') = 1.2.
	self assert: (self parse: '1.2e+1') = 12.0.
	self assert: (self parse: '1.2e-1') = 1.2e-1