*seaside-tests-adaptors-comanche
testWriteOnWithoutKey
	| expiry cookie |
	expiry := DateAndTime year: 2007 month: 11 day: 21 hour: 14 minute: 42 second: 48 offset: (Duration days: 0 hours: 2 minutes: 0 seconds: 0).
	cookie := WACookie key: 'ikuser' value: '1234'.
	
	cookie expiry: expiry.
	cookie maxAge: 3600.
	self assert: cookie oldNetscapeStringWithoutKey = '1234; expires=Wed, 21-Nov-2007 12:42:48 GMT'.
	self assert: cookie rfc6265StringWithoutKey = '1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; Max-Age=3600'.
	
	cookie path: '/seaside/counter'.
	self assert: cookie oldNetscapeStringWithoutKey = '1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; path=/seaside/counter'.
	self assert: cookie rfc6265StringWithoutKey = '1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; Max-Age=3600; path=/seaside/counter'.
	
	cookie value: nil.
	self assert: cookie oldNetscapeStringWithoutKey = '; expires=Wed, 21-Nov-2007 12:42:48 GMT; path=/seaside/counter'.
	self assert: cookie rfc6265StringWithoutKey = '; expires=Wed, 21-Nov-2007 12:42:48 GMT; Max-Age=3600; path=/seaside/counter'.
	
	cookie value: '1234'.
	cookie domain: 'www.example.com'.
	cookie ports: (Array with: 80 with: 433).
	self assert: cookie oldNetscapeStringWithoutKey = '1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; path=/seaside/counter; domain=www.example.com'.
	self assert: cookie rfc6265StringWithoutKey = '1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; Max-Age=3600; domain=www.example.com; path=/seaside/counter'.
	
	cookie discard: true.
	cookie secure: true.
	cookie httpOnly: true.
	self assert: cookie oldNetscapeStringWithoutKey = '1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; path=/seaside/counter; domain=www.example.com; Secure; HttpOnly'.
	self assert: cookie rfc6265StringWithoutKey = '1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; Max-Age=3600; domain=www.example.com; path=/seaside/counter; Secure; HttpOnly'.
	
	cookie comment: 'FIS Heer username'.
	cookie commentUrl: 'http://www.example.com/session-cookie.html'.
	self assert: cookie oldNetscapeStringWithoutKey = '1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; path=/seaside/counter; domain=www.example.com; Secure; HttpOnly'.
	self assert: cookie rfc6265StringWithoutKey = '1234; expires=Wed, 21-Nov-2007 12:42:48 GMT; Max-Age=3600; domain=www.example.com; path=/seaside/counter; Secure; HttpOnly'