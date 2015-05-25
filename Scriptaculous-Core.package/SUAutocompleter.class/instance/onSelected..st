events
onSelected: anObject
	"Hook for a custom function called after the element has been updated. This function is called after the built-in function that adds the list item text to the input field. The function receives two parameters, the autocompletion input field and the selected item."

	self optionAt: 'afterUpdateElement' put: anObject asFunction