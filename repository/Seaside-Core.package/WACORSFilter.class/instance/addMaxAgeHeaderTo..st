handling
addMaxAgeHeaderTo: aResponse

	maxAge ifNotNil: [
		aResponse
			headerAt: 'Access-Control-Max-Age'
			put: maxAge greaseString ]