processing
handleFiltered: aRequestContext
	(self shouldTerminate: aRequestContext)
		ifTrue: [ self terminate: aRequestContext ]
		ifFalse: [ mutex critical: [ super handleFiltered: aRequestContext ] ]