options-generated
cursorAt: anObject
	"Moves the sorting element or helper so the cursor always appears to drag from the same position. Coordinates can be given as a hash using a combination of one or two keys: { top, left, right, bottom }."

	self optionAt: 'cursorAt' put: anObject