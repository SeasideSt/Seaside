configuration
defaultConfiguration
	^ super defaultConfiguration
		addParent: WAAccessIntervalReapingStrategyConfiguration instance;
		yourself