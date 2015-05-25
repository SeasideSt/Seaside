configuration
defaultConfiguration
	^ WAUserConfiguration new
		addParent: WAStrictTransportSecurityFilterConfiguration instance;
		yourself