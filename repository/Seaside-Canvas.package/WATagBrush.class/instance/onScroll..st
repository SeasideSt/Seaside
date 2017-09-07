attributes-events
onScroll: anObject
	"The scroll event occurs when a document view is scrolled."

	self document scriptGenerator
		event: 'scroll'
		do: anObject
		on: self