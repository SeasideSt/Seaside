tests
testCombine
	| expiry actual cookie1 cookie2 |
	expiry := DateAndTime year: 2007 month: 11 day: 21 hour: 14 minute: 42 second: 48 offset: (Duration days: 0 hours: 2 minutes: 0 seconds: 0).
	cookie1 := WACookie key: 'ikuser' value: '1234'.
	cookie1 expiry: expiry.

	cookie2 := WACookie key: 'JSESSIONID' value: '8543783483494373483764'.
	
	actual := WACookie
		combine: (Array with: cookie1 with: cookie2)
		using: [ :each | each oldNetscapeString ].

	self assert: actual = 'ikuser=1234; expires=Wed, 21-Nov-2007 12:42:48 GMT, JSESSIONID=8543783483494373483764'