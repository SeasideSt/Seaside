responding
responseForLibraries
	context respond: [ :response |
		response contentType: WAMimeType textPlain.
		handler libraries do: [ :each |
			response stream
				nextPutAll: each name;
				crlf ] ]