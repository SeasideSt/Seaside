handling-helpers
handle: aRequestContext registering: aRequestHandler
	"Register a new handler and then dispatch the request to it. A cookie may need
	to be added to the response with the handler's key."
	
	| key |
	key := self register: aRequestHandler.
	self dispatch: aRequestContext to: aRequestHandler key: key