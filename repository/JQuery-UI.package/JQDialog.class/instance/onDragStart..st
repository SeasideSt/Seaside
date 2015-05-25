events-generated
onDragStart: anObject
	"This event is triggered at the beginning of the dialog being dragged."

	self optionAt: 'dragStart' put: anObject asFunction