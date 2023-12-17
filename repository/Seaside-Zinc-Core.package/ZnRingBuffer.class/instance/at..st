accessing
at: anInteger
	self checkBoundsFor: anInteger.

	^ buffer at: (anInteger + offset) \\ buffer size