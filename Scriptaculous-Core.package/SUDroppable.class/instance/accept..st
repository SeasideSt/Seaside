options
accept: aStringOrArray
	"Set accept to a string or an array of strings describing CSS classes. The Droppable will only accept Draggables that have one or more of these CSS classes."

	self optionAt: 'accept' put: aStringOrArray