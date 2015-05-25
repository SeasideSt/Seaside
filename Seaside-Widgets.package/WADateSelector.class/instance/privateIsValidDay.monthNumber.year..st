private
privateIsValidDay: theDay monthNumber: theMonth year: theYear
	| daysInMonth |
	(theMonth between: 1 and: 12)
		ifFalse: [ ^ false ].
	daysInMonth := Date daysInMonth: (Date nameOfMonth: theMonth) forYear: theYear.
	^ theDay between: 1 and: daysInMonth