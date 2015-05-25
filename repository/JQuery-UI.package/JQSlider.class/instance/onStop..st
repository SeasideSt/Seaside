events-generated
onStop: anObject
	"This event is triggered when the user stops sliding."

	self optionAt: 'stop' put: anObject asFunction