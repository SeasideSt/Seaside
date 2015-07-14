handling
handleFiltered: aRequestContext
	| key continuation fields documentHandlerKey |
	fields := aRequestContext request fields.
	documentHandlerKey := fields at: self documentHandlerFieldName ifAbsent: [ nil ].
	documentHandlerKey isNil ifFalse: [
		| documentHandler |
		documentHandler := self cache at: documentHandlerKey ifAbsent: [ 
			^ aRequestContext responseGenerator
				notFound;
				respond ].
		^ documentHandler handle: aRequestContext ].
	
	key := fields
		at: self actionField
		ifAbsent: [ ^ self start ].
		
	continuation := continuations
		at: key
		ifAbsent: [ ^ self unknownRequest ].
	continuation handle: aRequestContext