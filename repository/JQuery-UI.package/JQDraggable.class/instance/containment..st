options-generated
containment: aSelectorOrElementOrStringOrArray
	"Constrains dragging to within the bounds of the specified element or region. Possible string values: 'parent', 'document', 'window', [x1, y1, x2, y2]."

	self optionAt: 'containment' put: aSelectorOrElementOrStringOrArray