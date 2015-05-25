initialization
initialize
	| application |
	application := WAAdmin register: self asApplicationAt: 'javascript/jquery-ui'.
	application preferenceAt: #scriptGeneratorClass put: JQScriptGenerator.
	application
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary