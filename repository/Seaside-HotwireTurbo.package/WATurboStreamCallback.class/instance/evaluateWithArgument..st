evaluation
evaluateWithArgument: anObject
		
	self requestContext respond: [ :response |
		response
			doNotCache;
			contentType: 'text/vnd.turbo-stream.html'.
		self renderTurboStreamOn: response stream ]