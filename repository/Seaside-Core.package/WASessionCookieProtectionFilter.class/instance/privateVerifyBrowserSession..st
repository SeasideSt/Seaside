private
privateVerifyBrowserSession: requestContext
	| cookie |
	cookie := requestContext request cookieAt: self class browserSessionIDCookieKey.
	^ cookie notNil and: [ cookie value = self browserSessionID ]