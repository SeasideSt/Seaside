tests
testAtOutOfBounds
	| buffer |
	buffer := ZnRingBuffer new: 5.
	self
		should: [ buffer at: 0 ]
		raise: ZnRingBufferIllegalAccess.
	self
		should: [ buffer at: -1 ]
		raise: ZnRingBufferIllegalAccess.
	self
		should: [ buffer at: 6 ]
		raise: ZnRingBufferIllegalAccess