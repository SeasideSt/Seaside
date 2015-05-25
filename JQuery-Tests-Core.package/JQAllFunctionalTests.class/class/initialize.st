initialization
initialize
	| application |
	application := WAAdmin register: self asApplicationAt: 'javascript/jquery'.
	application preferenceAt: #scriptGeneratorClass put: JQScriptGenerator.
	application 
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQAllFunctionalTestsLibrary.

	application := WAAdmin register: WAAllFunctionalTests asApplicationAt: 'tests/functional-ajaxified'.
	application preferenceAt: #scriptGeneratorClass put: JQScriptGenerator.
	application
		preferenceAt: #sessionClass put: WAExpirySession;
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQAjaxifierLibrary