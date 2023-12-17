tests
testAt
	| buffer |
	buffer := ZnRingBuffer new: 5.
	self assert: (buffer at: 1) isNil.
	
	buffer
		at: 1
		put: 1.
	self assert: (buffer at: 1) equals: 1.
	
	buffer
		at: 2
		put: 2.
	self assert: (buffer at: 2) equals: 2.
	
	buffer
		at: 5
		put: 6.
	self assert: (buffer at: 3) isNil.
	self assert: (buffer at: 4) isNil.
	self assert: (buffer at: 5) equals: 6