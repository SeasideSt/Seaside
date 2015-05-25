attributes-events
onClick: anObject
	"The onclick event occurs when the pointing device button is clicked over an element."

	self document scriptGenerator
		event: 'click'
		do: anObject
		on: self