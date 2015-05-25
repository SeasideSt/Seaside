accessing-headers
accept
	"The Accept request-header field can be used to specify certain media types which are acceptable for the response. Accept headers can be used to indicate that the request is specifically limited to a small set of desired types, as in the case of a request for an in-line image.
	
	Answers an OrderedCollection of WAAccept with the values in the order the client sent them."

	^ WAAccept fromString: (self headerAt: 'accept' ifAbsent: [ ^ nil ])