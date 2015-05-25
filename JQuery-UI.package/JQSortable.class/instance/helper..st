options-generated
helper: aStringOrFunction
	"Allows for a helper element to be used for dragging display. The supplied function receives the event and the element being sorted, and should return a DOMElement to be used as a custom proxy helper. Possible values: 'original', 'clone'"

	self optionAt: 'helper' put: aStringOrFunction