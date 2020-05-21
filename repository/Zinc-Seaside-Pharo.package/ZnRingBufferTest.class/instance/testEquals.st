tests
testEquals
	| buffer |
	buffer := ZnRingBuffer new: 3.
	self assert: buffer equals: #(nil nil nil).
	
	buffer
		at: 1
		put: 1.
	self assert: buffer equals: #(1 nil nil).
	
	buffer moveStartTo: 2.
	self assert: buffer equals: #(nil nil 1)