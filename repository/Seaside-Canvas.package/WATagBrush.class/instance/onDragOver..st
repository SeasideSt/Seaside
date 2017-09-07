attributes-events
onDragOver: anObject

	self document scriptGenerator
		event: 'dragover'
		do: anObject
		on: self