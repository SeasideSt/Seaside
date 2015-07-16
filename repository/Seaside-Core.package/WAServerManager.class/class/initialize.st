class initialization
initialize
	self initializeDefaultValueHolder.
	GRPlatform current
		addToStartUpList: self;
		addToShutDownList: self