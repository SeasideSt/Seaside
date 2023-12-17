tests
testIllegalInstantiation
	self
		should: [ ZnRingBuffer new ]
		raise: ZnRingBufferIllegalUse