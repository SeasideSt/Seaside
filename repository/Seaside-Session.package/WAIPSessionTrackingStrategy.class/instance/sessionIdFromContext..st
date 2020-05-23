private
sessionIdFromContext: aRequestContext
	^ aRequestContext request forwardedFor ifNil:[ aRequestContext request remoteAddress ]