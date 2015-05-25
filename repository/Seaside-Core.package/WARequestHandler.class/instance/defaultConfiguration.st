configuration
defaultConfiguration
	^ WAUserConfiguration new
		addParent: WARequestHandlingConfiguration instance;
		yourself