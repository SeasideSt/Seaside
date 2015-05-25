events-generated
onChange: anObject
	"This event is triggered during sorting, but only when the DOM position has changed."

	self optionAt: 'change' put: anObject asFunction