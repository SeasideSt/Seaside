configuration
defaultConfiguration
	^ super defaultConfiguration
		addParent: WANoReapingStrategyConfiguration instance;
		yourself