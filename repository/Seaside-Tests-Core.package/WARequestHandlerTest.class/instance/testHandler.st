tests
testHandler
	| filter1 filter2 |
	filter1 := handler addFilter: WARequestFilter new.
	filter2 := handler addFilter: WARequestFilter new.
	self assert: handler handler = handler.
	self assert: filter1 handler = handler.
	self assert: filter2 handler = handler