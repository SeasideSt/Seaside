attributes-events
onDragStart: anObject

	self document scriptGenerator
		event: 'dragstart'
		do: anObject
		on: self