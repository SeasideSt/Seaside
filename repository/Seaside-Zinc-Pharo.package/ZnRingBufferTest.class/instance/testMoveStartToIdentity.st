tests
testMoveStartToIdentity
	| buffer |
	buffer := ZnRingBuffer new: 5.
	
	buffer
		at: 1 put: 1;
		moveStartTo: 1.
	self assert: (buffer at: 1) equals: 1