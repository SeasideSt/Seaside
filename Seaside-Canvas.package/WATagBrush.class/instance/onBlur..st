attributes-events
onBlur: anObject
	"The onblurs event occurs when the element that is in focus, loses that focus."

	self document scriptGenerator
		event: 'blur'
		do: anObject
		on: self