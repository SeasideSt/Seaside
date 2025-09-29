processing
process

	self requestContext respond: [ :response |
		response
			doNotCache;
			contentType: WAMimeType applicationJson;
			nextPutAll: (WAJsonCanvas builder render: renderable) ]
