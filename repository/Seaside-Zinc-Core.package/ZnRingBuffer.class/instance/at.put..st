accessing
at: anInteger put: anObject
	self checkBoundsFor: anInteger.
		
	buffer
		at: (anInteger + offset) \\ buffer size
		put: anObject