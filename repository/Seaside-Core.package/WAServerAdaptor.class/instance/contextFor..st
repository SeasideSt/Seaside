converting
contextFor: aNativeRequest
	"Answer a request context for aNativeRequest."

	^ WARequestContext
		request: (self requestFor: aNativeRequest)
		response: (self responseFor: aNativeRequest)
		codec: self codec