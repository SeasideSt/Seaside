tests
testNewDateAndTime
	| date emailDate |
	date := DateAndTime year: 2008 month: 8 day: 1 hour: 9 minute: 4 second: 4 offset: (Duration days: 0 hours: 2 minutes: 0 seconds: 0).
	emailDate := RRRfc822DateTime newDateAndTime: date.
	self assert: 'Fri, 01 Aug 2008 09:04:04 +0200' = (self render: emailDate)