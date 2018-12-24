initialization
initialize
	(WAAdmin register: self asApplicationAt: 'javascript/scriptaculous')
		preferenceAt: #scriptGeneratorClass put: PTScriptGenerator;
		addLibrary: PTDevelopmentLibrary;
		addLibrary: SUDevelopmentLibrary;
		addLibrary: SUAllTestLibrary