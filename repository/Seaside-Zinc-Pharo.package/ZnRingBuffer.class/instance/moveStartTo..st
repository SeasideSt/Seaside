operations
moveStartTo: anInteger
	self checkBoundsFor: anInteger.
	
	offset := (offset + anInteger - 1) \\ self size