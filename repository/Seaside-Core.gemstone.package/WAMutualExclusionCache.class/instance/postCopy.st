copying
postCopy
	super postCopy.
	mutex := WAMutex new.
	cache := cache copy