generation
internalError: anException
	"An internal error occurred while processing the request."

	self makePlainTextAndPerform: #internalError.
	self response
		nextPutAll: 'Internal Error: ';
		nextPutAll: (anException messageText ifNil: [ String new ])