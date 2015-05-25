events-generated
onStop: anObject
	"This event is triggered at the end of the select operation."

	self optionAt: 'stop' put: anObject asFunction