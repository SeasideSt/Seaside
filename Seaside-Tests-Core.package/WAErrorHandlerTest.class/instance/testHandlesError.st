tests
testHandlesError
	self assert: (self handlerClass handles: Error new).
	self assert: (self createHandler handles: Error new)