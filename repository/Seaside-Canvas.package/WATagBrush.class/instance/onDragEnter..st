attributes-events
onDragEnter: anObject

	self document scriptGenerator
		event: 'dragenter'
		do: anObject
		on: self