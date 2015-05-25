generation
notImplemented
	"The functionality requested is not implemented and the request processing was aborted."

	self makePlainTextAndPerform: #notImplemented.
	self response
		nextPutAll: 'Not Implemented'