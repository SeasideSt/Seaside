attributes-events
onFocus: anObject
	"The onfocus event occurs when an element receives focus either by the pointing device or by tabbing navigation."

	self document scriptGenerator
		event: 'focus'
		do: anObject
		on: self