copying
postCopy
	super postCopy.
	"At this point we are sharing the mutex with the original object. This means
	we can safely copy our dictionaries and our plugins."
	mutex critical: [
		keysByObject := keysByObject copy.
		objectsByKey := objectsByKey copy.
		
		self setExpiryPolicy: self expiryPolicy copy.
		self setMissStrategy: self missStrategy copy.
		self setRemovalAction: self removalAction copy.
		self setReapingStrategy: self reapingStrategy copy ].
	"Now we're done and have all our own data so we want our own mutex."
	self initializeMutex