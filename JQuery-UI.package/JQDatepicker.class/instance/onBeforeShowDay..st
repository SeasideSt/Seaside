events-generated
onBeforeShowDay: anObject
	"The function takes a date as a parameter and must return an array with [0] equal to true/false indicating whether or not this date is selectable, [1] equal to a CSS class name(s) or ' for the default presentation, and [2] an optional popup tooltip for this date. It is called for each day in the datepicker before it is displayed."

	self optionAt: 'beforeShowDay' put: anObject asFunction