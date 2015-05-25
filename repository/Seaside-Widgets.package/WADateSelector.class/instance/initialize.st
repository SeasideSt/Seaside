initialization
initialize
	super initialize.
	startYear := Date today year - 1.
	endYear := Date today year + 5.
	self date: self dateClass today