handling
handleFiltered: aRequestContext
	| continationKey continuation fields documentHandlerKey |
	fields := aRequestContext request fields.
	documentHandlerKey := fields at: self documentHandlerFieldName ifAbsent: [ nil ].
	documentHandlerKey isNil ifFalse: [
		| documentHandler |
		documentHandler := self documentHandlers at: documentHandlerKey ifAbsent: [ 
			^ aRequestContext responseGenerator
				notFound;
				respond ].
		^ documentHandler handle: aRequestContext ].
	
	continationKey := fields
		at: self actionField
		ifAbsent: [ ^ self start ].
		
	continuation := continuations
		at: continationKey
		ifAbsent: [ ^ self unknownRequest ].
	continuation handle: aRequestContext