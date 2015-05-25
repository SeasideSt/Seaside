tests
testEquals
	| cookie1 cookie2 |
	cookie1 := WARequestCookie key: 'JSESSIONID' value: '8543783483494373483764'.
	cookie2 := WARequestCookie key: 'JSESSIONID' value: '8543783483494373483767'.
	
	self assert: cookie1 = cookie2.
	self assert: cookie2 = cookie1.
	self assert: cookie1 hash = cookie2 hash.
	
	cookie2 domain: 'www.example.com'.
	self deny: cookie1 = cookie2.
	self deny: cookie2 = cookie1.
	self deny: cookie1 hash = cookie2 hash.

	cookie1 domain: 'www.example.com'.
	self assert: cookie1 = cookie2.
	self assert: cookie2 = cookie1.
	self assert: cookie1 hash = cookie2 hash.
	
	cookie1 path: '/cgi-bin/index.cbl'.
	self deny: cookie1 = cookie2.
	self deny: cookie2 = cookie1.
	self deny: cookie1 hash = cookie2 hash.
	
	cookie2 path: '/cgi-bin/index.cbl'.
	self assert: cookie1 = cookie2.
	self assert: cookie2 = cookie1.
	self assert: cookie1 hash = cookie2 hash.
	
	cookie1 ports: #(8080).
	self assert: cookie1 = cookie2.
	self assert: cookie2 = cookie1.
	self assert: cookie1 hash = cookie2 hash.
	
	cookie2 ports: #(9090).
	self assert: cookie1 = cookie2.
	self assert: cookie2 = cookie1.
	self assert: cookie1 hash = cookie2 hash