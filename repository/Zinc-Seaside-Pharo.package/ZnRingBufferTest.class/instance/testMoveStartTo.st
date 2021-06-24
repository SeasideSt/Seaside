tests
testMoveStartTo
	| buffer |
	buffer := ZnRingBuffer new: 5.
	
	buffer
		at: 1 put: 1;
		at: 5 put: 5.
	buffer moveStartTo: 2.
	self assert: (buffer at: 1) isNil.
	self assert: (buffer at: 4) equals: 5.
	self assert: (buffer at: 5) equals: 1.
	
	buffer moveStartTo: 5.
	self assert: (buffer at: 1) equals: 1.
	self assert: (buffer at: 5) equals: 5.
	
	buffer moveStartTo: 5.
	self assert: (buffer at: 1) equals: 5.
	self assert: (buffer at: 2) equals: 1