headers
addCORSHeadersTo: response

	self addAllowedOriginHeadersTo: response.
	self addAllowedMethodsHeadersTo: response