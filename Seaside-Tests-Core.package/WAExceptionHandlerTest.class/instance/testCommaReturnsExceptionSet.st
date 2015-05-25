testing
testCommaReturnsExceptionSet
	| set |
	set := self handlerClass, WATestError.
	self assert: (set isKindOf: ExceptionSet).
	self assert: (set handles: WATestError new).
	
	set := self createHandler, WATestError.
	self assert: (set isKindOf: ExceptionSet).
	self assert: (set handles: WATestError new)