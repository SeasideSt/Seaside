options-generated
distance: anInteger
	"Tolerance, in pixels, for when resizing should start. If specified, resizing will not start until after mouse is moved beyond distance. This can help prevent unintended resizing when clicking on an element."

	self optionAt: 'distance' put: anInteger