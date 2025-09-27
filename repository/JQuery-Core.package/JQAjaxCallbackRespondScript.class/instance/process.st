processing
process

	self requestContext respond: [ :response |
		response
			doNotCache; 
			contentType: (WAMimeType textJavascript
				charset: self requestContext handler charSet).
		ajax script: block on: response stream ]
