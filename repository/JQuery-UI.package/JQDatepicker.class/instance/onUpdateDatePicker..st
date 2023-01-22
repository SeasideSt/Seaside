events-generated
onUpdateDatePicker: anObject

	"Called when the datepicker widget's DOM is updated. The function receives the datepicker instance as the only parameter. this refers to the associated input field."

	self optionAt: 'onUpdateDatepicker' put: anObject asFunction