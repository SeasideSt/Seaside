utilities
requestContextWithUrl: aUrlOrString cookies: aCollection
	| handlers |
	handlers := self requestContext handlers.
	self requestContext
		initializeWithRequest: 
			((WARequest method: 'GET' uri: aUrlOrString)
				setCookies: aCollection asArray;
				yourself)
		response: WABufferedResponse new
		codec: self createCodec.
	self requestContext handlers addAll: handlers