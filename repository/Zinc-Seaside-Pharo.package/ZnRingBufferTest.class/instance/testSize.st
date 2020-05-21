tests
testSize
	| buffer |
	buffer := ZnRingBuffer new: 2.
	self assert: buffer size equals: 2.
	
	buffer
		at: 1 put: 1;
		at: 1 put: 1.
	self assert: buffer size equals: 2.
	
	buffer
		moveStartTo: 2;
		at: 1 put: 3.
	self assert: buffer size equals: 2