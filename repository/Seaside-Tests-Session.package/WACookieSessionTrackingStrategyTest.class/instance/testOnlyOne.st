tests
testOnlyOne
	| cookie1 key context |
	cookie1 := WARequestCookie key: strategy keyCookieName value: 'cookie1'.
	context := self requestContext.
	context request setCookies: (Array with: cookie1).
	
	key := strategy keyFromContext: context.
	self assert: key = 'cookie1'