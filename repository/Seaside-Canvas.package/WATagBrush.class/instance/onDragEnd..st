attributes-events
onDragEnd: anObject

	self document scriptGenerator
		event: 'dragend'
		do: anObject
		on: self