configuration
defaultConfiguration
	^ super defaultConfiguration
		addParent: RRSystemConfiguration instance;
		yourself