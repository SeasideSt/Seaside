events-generated
onDrop: anObject
	"This event is triggered when an accepted draggable is dropped 'over' (within the tolerance of) this droppable. In the callback, $(this) represents the droppable the draggable is dropped on. ui.draggable represents the draggable."

	self optionAt: 'drop' put: anObject asFunction