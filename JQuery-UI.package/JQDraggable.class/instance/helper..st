options-generated
helper: aStringOrFunction
	"Allows for a helper element to be used for dragging display. Possible values: 'original', 'clone', Function. If a function is specified, it must return a DOMElement."

	self optionAt: 'helper' put: aStringOrFunction