testing
assertHandles: anObject returnsSatisfying: aBlock 
	| result instanceResult |
	result := self handlerClass handles: anObject.
	instanceResult := self createHandler handles: anObject.
	self assert: result = instanceResult.
	self assert: (aBlock value: result)