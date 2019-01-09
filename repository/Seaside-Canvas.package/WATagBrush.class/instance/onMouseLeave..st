attributes-events
onMouseLeave: anObject
	"A user agent MUST dispatch this event when a pointing device is moved off of the boundaries of an element and all of its descendent elements. This event type is similar to mouseout,	but differs in that does not bubble, and that it MUST NOT be dispatched until the pointing device has left the boundaries of the element and the boundaries of all of its children."

	self document scriptGenerator
		event: 'mouseleave'
		do: anObject
		on: self