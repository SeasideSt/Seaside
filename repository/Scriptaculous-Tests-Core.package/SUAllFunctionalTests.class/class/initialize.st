initialization
initialize
	(WAAdmin register: self asApplicationAt: 'javascript/scriptaculous')
		addLibrary: PTDevelopmentLibrary;
		addLibrary: SUDevelopmentLibrary;
		addLibrary: SUAllTestLibrary