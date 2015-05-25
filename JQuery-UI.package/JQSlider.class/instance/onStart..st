events-generated
onStart: anObject
	"This event is triggered when the user starts sliding."

	self optionAt: 'start' put: anObject asFunction