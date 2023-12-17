accessing
at: anInteger put: anObject
	self checkBoundsFor: anInteger.
		
	buffer
		atWrap: (anInteger + offset) \\ buffer size
		put: anObject