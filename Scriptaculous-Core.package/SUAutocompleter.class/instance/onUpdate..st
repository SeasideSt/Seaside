events
onUpdate: anObject
	"Hook for a custom function called after the element has been updated. This function is called instead of the built-in function that adds the list item text to the input field. The function receives one parameter only, the selected item."

	self optionAt: 'updateElement' put: anObject asFunction