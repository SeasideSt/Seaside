converting-request
requestCookiesFor: aNativeRequest
	^ WARequestCookie fromString: aNativeRequest cookie codec: self codec