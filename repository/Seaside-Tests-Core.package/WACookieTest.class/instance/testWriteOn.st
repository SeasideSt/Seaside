tests
testWriteOn
	| expiry cookie |
	expiry := DateAndTime year: 2007 month: 11 day: 21 hour: 14 minute: 42 second: 48 offset: (Duration days: 0 hours: 2 minutes: 0 seconds: 0).
	cookie := WACookie key: 'ikuser' value: '1234'.
	self assert: cookie oldNetscapeString = 'ikuser=1234'.
	self assert: cookie rfc2109String = 'ikuser="1234"; Version=1'.
	self assert: cookie rfc2965String = 'ikuser="1234"; Version=1'.
	self assert: cookie rfc6265String = 'ikuser=1234'.
	
	cookie expiry: expiry.
	cookie maxAge: 3600.
	self assert: cookie oldNetscapeString = 'ikuser=1234; expires=Wed, 21-Nov-2007 12:42:48 GMT'.
	self assert: cookie rfc2109String = 'ikuser="1234"; Max-Age="3600"; Version=1'.
	self assert: cookie rfc2965String = 'ikuser="1234"; Max-Age="3600"; Version=1'.
	self assert: cookie rfc6265String = 'ikuser=1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; Max-Age=3600'.
	
	cookie path: '/seaside/counter'.
	self assert: cookie oldNetscapeString = 'ikuser=1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; path=/seaside/counter'.
	self assert: cookie rfc2109String = 'ikuser="1234"; Max-Age="3600"; path="/seaside/counter"; Version=1'.
	self assert: cookie rfc2965String = 'ikuser="1234"; Max-Age="3600"; path="/seaside/counter"; Version=1'.
	self assert: cookie rfc6265String = 'ikuser=1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; Max-Age=3600; path=/seaside/counter'.
	
	cookie value: nil.
	self assert: cookie oldNetscapeString = 'ikuser=; expires=Wed, 21-Nov-2007 12:42:48 GMT; path=/seaside/counter'.
	self assert: cookie rfc2109String = 'ikuser=""; Max-Age="3600"; path="/seaside/counter"; Version=1'.
	self assert: cookie rfc2965String = 'ikuser=""; Max-Age="3600"; path="/seaside/counter"; Version=1'.
	self assert: cookie rfc6265String = 'ikuser=; expires=Wed, 21-Nov-2007 12:42:48 GMT; Max-Age=3600; path=/seaside/counter'.
	
	cookie value: '1234'.
	cookie domain: 'www.example.com'.
	cookie ports: (Array with: 80 with: 433).
	self assert: cookie oldNetscapeString = 'ikuser=1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; path=/seaside/counter; domain=www.example.com'.
	self assert: cookie rfc2109String = 'ikuser="1234"; Max-Age="3600"; path="/seaside/counter"; domain="www.example.com"; Version=1'.
	self assert: cookie rfc2965String = 'ikuser="1234"; Max-Age="3600"; path="/seaside/counter"; Port="80,433"; domain="www.example.com"; Version=1'.
	self assert: cookie rfc6265String = 'ikuser=1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; Max-Age=3600; domain=www.example.com; path=/seaside/counter'.
	
	cookie discard: true.
	cookie secure: true.
	cookie httpOnly: true.
	self assert: cookie oldNetscapeString = 'ikuser=1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; path=/seaside/counter; domain=www.example.com; Secure; HttpOnly'.
	self assert: cookie rfc2109String = 'ikuser="1234"; Max-Age="3600"; path="/seaside/counter"; domain="www.example.com"; Secure; HttpOnly; Version=1'.
	self assert: cookie rfc2965String = 'ikuser="1234"; Max-Age="3600"; path="/seaside/counter"; Port="80,433"; domain="www.example.com"; Secure; HttpOnly; Discard; Version=1'.
	self assert: cookie rfc6265String = 'ikuser=1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; Max-Age=3600; domain=www.example.com; path=/seaside/counter; Secure; HttpOnly'.
	
	cookie comment: 'FIS Heer username'.
	cookie commentUrl: 'http://www.example.com/session-cookie.html'.
	self assert: cookie oldNetscapeString = 'ikuser=1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; path=/seaside/counter; domain=www.example.com; Secure; HttpOnly'.
	self assert: cookie rfc2109String = 'ikuser="1234"; Comment="FIS Heer username"; Max-Age="3600"; path="/seaside/counter"; domain="www.example.com"; Secure; HttpOnly; Version=1'.
	self assert: cookie rfc2965String = 'ikuser="1234"; Comment="FIS Heer username"; CommentURL="http://www.example.com/session-cookie.html"; Max-Age="3600"; path="/seaside/counter"; Port="80,433"; domain="www.example.com"; Secure; HttpOnly; Discard; Version=1'.
	self assert: cookie rfc6265String = 'ikuser=1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; Max-Age=3600; domain=www.example.com; path=/seaside/counter; Secure; HttpOnly'