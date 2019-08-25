private
verifyBrowserSessionIDFor: requestContext
	| cookie |
	cookie := requestContext request cookieAt: self browserSessionIDCookieKey.
	^ cookie notNil and: [ cookie value = self browserSessionID ]