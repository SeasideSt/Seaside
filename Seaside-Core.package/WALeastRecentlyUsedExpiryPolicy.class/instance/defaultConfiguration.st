configuration
defaultConfiguration
	^ super defaultConfiguration
		addParent: WACacheCapacityConfiguration instance;
		yourself