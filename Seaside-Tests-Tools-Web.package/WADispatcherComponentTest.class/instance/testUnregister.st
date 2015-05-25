tests
testUnregister
	| url |
	url := normalApplication url.
	url path removeFirst.
	self assert: (WAAdmin unregister: url pathStringUnencoded in: rootHandler) = normalApplication.
	self assert: (WAAdmin unregister: url pathStringUnencoded in: rootHandler) isNil.
	
	url := childHandler url.
	url path removeFirst.
	self assert: (WAAdmin unregister: url pathStringUnencoded in: rootHandler) = childHandler.
	self assert: (WAAdmin unregister: url pathStringUnencoded in: rootHandler) isNil.
	
	self assert: (WAAdmin unregister: '/not-existing' in: rootHandler) isNil