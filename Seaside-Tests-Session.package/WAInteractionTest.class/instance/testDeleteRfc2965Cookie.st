tests
testDeleteRfc2965Cookie
	| requestCookie responseCookies responseCookie |
	requestCookie := (WARequestCookie key: 'password' value: 'sex')
		path: '/en/private_kunden/wealth_management';
		version: 1;
		yourself.
	self requestContextWithUrl: '/' cookies: (Array with: requestCookie).
	self requestContext response deleteCookie: requestCookie.
	
	responseCookies := self requestContext response cookies.
	self assert: responseCookies size = 1.
	responseCookie := responseCookies any.
	
	self assert: (responseCookie isKindOf: WACookie).
	self assert: responseCookie value = ''.
	self assert: responseCookie path = '/en/private_kunden/wealth_management'