callbacks
text: aBlock
	"Defines a text rendering callback."

	self dataType: 'text'.
	self respond: [ :response |
		response
			doNotCache;
			contentType: (WAMimeType textPlain 
				charset: self requestContext handler charSet).
		aBlock value: response stream ]