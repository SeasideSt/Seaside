tests
testCopyRegistry
	| stored key copy stored2 key2 |
	stored := WARequestHandler new.
	key := handler register: stored.

	copy := handler copy.
	
	self assert: key = (handler keyFor: stored).
	"Since registry keys are dynamically assigned, we don't expect a copy to have the same
	keys and values."
	
	stored2 := WARequestHandler new.
	key2 := handler register: stored2.
	self assert: key2 = (handler keyFor: stored2).
	self should: [ copy keyFor: stored2 ] raise: Error.
	
	copy clear.
	self assert: key = (handler keyFor: stored)