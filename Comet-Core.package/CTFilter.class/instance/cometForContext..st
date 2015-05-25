processing
cometForContext: aRequestContext
	^ (handlers
		at: (aRequestContext request fields
			at: CTComet headerField
			ifAbsent: [ ^ nil ])
		ifAbsent: [ ^ nil ])
			connect: aRequestContext