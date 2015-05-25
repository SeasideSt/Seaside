tests
testCloneApplication
	| app handler key clone |
	app := WADispatcher new register: WAApplication new at: 'app'.
	handler := WARequestHandler new.
	key := app register: handler.
	
	clone := app cloneHandler.
	
	self assert: key = (app keyFor: handler).
	self should: [ clone keyFor: handler ] raise: Error