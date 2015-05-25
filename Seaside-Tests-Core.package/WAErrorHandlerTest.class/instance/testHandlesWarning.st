tests
testHandlesWarning
	self assert: (self handlerClass handles: Warning new).
	self assert: (self createHandler handles: Warning new)