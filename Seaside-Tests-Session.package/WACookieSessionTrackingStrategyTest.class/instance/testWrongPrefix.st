tests
testWrongPrefix
	| cookie1 cookie2 actual context |
	cookie1 := WARequestCookie key: strategy keyCookieName value: 'cookie1'.
	cookie2 := (WARequestCookie key: strategy keyCookieName value: 'cookie2')
		path: '/one';
		yourself.

	context := self requestContext.
	context request setCookies: (Array
			with: cookie1
			with: cookie2).
	actual := strategy keyFromContext: context.
	self assert: actual = 'cookie1'