tests
testExpireInPast
	| cookie |
	cookie := (WACookie key: 'unit' value: 'testing').
	cookie expireInPast.
	self assert: cookie expiry < DateAndTime now asUTC.
	self assert: cookie expiry >= (DateAndTime year: 1970 day: 1 hour: 0 minute: 0 second: 0) asUTC.
	self assert: cookie maxAge = 0