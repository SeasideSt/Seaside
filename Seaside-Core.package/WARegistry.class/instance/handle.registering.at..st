handling-helpers
handle: aRequestContext registering: aRequestHandler at: aKey
	"Register a new handler at the given key and then dispatch the request to it. A cookie may need
	to be added to the response with the handler's key."
	
	self register: aRequestHandler at: aKey.
	self dispatch: aRequestContext to: aRequestHandler key: aKey