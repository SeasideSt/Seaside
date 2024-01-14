initialization
initialize

	super initialize.
	self matchesAny: (WASlime callbackSelectors collect: [ :each |
		'`html `msg' , (self genericPatternForSelector: each) ])