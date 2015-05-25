initialization
initialize
	super initialize.
	self urlencoded: 'urlencoded'.
	self multipart: 'multipart'.
	self get: 'get'