private
basicConnect: aRequestContext
	session := aRequestContext session.
	response := aRequestContext response.
	response
		doNotCache;
		contentType: aRequestContext application contentType;
		nextPutAll: (self preambleFor: aRequestContext);
		nextPutAll: ((String new: 1024) atAllPut: Character space);
		flush "<- sends partial content"