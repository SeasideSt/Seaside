tests
testAddKeyOfSessionToUrlCookieAlreadyPresent
	| context uri cookie1 |
	context := self requestContext.
	cookie1 := WARequestCookie key: strategy keyCookieName value: 'The_Metaphor'.
	context request setCookies: (Array with: cookie1).
	uri := context request uri copy.
	strategy addKey: 'The_Metaphor' toUrl: uri.
	self assert: uri greaseString = '/1/2'