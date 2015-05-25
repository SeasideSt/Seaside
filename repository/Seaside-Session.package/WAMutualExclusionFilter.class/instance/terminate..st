private
terminate: aRequestContext
	mutex terminateOwner.
	aRequestContext respond: [ :response |
		response
			contentType: WAMimeType textPlain;
			nextPutAll: 'Process terminated' ]