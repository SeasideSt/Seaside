tests
testDateAndTime
	self assert: (DateAndTime year: 1980 month: 6 day: 11 hour: 12 minute: 45 second: 23) equals: 'new Date(1980,5,11,12,45,23)'.
	self assert: (Date year: 1980 month: 6 day: 11) equals: 'new Date(1980,5,11)'