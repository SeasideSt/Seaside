attributes-events
onUnload: anObject
	"The onunload event occurs when the user agent removes a document from a window."

	self document scriptGenerator
		event: 'unload'
		do: anObject
		on: self