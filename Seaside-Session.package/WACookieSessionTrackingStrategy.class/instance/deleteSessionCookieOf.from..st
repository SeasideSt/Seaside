private
deleteSessionCookieOf: anApplication from: aRequestContext
	| cookie baseUrl |
	cookie := self cookieFromContext: aRequestContext ifAbsent: [ ^ self ].
	baseUrl := anApplication url.
	aRequestContext response 
		deleteCookie: cookie
		path:  baseUrl pathStringUnencoded
		domain: baseUrl host