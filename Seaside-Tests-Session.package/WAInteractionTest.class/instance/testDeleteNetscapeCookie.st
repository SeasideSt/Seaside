tests
testDeleteNetscapeCookie
	| requestCookie responseCookies responseCookie |
	self application preferenceAt: #serverPath put: '/en/private_kunden/wealth_management'.
	requestCookie := WARequestCookie key: 'password' value: 'sex'.
	self requestContextWithUrl: '/' cookies: (Array with: requestCookie).
	self requestContext response deleteCookie: requestCookie.
	
	responseCookies := self requestContext response cookies.
	self assert: responseCookies size = 1.
	responseCookie := responseCookies any.
	
	self assert: (responseCookie isKindOf: WACookie).
	self assert: responseCookie value = ''.
	self assert: responseCookie path = self application url pathStringUnencoded