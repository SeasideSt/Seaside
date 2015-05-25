configuration
defaultConfiguration
	^ super defaultConfiguration
		addParent: WACacheTimeoutConfiguration instance;
		yourself