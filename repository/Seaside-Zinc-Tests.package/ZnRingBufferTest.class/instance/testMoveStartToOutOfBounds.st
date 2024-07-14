tests
testMoveStartToOutOfBounds
	| buffer |
	buffer := GRPlatform current ringBufferClass new: 5.
	self
		should: [ buffer moveStartTo: 0 ]
		raise: ZnRingBufferIllegalAccess.
	self
		should: [ buffer moveStartTo: -1 ]
		raise: ZnRingBufferIllegalAccess.
	self
		should: [ buffer moveStartTo: 6 ]
		raise: ZnRingBufferIllegalAccess