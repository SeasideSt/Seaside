tests
testIllegalInstantiation
	self
		should: [ GRPlatform current ringBufferClass new ]
		raise: ZnRingBufferIllegalUse