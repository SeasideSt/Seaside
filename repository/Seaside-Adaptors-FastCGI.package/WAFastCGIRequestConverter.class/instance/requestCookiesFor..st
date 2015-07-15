converting-request
requestCookiesFor: aFSResponderRole

	^ WARequestCookie fromString: 
		(aFSResponderRole params 
			at: 'HTTP_COOKIE'
			ifAbsent: [ nil ])