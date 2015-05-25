options-generated
appendTo: anElementOrSelector
	"The element passed to or selected by the appendTo option will be used as the draggable helper's container during dragging. By default, the helper is appended to the same container as the draggable."

	self optionAt: 'appendTo' put: anElementOrSelector