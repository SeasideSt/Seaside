attributes-events
onDrop: anObject

	self document scriptGenerator
		event: 'drop'
		do: anObject
		on: self