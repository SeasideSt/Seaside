processing
processWith: argumentString
	self requestContext respond: [ :response |
		response 
			doNotCache; 
			contentType: self defaultContentType.
		self processOn: response stream with: argumentString ]