private
sessionIdFromContext: aRequestContext
	^ aRequestContext request forwarded ifNil:[ aRequestContext request remoteAddress ]