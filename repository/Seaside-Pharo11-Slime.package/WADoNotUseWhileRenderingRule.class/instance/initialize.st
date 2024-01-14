initialization
initialize

	super initialize.
	self matchesAny: (self selectors
			collect: [ :each | 'self' , (self genericPatternForSelector: each) ])