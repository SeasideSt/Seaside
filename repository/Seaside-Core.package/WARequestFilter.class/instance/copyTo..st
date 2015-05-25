copying
copyTo: aRequestHandler
	^ self copy setNext: (self next copyTo: aRequestHandler)