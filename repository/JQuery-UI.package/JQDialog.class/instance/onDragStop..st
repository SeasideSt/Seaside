events-generated
onDragStop: anObject
	"This event is triggered after the dialog has been dragged."

	self optionAt: 'dragStop' put: anObject asFunction