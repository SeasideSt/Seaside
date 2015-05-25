events-generated
onStart: anObject
	"This event is triggered when dragging starts."

	self optionAt: 'start' put: anObject asFunction