handling
addCORSHeadersTo: response

	self addAllowedOriginHeaderTo: response.
	self addAllowedMethodsHeadersTo: response.
	self addExposedHeadersTo: response.
	self addAllowedHeadersTo: response.
	self addMaxAgeHeaderTo: response.
	self addAllowsCredentialsHeaderTo: response