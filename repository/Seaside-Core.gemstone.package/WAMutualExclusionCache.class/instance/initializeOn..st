initialization
initializeOn: aCache
	self initialize.
	mutex := WAGemStoneMutex new.
	cache := aCache