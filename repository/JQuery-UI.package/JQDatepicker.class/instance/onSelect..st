events-generated
onSelect: anObject
	"Allows you to define your own event when the datepicker is selected. The function receives the selected date as text and the datepicker instance as parameters. this refers to the associated input field."

	self optionAt: 'onSelect' put: anObject asFunction