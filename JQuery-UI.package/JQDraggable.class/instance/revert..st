options-generated
revert: aBooleanOrString
	"If set to true, the element will return to its start position when dragging stops. Possible string values: 'valid', 'invalid'. If set to invalid, revert will only occur if the draggable has not been dropped on a droppable. For valid, it's the other way around."

	self optionAt: 'revert' put: aBooleanOrString