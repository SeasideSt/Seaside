options-scale
scaleMode: anObject
	"Either 'box' (default, scales the visible area of the element) or 'contents' (scales the complete element, that is parts normally only visible byscrolling are taken into account). You can also precisely control the size the element will become by assigning the originalHeight and originalWidth variables to scaleMode."

	self optionAt: 'scaleMode' put: anObject