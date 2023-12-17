accessing
at: anInteger
	self checkBoundsFor: anInteger.
	
	^ buffer atWrap: anInteger + offset