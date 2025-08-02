handling
addCORSHeadersTo: response

	self addAllowedOriginHeadersTo: response.
	self addAllowedMethodsHeadersTo: response.
	self addExposedHeadersTo: response.
	self addAllowedHeadersTo: response.
	self addMaxAgeHeaderTo: response.
	self addAllowsCredentialsHeaderTo: response