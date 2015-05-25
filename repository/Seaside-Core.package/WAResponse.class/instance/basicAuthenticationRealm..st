convenience-status
basicAuthenticationRealm: aString 
	self 
		headerAt: 'WWW-Authenticate'
		put: 'Basic realm="' , aString greaseString , '"'.
	self authenticationFailed