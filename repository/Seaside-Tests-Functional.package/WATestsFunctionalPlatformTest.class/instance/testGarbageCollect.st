tests
testGarbageCollect
	self 
		shouldnt: [ GRPlatform current seasideGarbageCollect ]
		raise: MessageNotUnderstood