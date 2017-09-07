attributes-events
onClose: anObject
	"Fired at dialog elements when they are closed, and at WebSocket elements when the connection is terminated."

	self document scriptGenerator
		event: 'close'
		do: anObject
		on: self