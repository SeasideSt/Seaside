attributes-events
onCancel: anObject
	"Fired at dialog elements when they are canceled by the user (e.g. by pressing the Escape key)"

	self document scriptGenerator
		event: 'cancel'
		do: anObject
		on: self