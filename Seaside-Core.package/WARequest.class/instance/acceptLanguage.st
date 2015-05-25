accessing-headers
acceptLanguage
	"The Accept-Language request-header field is similar to Accept, but restricts the set of natural languages that are preferred as a response to the request.
	
	Answers an OrderedCollection of WAAcceptLanguage with the values in the order the client sent them."

	^ WAAcceptLanguage fromString: (self headerAt: 'accept-language' ifAbsent: [ ^ nil ])