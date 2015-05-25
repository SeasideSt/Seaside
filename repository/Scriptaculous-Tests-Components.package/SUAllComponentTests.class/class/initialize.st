initialization
initialize
	(WAAdmin register: self asApplicationAt: 'javascript/scriptaculous-components')
		addLibrary: PTDevelopmentLibrary;
		addLibrary: SUDevelopmentLibrary;
		addLibrary: SUComponentLibrary;
		addLibrary: SUAllTestLibrary