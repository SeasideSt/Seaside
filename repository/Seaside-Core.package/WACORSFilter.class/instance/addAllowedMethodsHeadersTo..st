headers
addAllowedMethodsHeadersTo: aResponse

	self allowedMethods ifNotEmpty: [:allowed |
		aResponse
			headerAt: 'Access-Control-Allow-Methods'
			put: (', ' join: allowed) ]