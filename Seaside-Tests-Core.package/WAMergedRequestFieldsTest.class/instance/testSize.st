tests-accessing
testSize
	self assert: merged size = 0.
	one at: 'foo' put: 1.
	self assert: merged size = 1.
	two at: 'foo' put: 2.
	self assert: merged size = 2.
	two at: 'bar' put: 4.
	self assert: merged size = 3
	