events-generated
onOut: anObject
	"This event is triggered when an accepted draggable is dragged out (within the tolerance of) this droppable."

	self optionAt: 'out' put: anObject asFunction