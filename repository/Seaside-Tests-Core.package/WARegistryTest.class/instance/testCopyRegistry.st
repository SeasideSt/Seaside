tests
testCopyRegistry
	| stored key copy stored2 key2 |
	(handler isKindOf: WAApplication) "applicaiton can only track session"
		ifTrue: [ ^ self ].
	stored := WARequestHandler new.
	key := handler register: stored.

	copy := handler copy.
	
	self assert: (handler cache at: key ifAbsent: [ nil ]) = stored.
	"Since registry keys are dynamically assigned, we don't expect a copy to have the same
	keys and values."
	
	stored2 := WARequestHandler new.
	key2 := handler register: stored2.
	self assert: (handler cache at: key2 ifAbsent: [ nil ]) = stored2.
	self assert: (copy cache at: key2 ifAbsent: [ nil ]) isNil.
	
	copy clear.
	self assert: (handler cache at: key ifAbsent: [ nil ]) = stored