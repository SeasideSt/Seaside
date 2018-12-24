attributes-events
onResize: anObject
	"The resize event occurs when a document view is resized."

	self document scriptGenerator
		event: 'resize'
		do: anObject
		on: self