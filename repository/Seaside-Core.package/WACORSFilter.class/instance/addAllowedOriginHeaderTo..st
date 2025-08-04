handling
addAllowedOriginHeaderTo: aResponse

	allowedOrigin ifNotNil: [
		aResponse headerAt: 'Access-Control-Allow-Origin' put: allowedOrigin.
		allowedOrigin = '*' ifFalse: [ 
			aResponse headerAt: 'Vary' put: 'Origin' ] ]