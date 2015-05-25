processing
process: aNativeRequest
	"Process aNativeRequest by converting to a request context, handling the request, and converting the request context back to a native response. Make sure to release the context after processing, to help the garbage collector and avoid having large streams and sockets hanging around if people still refer to the obsolete request context."

	| context |
	context := self contextFor: aNativeRequest.
	^ [ self handle: context; responseFrom: context ]
		ensure: [ context destroy ]