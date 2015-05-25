accessing-headers
acceptEncoding
	"The Accept-Encoding request-header field is similar to Accept, but restricts the content-codings (section 3.5) that are acceptable in the response.
	
	Answers an OrderedCollection of WAAcceptEncoding with the values in the order the client sent them."

	^ WAAcceptEncoding fromString: (self headerAt: 'accept-encoding' ifAbsent: [ ^ nil ])