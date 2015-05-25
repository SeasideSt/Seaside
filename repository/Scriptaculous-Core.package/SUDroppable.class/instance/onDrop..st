events
onDrop: anObject
	"Called whenever a Draggable is released over the Droppable and the Droppable is accepts it."

	self optionAt: 'onDrop' put: anObject asFunction