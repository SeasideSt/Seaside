attributes-events
onPaste: anObject

	self document scriptGenerator
		event: 'paste'
		do: anObject
		on: self