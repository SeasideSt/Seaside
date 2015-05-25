configuration
defaultConfiguration
	^ WAUserConfiguration new
		addParent: WAFrameOptionsAllowFromFilterConfiguration instance;
		yourself