attributes-events
onMouseEnter: anObject
	"A user agent MUST dispatch this event when a pointing device is moved onto the boundaries of an element or one of its descendent elements. This event type is similar to mouseover, but	differs in that it does not bubble, and MUST NOT be dispatched when the pointer device moves from an element onto the boundaries of one of its descendent elements."

	self document scriptGenerator
		event: 'mouseenter'
		do: anObject
		on: self