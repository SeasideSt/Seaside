Class {
	#name : #WACookieTest,
	#superclass : #WAContextTest,
	#category : 'Seaside-Tests-Core-HTTP'
}

{ #category : #tests }
WACookieTest >> testCombine [
	| expiry actual cookie1 cookie2 |
	expiry := DateAndTime year: 2007 month: 11 day: 21 hour: 14 minute: 42 second: 48 offset: (Duration days: 0 hours: 2 minutes: 0 seconds: 0).
	cookie1 := WACookie key: 'ikuser' value: '1234'.
	cookie1 expiry: expiry.

	cookie2 := WACookie key: 'JSESSIONID' value: '8543783483494373483764'.
	
	actual := WACookie
		combine: (Array with: cookie1 with: cookie2)
		using: [ :each | each rfc6265String ].

	self assert: actual = 'ikuser=1234; expires=Wed, 21-Nov-2007 12:42:48 GMT, JSESSIONID=8543783483494373483764'
]

{ #category : #tests }
WACookieTest >> testCopy [
	| original copy |
	original := (WACookie key: 'meta' value: 'phor')
		ports: #(80) asOrderedCollection;
		yourself.
		
	copy := original copy.
	copy ports at: 1 put: 443.
		
	self assert: original ports size = 1.
	self assert: original ports first = 80.
	
	self assert: copy ports size = 1.
	self assert: copy ports first = 443
]

{ #category : #tests }
WACookieTest >> testEquals [
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
]

{ #category : #tests }
WACookieTest >> testExpireInPast [
	| cookie |
	cookie := (WACookie key: 'unit' value: 'testing').
	cookie expireInPast.
	self assert: cookie expiry < DateAndTime now asUTC.
	self assert: cookie expiry >= (DateAndTime year: 1970 day: 1 hour: 0 minute: 0 second: 0) asUTC.
	self assert: cookie maxAge = 0
]

{ #category : #tests }
WACookieTest >> testExpirePrinting [
	| cookie |
	cookie := WACookie key: 'foo' value: 'bar'.
	cookie expiry: (DateAndTime year: 2003 day: 4 hour: 5 minute: 6 second: 7 offset: Duration zero).
	self assert: cookie rfc6265String = 'foo=bar; expires=Sat, 04-Jan-2003 05:06:07 GMT'
]

{ #category : #tests }
WACookieTest >> testFromStringOldNetscape [
	| cookies customer partNumber shipping |
	cookies := WACookie fromString: 'Customer=WILE_E_COYOTE;
                 Part_Number=Rocket_Launcher_0001;
                 Shipping=FedEx' codec: GRNullCodec new.
	self assert: cookies size = 3.
	
	customer := cookies detect: [ :each | each key = 'Customer' ].
	self assert: customer value = 'WILE_E_COYOTE'.
	
	partNumber := cookies detect: [ :each | each key = 'Part_Number' ].
	self assert: partNumber value = 'Rocket_Launcher_0001'.
	
	shipping := cookies detect: [ :each | each key = 'Shipping' ].
	self assert: shipping value = 'FedEx'
]

{ #category : #tests }
WACookieTest >> testFromStringRfc2965 [
	| cookies customer partNumber shipping |
	cookies := WARequestCookie fromString: '$Version="1";
                 Customer="WILE_E_COYOTE"; $Path="/acme"; $Port="1"; $Domain="www.1.com";
                 Part_Number="Rocket_Launcher_0001"; $Path="/acme/rockes"; $Port="2,3"; $Domain="www.2.com";
                 Shipping="FedEx"' codec: GRNullCodec new.
	self assert: cookies size = 3.
	
	customer := cookies detect: [ :each | each key = 'Customer' ].
	self assert: customer version = 1.
	self assert: customer value = 'WILE_E_COYOTE'.
	self assert: customer path = '/acme'.
	self assert: customer domain = 'www.1.com'.
	self assert: customer ports size = 1.
	self assert: customer ports first = 1.
	
	partNumber := cookies detect: [ :each | each key = 'Part_Number' ].
	self assert: partNumber version = 1.
	self assert: partNumber value = 'Rocket_Launcher_0001'.
	self assert: partNumber path = '/acme/rockes'.
	self assert: partNumber domain = 'www.2.com'.
	self assert: partNumber ports size = 2.
	self assert: partNumber ports first = 2.
	self assert: partNumber ports second = 3.
	
	shipping := cookies detect: [ :each | each key = 'Shipping' ].
	self assert: shipping version = 1.
	self assert: shipping value = 'FedEx'.
	self assert: shipping path = '/'.
	self assert: shipping domain isNil.
	self assert: shipping ports isNil
]

{ #category : #tests }
WACookieTest >> testPathEncoding [
	| cookies cookie |
	cookies := WARequestCookie fromString: '$Version="1";
                 Customer="WILE_E_COYOTE"; $Path="/%20"' codec: GRNullCodec new.
	self assert: cookies size = 1.
	cookie := cookies first.
	self assert: cookie path = '/ '.
	self assert: cookie pathUnencoded = '/ '.
	self assert: cookie pathEncoded = '/%20'
]

{ #category : #tests }
WACookieTest >> testWriteOn [
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
]
