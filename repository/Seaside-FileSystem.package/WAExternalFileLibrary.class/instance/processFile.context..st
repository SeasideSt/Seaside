handling
processFile: aFilename context: aRequestContext
	aRequestContext respond: [ :response |
		response
			contentType: (self mimetypeForRequest: aRequestContext request);
			binary;
			nextPutAll: (self contentsOfFile: aFilename) ]