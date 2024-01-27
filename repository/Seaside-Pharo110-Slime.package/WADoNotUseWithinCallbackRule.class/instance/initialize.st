initialization
initialize
	super initialize.
	self matchesAny: (self selectors
			collect: [ :each | '``@receiver' , (self genericPatternForSelector: each) ])