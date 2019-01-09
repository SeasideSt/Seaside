attributes-events
onDrag: anObject

	self document scriptGenerator
		event: 'drag'
		do: anObject
		on: self