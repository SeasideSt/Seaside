initialization
unload
	GRPlatform current
		removeFromStartUpList: self;
		removeFromShutDownList: self.
	self shutDown