configuration
defaultConfiguration
	^ super defaultConfiguration
		removeParent: WARequestHandlingConfiguration instance;
		addParent: WARegistryConfiguration instance;
		yourself