headers
addExposedHeadersTo: aResponse

	self exposedHeaders ifNotEmpty: [ :exposed | 
		aResponse
			headerAt: 'Access-Control-Expose-Headers'
			put: (', ' join: exposed) ]