events-generated
onStop: anObject
	"This event is triggered when dragging stops."

	self optionAt: 'stop' put: anObject asFunction