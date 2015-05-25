initialization
initialize
	super initialize.
	counters := (1 to: 5) collect: [ :each | WACounter new ]