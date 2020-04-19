callbacks
callback: aBlock
	"Compared to other form elements this input element is disabled then the callback will still be evaluted but with an argument that is false. So either don't assign a callback to disabled checkboxes or make the callback code aware that he might be invoked in a disabled state.
	
	However if you enable a disabled checkbox with JavaScript then the callback is invoked with the correct argument.
	
	http://code.google.com/p/seaside/issues/detail?id=18"

	value := false.
	callback := aBlock.
	super callback: [ value := true ]