attributes-events
onSuspend: anObject
	"The user agent is intentionally not currently fetching media data."

	self document scriptGenerator
		event: 'suspend'
		do: anObject
		on: self