options-generated
accept: aSelectorOrFunction
	"All draggables that match the selector will be accepted. If a function is specified, the function will be called for each draggable on the page (passed as the first argument to the function), to provide a custom filter. The function should return true if the draggable should be accepted."

	self optionAt: 'accept' put: aSelectorOrFunction