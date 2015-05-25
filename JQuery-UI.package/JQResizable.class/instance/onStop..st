events-generated
onStop: anObject
	"This event is triggered at the end of a resize operation."

	self optionAt: 'stop' put: anObject asFunction