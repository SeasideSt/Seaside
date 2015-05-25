events-generated
onStart: anObject
	"This event is triggered at the start of a resize operation."

	self optionAt: 'start' put: anObject asFunction