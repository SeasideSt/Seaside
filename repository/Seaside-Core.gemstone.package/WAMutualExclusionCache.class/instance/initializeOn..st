initialization
initializeOn: aCache
	self initialize.
	mutex := WAMutex new.
	cache := aCache