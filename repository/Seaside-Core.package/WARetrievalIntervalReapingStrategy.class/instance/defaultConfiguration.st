configuration
defaultConfiguration
	^ super defaultConfiguration
		addParent: WARetrievalIntervalReapingStrategyConfiguration instance;
		yourself