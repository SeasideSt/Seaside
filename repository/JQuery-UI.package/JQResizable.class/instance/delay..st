options-generated
delay: anInteger
	"Tolerance, in milliseconds, for when resizing should start. If specified, resizing will not start until after mouse is moved beyond duration. This can help prevent unintended resizing when clicking on an element."

	self optionAt: 'delay' put: anInteger