configuration
defaultConfiguration
	^ super defaultConfiguration
		removeParent: WARequestHandlingConfiguration instance;
		addParent: WAFileHandlerConfiguration instance;
		yourself