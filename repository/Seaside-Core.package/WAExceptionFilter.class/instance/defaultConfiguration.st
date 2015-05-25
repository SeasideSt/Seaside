configuration
defaultConfiguration
	^ WAUserConfiguration new
		addParent: WAExceptionFilterConfiguration instance;
		yourself