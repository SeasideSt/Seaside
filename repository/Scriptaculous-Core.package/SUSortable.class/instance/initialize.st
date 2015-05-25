initialization
initialize
	super initialize.
	self format: (JSStream on: '/^(.*)$/')