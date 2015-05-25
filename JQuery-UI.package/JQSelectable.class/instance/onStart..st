events-generated
onStart: anObject
	"This event is triggered at the beginning of the select operation."

	self optionAt: 'start' put: anObject asFunction