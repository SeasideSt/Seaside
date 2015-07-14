initialization
initialize
	super initialize.
	self initializeCollections.
	self initializeMutex.
	self setExpiryPolicy: WARcLastAccessExpiryPolicy new.
	self setReapingStrategy: WANoReapingStrategy new.
	self setMissStrategy: WACacheMissStrategy new.
	self setRemovalAction: WANotifyRemovalAction new