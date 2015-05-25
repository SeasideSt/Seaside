registration
configureNewApplication: anApplication
	| filter |
	anApplication configuration
		removeParent: WAApplicationConfiguration instance; "make the chain slightly cleaner"
		addParent: WARenderLoopConfiguration instance;
		addParent: self applicationDefaults.
		
	filter := WAExceptionFilter new.
	filter configuration addParent: self applicationExceptionHandlingDefaults.
	anApplication addFilter: filter