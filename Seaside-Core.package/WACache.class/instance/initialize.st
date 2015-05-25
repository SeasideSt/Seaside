initialization
initialize
	super initialize.
	self initializeCollections.
	self initializeMutex.
	self setExpiryPolicy: WALastAccessExpiryPolicy new.
	self setReapingStrategy: WAAccessIntervalReapingStrategy new.
	self setMissStrategy: WACacheMissStrategy new.
	self setRemovalAction: WANotifyRemovalAction new