tests
testCopyDispatcher
	| copy originalHandler |
	copy := handler copy.
	self deny: copy == handler.
	self assert: copy defaultName = handler defaultName.
	self assert: copy handlers keys size = handler handlers keys size.
	self assert: (copy handlers keys allSatisfy: [ :each | handler handlers keys includes: each ]).
	self assert: (handler handlers keys allSatisfy: [ :each | copy handlers keys includes: each ]).
	copy handlers
		do: [ :each | 
			originalHandler := handler handlerAt: each name.
			self assert: each class == originalHandler class.
			self deny: each == originalHandler.
			each isDispatcher
				ifTrue: [ self assert: each handlers keys = originalHandler handlers keys ] ]