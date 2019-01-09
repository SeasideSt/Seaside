attributes-events
onWheel: anObject
	"A user agent MUST dispatch this event when a mouse wheel has been rotated around any axis, or when an equivalent input device (such as a mouse-ball, certain tablets or touchpads, etc.) has emulated such an action. Depending on the platform and input device, diagonal wheel deltas MAY be delivered either as a single wheel event with multiple non-zero axes or as separate wheel events for each non-zero axis. The typical default action of the wheel event type is	to scroll (or in some cases, zoom) the document by the indicated amount. If this event is canceled, the implementation MUST NOT scroll or zoom the document (or perform whatever other implementation-specific default action is associated with this event type)."

	self document scriptGenerator
		event: 'wheel'
		do: anObject
		on: self