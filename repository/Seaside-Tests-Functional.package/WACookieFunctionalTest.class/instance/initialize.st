initialization
initialize
	super initialize.
	self firstPath: self application url pathStringUnencoded.
	self secondPath: self application url pathStringUnencoded