events-generated
onStop: anObject
	"This event is triggered when sorting has stopped."

	self optionAt: 'stop' put: anObject asFunction