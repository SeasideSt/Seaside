accessing
date
	(self privateIsValidDay: day monthNumber: month year: year)
		ifFalse: [ self error: 'Invalid date' ].
	^ self dateClass year: year month: month day: day