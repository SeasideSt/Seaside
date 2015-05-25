generation
notFound
	"The resource could not be found and the request processing was aborted."
	| response |
	self makePlainTextAndPerform: #notFound.
	response := self response.
	self request url pathUnencodedOn: response.
	response nextPutAll: ' not found'