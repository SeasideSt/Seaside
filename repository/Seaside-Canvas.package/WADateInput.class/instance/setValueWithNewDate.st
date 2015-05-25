private callbacks
setValueWithNewDate
	^ value := Date
		newDay: ((day min: (Date daysInMonth: (Date nameOfMonth: month) forYear: year)) max: 1)
		month: (Date nameOfMonth: month)
		year: year