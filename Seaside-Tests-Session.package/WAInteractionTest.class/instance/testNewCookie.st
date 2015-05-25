tests
testNewCookie
	| cookie |
	cookie := self requestContext newCookie.
	self assert: cookie path = self application url pathStringUnencoded.
	self assert: cookie ports isNil.
	self assert: cookie httpOnly.
	self deny: cookie secure.
	self assert: cookie domain isNil.
	
	self application preferenceAt: #serverPath put: '/en/private_kunden/wealth_management'.
	cookie := self requestContext newCookie.
	self assert: cookie path = '/en/private_kunden/wealth_management'.
	self assert: cookie ports isNil.
	self assert: cookie httpOnly.
	self deny: cookie secure.
	self assert: cookie domain isNil.
	
	self application preferenceAt: #serverPort put: 8080.
	self application preferenceAt: #serverProtocol put: 'https'.
	self application preferenceAt: #serverHostname put: 'www.lgt.com'.
	cookie := self requestContext newCookie.
	self assert: cookie path = '/en/private_kunden/wealth_management'.
	self deny: cookie ports isNil.
	self assert: cookie ports size = 1.
	self assert: cookie ports first = 8080.
	self assert: cookie httpOnly.
	self assert: cookie secure.
	self assert: cookie domain = 'www.lgt.com'