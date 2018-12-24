initialization
initialize
	(WAAdmin register: self asApplicationAt: 'javascript/scriptaculous-components')
		preferenceAt: #scriptGeneratorClass put: PTScriptGenerator;
		addLibrary: PTDevelopmentLibrary;
		addLibrary: SUDevelopmentLibrary;
		addLibrary: SUComponentLibrary;
		addLibrary: SUAllTestLibrary