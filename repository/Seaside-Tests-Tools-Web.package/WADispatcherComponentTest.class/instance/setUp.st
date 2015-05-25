running
setUp
	super setUp.
	rootHandler := WADispatcher new.
	rootHandler := rootHandler register: WADispatcher new at: 'seaside'.
	childHandler := rootHandler register: WADispatcher new at: 'child'.
	configApplication := WAAdmin register: WAConfigurationBrowser asApplicationAt: 'config' in: rootHandler.
	normalApplication := WAAdmin register: WAApplication 
		at: 'counter'
		in: childHandler.
	normalApplication configuration addParent: WARenderLoopConfiguration instance.
	normalApplication 
		preferenceAt: #rootClass
		put: WAConfigurationBrowser