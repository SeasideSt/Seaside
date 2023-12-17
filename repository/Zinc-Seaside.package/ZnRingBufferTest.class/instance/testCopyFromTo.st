tests
testCopyFromTo
	| buffer copy |
	buffer := ZnRingBuffer on: #(1 2 3 4).
	copy := buffer
		copyFrom: 2
		to: 4.
		
	self assert: copy equals: #(2 3 4).
	
	copy := buffer
		copyFrom: 1
		to: 4.
		
	self assert: copy equals: #(1 2 3 4).
	
	buffer moveStartTo: 2.
	copy := buffer
		copyFrom: 2
		to: 4.
		
	self assert: copy equals: #(3 4 1).
	
	buffer moveStartTo: 2.
	copy := buffer
		copyFrom: 2
		to: 4.
		
	self assert: copy equals: #(4 1 2)