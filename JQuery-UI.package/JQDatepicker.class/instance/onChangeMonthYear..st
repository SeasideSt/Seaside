events-generated
onChangeMonthYear: anObject
	"Allows you to define your own event when the datepicker moves to a new month and/or year. The function receives the selected year, month (1-12), and the datepicker instance as parameters. this refers to the associated input field."

	self optionAt: 'onChangeMonthYear' put: anObject asFunction