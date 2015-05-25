options-generated
calculateWeek: aFunction
	"A function to calculate the week of the year for a given date. The default implementation uses the ISO 8601 definition: weeks start on a Monday; the first week of the year contains the first Thursday of the year."

	self optionAt: 'calculateWeek' put: aFunction