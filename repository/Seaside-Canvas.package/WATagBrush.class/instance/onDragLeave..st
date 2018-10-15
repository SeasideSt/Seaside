attributes-events
onDragLeave: anObject

	self document scriptGenerator
		event: 'dragleave'
		do: anObject
		on: self