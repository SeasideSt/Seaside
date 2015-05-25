events
onHover: anObject
	"Called whenever a Draggable is moved over the Droppable and the Droppable is affected (would accept it). The callback gets 2 parameters, the passenger of the draggable and the percentage of overlapping as defined by the overlap option."

	self optionAt: 'onHover' put: anObject asFunction