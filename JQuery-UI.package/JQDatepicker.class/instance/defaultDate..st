options-generated
defaultDate: aDateOrNumberOrString
	"Set the date to highlight on first opening if the field is blank. Specify either an actual date via a Date object, or a number of days from today (e.g. +7) or a string of values and periods ('y' for years, 'm' for months, 'w' for weeks, 'd' for days, e.g. '+1m +7d'), or null for today."

	self optionAt: 'defaultDate' put: aDateOrNumberOrString