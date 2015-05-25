configuration
defaultConfiguration
	^ super defaultConfiguration
		removeParent: WARegistryConfiguration instance;
		addParent: WAApplicationConfiguration instance;
		yourself