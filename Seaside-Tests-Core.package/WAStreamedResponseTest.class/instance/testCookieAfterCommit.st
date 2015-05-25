tests-state
testCookieAfterCommit
	self response flush.
	self 
		should: [ self response addCookie: WACookie new ]
		raise: WAIllegalStateException