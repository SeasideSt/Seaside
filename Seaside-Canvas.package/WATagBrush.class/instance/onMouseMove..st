attributes-events
onMouseMove: anObject
	"The onmousemove event occurs when the pointing device is moved while it is over an element."

	self document scriptGenerator
		event: 'mousemove'
		do: anObject
		on: self