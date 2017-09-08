attributes-events
onDragExit: anObject

	self document scriptGenerator
		event: 'dragexit'
		do: anObject
		on: self