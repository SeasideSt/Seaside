tests
testNewDateAndTimeUtc
	| date emailDate |
	date := DateAndTime year: 2008 month: 8 day: 31 hour: 19 minute: 14 second: 24 offset: (Duration days: 0 hours: 2 minutes: 0 seconds: 0).
	emailDate := RRRfc822DateTime newUtc: date.
	self assert: 'Sun, 31 Aug 2008 17:14:24 UT' = (self render: emailDate)