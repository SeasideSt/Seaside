initialization
initialize
	super initialize.
	self secure: false.
	self discard: false.
	self httpOnly: false.
	self version: 1