processing
handleFiltered: aRequestContext
	(aRequestContext response isStreamingResponse)
		ifFalse: [ CTStreamingServerRequired signal: 'Streaming server required.' ].
	(aRequestContext request includesKey: CTComet headerField)
		ifTrue: [ self cometForContext: aRequestContext ]
		ifFalse: [ super handleFiltered: aRequestContext ]