events
hover: anInObject out: anOutObject
	"Bind two handlers to the matched elements, to be executed when the mouse pointer enters and leaves the elements."
	
	self call: 'hover' with: anInObject asFunction with: anOutObject asFunction