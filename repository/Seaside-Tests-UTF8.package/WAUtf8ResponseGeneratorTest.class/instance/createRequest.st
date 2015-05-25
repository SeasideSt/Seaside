configuration
createRequest
 	| request |
	request := super createRequest.
	request url
		addToPath: 'book';
		addToPath: (String with: (Character codePoint: 225) with: (Character codePoint: 269)).
	^ request