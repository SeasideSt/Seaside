configuration
defaultConfiguration
	^ WAUserConfiguration new
		addParent: WAFrameOptionsFilterConfiguration instance;
		yourself