tests
testExpirePrinting
	| cookie |
	cookie := WACookie key: 'foo' value: 'bar'.
	cookie expiry: (DateAndTime year: 2003 day: 4 hour: 5 minute: 6 second: 7 offset: Duration zero).
	self assert: cookie oldNetscapeString = 'foo=bar; expires=Sat, 04-Jan-2003 05:06:07 GMT'