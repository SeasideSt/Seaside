tests
testWriteOn
	| expiry cookie |
	expiry := DateAndTime year: 2007 month: 11 day: 21 hour: 14 minute: 42 second: 48 offset: (Duration days: 0 hours: 2 minutes: 0 seconds: 0).
	cookie := WACookie key: 'ikuser' value: '1234'.
	self assert: cookie oldNetscapeString = 'ikuser=1234'.
	self assert: cookie rfc2109String = 'ikuser="1234"; Version=1'.
	self assert: cookie rfc2965String = 'ikuser="1234"; Version=1'.
	
	cookie expiry: expiry.
	cookie maxAge: 3600.
	self assert: cookie oldNetscapeString = 'ikuser=1234; expires=Wed, 21-Nov-2007 12:42:48 GMT'.
	self assert: cookie rfc2109String = 'ikuser="1234"; Max-Age="3600"; Version=1'.
	self assert: cookie rfc2965String = 'ikuser="1234"; Max-Age="3600"; Version=1'.
	
	" #('C3' 'A4' 'C3' 'BC')"
	cookie path: '/seaside/', (String with: (Character codePoint: 228) with: (Character codePoint: 252)).
	self assert: cookie oldNetscapeString = 'ikuser=1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; path=/seaside/%C3%A4%C3%BC'.
	self assert: cookie rfc2109String = 'ikuser="1234"; Max-Age="3600"; path="/seaside/%C3%A4%C3%BC"; Version=1'.
	self assert: cookie rfc2965String = 'ikuser="1234"; Max-Age="3600"; path="/seaside/%C3%A4%C3%BC"; Version=1'.
	
	cookie value: nil.
	self assert: cookie oldNetscapeString = 'ikuser=; expires=Wed, 21-Nov-2007 12:42:48 GMT; path=/seaside/%C3%A4%C3%BC'.
	self assert: cookie rfc2109String = 'ikuser=""; Max-Age="3600"; path="/seaside/%C3%A4%C3%BC"; Version=1'.
	self assert: cookie rfc2965String = 'ikuser=""; Max-Age="3600"; path="/seaside/%C3%A4%C3%BC"; Version=1'.
	
	cookie value: '1234'.
	cookie domain: 'www.example.com'.
	cookie ports: (Array with: 80 with: 433).
	self assert: cookie oldNetscapeString = 'ikuser=1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; path=/seaside/%C3%A4%C3%BC; domain=www.example.com'.
	self assert: cookie rfc2109String = 'ikuser="1234"; Max-Age="3600"; path="/seaside/%C3%A4%C3%BC"; domain="www.example.com"; Version=1'.
	self assert: cookie rfc2965String = 'ikuser="1234"; Max-Age="3600"; path="/seaside/%C3%A4%C3%BC"; Port="80,433"; domain="www.example.com"; Version=1'.
	
	cookie discard: true.
	cookie secure: true.
	cookie httpOnly: true.
	self assert: cookie oldNetscapeString = 'ikuser=1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; path=/seaside/%C3%A4%C3%BC; domain=www.example.com; Secure; HttpOnly'.
	self assert: cookie rfc2109String = 'ikuser="1234"; Max-Age="3600"; path="/seaside/%C3%A4%C3%BC"; domain="www.example.com"; Secure; HttpOnly; Version=1'.
	self assert: cookie rfc2965String = 'ikuser="1234"; Max-Age="3600"; path="/seaside/%C3%A4%C3%BC"; Port="80,433"; domain="www.example.com"; Secure; HttpOnly; Discard; Version=1'.
	
	cookie comment: 'FIS Heer username'.
	cookie commentUrl: 'http://www.example.com/session-cookie.html'.
	self assert: cookie oldNetscapeString = 'ikuser=1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; path=/seaside/%C3%A4%C3%BC; domain=www.example.com; Secure; HttpOnly'.
	self assert: cookie rfc2109String = 'ikuser="1234"; Comment="FIS Heer username"; Max-Age="3600"; path="/seaside/%C3%A4%C3%BC"; domain="www.example.com"; Secure; HttpOnly; Version=1'.
	self assert: cookie rfc2965String = 'ikuser="1234"; Comment="FIS Heer username"; CommentURL="http://www.example.com/session-cookie.html"; Max-Age="3600"; path="/seaside/%C3%A4%C3%BC"; Port="80,433"; domain="www.example.com"; Secure; HttpOnly; Discard; Version=1'