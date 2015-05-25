tests
testNewDateAndTimeTimezoneString
	| date emailDate |
	date := DateAndTime year: 2008 month: 8 day: 31 hour: 19 minute: 14 second: 24 offset: Duration zero.
	emailDate := RRRfc822DateTime
		newDateAndTime: date
		offset: (Duration days: 0 hours: -2 minutes: 0 seconds: 0).
	self assert: 'Sun, 31 Aug 2008 19:14:24 -0200' = (self render: emailDate)