events-generated
onClose: anObject
	"Allows you to define your own event when the datepicker is closed, whether or not a date is selected. The function receives the selected date as text (' if none) and the datepicker instance as parameters. this refers to the associated input field."

	self optionAt: 'onClose' put: anObject asFunction