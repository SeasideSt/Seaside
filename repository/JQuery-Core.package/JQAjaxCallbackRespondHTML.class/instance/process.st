processing
process

	self requestContext respond: [ :response |
		response
			doNotCache;
			contentType: self application contentType.
		ajax render: renderable on: response stream ]
