class initialization
initialize
	self ensureDefaultValueHolder.
	GRPlatform current
		addToStartUpList: self;
		addToShutDownList: self