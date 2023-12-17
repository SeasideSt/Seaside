tests
testIndexOfIfAbsent
	| buffer index |
	buffer := ZnRingBuffer new: 5.
	buffer
		at: 2
		put: 1.
	
	index := buffer
		indexOf: 1
		ifAbsent: [ -1 ].
	self assert: index equals: 2.
	
	buffer moveStartTo: 2.
	index := buffer
		indexOf: 1
		ifAbsent: [ -1 ].
	self assert: index equals: 1.
	
	buffer moveStartTo: 2.
	index := buffer
		indexOf: 1
		ifAbsent: [ -1 ].
	self assert: index equals: 5.
	
	buffer moveStartTo: 2.
	index := buffer
		indexOf: 1
		ifAbsent: [ -1 ].
	self assert: index equals: 4.
	
	buffer moveStartTo: 2.
	index := buffer
		indexOf: 1
		ifAbsent: [ -1 ].
	self assert: index equals: 3.
	
	buffer moveStartTo: 2.
	index := buffer
		indexOf: 1
		ifAbsent: [ -1 ].
	self assert: index equals: 2