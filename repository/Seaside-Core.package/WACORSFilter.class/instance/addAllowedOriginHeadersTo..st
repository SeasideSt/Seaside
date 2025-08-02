handling
addAllowedOriginHeadersTo: aResponse

	self allowedOrigins ifNotEmpty: [ :allowed | 
		| allowedOrigin |
		allowedOrigin := allowed first.
		aResponse headerAt: 'Access-Control-Allow-Origin' put: allowedOrigin.
		allowedOrigin = '*' ifFalse: [ 
			aResponse headerAt: 'Vary' put: 'Origin' ] ]