converting
requestFor: aSocketStream
	^ super requestFor: (HttpRequest readFromStream: aSocketStream)