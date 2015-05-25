events-generated
onDrag: anObject
	"This event is triggered when the dialog is dragged."

	self optionAt: 'drag' put: anObject asFunction