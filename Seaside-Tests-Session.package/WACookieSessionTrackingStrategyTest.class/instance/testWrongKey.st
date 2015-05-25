tests
testWrongKey
	| cookie context actual |
	cookie := WARequestCookie key: (strategy keyCookieName, '-not') value: 'cookie'.
	context := self requestContext.
	context request setCookies: (Array with: cookie).
	actual := strategy keyFromContext: context.
	self assert: actual isNil