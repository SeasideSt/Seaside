tests
testAddCookieOneAlreadyPresent
	| context cookie1 |
	cookie1 := WARequestCookie key: strategy keyCookieName value: 'The_Metaphor'.
	context := self requestContext.
	context request setCookies: (Array with: cookie1).
	
	strategy addKey: 'The_Metaphor' toContext: context.
	self assertNoCookies: context