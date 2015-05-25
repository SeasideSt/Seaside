events-generated
onDrag: anObject
	"This event is triggered when the mouse is moved during the dragging."

	self optionAt: 'drag' put: anObject asFunction