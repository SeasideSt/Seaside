attributes-events
onToggle: anObject
	"Fired at details elements when they open or close."

	self document scriptGenerator
		event: 'toggle'
		do: anObject
		on: self