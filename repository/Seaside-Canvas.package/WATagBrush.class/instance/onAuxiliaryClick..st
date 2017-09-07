attributes-events
onAuxiliaryClick: anObject
	"The auxclick event type MUST be dispatched on the topmost	event target indicated by the pointer, when the user presses down and releases the non-primary pointer button, or otherwise activates the pointer in a manner that simulates such an action. The actuation method of the mouse button depends upon the pointer device and the environment configuration, e.g., it MAY depend on the screen location or the delay between the press and release of the pointing device button."

	self document scriptGenerator
		event: 'auxclick'
		do: anObject
		on: self