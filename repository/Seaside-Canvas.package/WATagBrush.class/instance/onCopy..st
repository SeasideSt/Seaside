attributes-events
onCopy: anObject
	"Fired at elements when the user copies data to the clipboard."

	self document scriptGenerator
		event: 'copy'
		do: anObject
		on: self