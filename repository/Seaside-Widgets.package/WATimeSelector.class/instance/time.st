accessing
time
	(self privateIsValidSecond: second hourNumber: hour minuteNumber: minute)
		ifFalse: [ self error: 'Invalid time' ].
	^ self timeClass hour: hour minute: minute second: second