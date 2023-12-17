accessing
at: anInteger put: anObject
	self checkBoundsFor: anInteger.
		
	buffer
		atWrap: anInteger + offset
		put: anObject