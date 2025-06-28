processing
handleFiltered: aRequestContext
	(aRequestContext request isWebSocketSetupRequest)
		ifFalse: [ ^ super handleFiltered: aRequestContext ].
		
	self createWebSocketForContext: aRequestContext.
	