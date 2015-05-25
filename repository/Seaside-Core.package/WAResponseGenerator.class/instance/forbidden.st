generation
forbidden
	"The resource is forbidden to access and the request was not processed."
	| response |
	self makePlainTextAndPerform: #forbidden.
	response := self response.
	response nextPutAll: 'Error: you are forbidden to access "'.
	self request url pathUnencodedOn: response.
	response nextPutAll: '"'