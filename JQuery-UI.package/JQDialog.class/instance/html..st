callbacks
html: aBlock
	"Conveniance method that takes a block that is used to render the contents of the window when being opened."

	self autoOpen: false.
	self onOpen: (self owner copy load
		html: aBlock)