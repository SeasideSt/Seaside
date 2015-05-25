converting-request
requestBodyFor: aNativeRequest
	"This only works for POST and PUT requests... LAME!"

	aNativeRequest isPost ifTrue: [
		| body |
		"Nasty nastiness but we need to get the raw body before Swazoo parses
		the POST data. Then we need to manually reinject the data to allow it to
		be parsed (since the data has already been pulled off the socket)."
		body := aNativeRequest postData stream nextBytes: aNativeRequest contentLength.
		aNativeRequest parsePostDataFrom: (SwazooStream on: body).
		aNativeRequest postData setParsed.
		^ body ].
	aNativeRequest isPut
		ifTrue: [ ^ aNativeRequest putData ].
	^ nil