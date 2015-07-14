responding
responseForLibrary: aLibrary
	context respond: [ :response |
		response contentType: WAMimeType textPlain.
		aLibrary fileSelectors do: [ :each |
			response stream
				nextPutAll: (aLibrary asFilename: each);
				crlf ] ]