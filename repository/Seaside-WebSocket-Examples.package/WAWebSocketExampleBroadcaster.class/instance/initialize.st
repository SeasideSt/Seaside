initialization
initialize
	super initialize.
	sockets := OrderedCollection new.
	mutex := WAMutex new