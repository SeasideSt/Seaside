tests
testOneOfManySlashInCookie
	| cookie1 cookie2 cookie3 cookie4 actual context |
	cookie1 := WARequestCookie key: strategy keyCookieName value: 'cookie1'.
	cookie2 := (WARequestCookie key: strategy keyCookieName value: 'cookie2')
		path: '/';
		yourself.
	cookie3 := (WARequestCookie key: strategy keyCookieName value: 'cookie3')
		path: '/1/2/';
		yourself.
	cookie4 := (WARequestCookie key: strategy keyCookieName value: 'cookie4')
		path: '/1/2/3/';
		yourself.
	context := self requestContext.
	context request setCookies: (Array
			with: cookie1
			with: cookie2
			with: cookie3
			with: cookie4).
	actual := strategy keyFromContext: context.
	self assert: actual = 'cookie3'