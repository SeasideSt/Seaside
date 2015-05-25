events-generated
onOver: anObject
	"This event is triggered as an accepted draggable is dragged 'over' (within the tolerance of) this droppable."

	self optionAt: 'over' put: anObject asFunction