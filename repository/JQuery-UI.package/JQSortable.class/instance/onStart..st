events-generated
onStart: anObject
	"This event is triggered when sorting starts."

	self optionAt: 'start' put: anObject asFunction