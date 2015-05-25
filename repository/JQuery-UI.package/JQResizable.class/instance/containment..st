options-generated
containment: aStringOrElementOrSelector
	"Constrains resizing to within the bounds of the specified element. Possible values: 'parent', 'document', a DOMElement, or a Selector."

	self optionAt: 'containment' put: aStringOrElementOrSelector